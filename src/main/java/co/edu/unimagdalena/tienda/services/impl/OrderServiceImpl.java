package co.edu.unimagdalena.tienda.services.impl;

import co.edu.unimagdalena.tienda.services.dto.OrderDtos.CancelOrderRequest;
import co.edu.unimagdalena.tienda.services.dto.OrderDtos.CreateOrderItemRequest;
import co.edu.unimagdalena.tienda.services.dto.OrderDtos.CreateOrderRequest;
import co.edu.unimagdalena.tienda.services.dto.OrderDtos.OrderResponse;
import co.edu.unimagdalena.tienda.entities.Customer;
import co.edu.unimagdalena.tienda.entities.Inventory;
import co.edu.unimagdalena.tienda.entities.Order;
import co.edu.unimagdalena.tienda.entities.OrderItem;
import co.edu.unimagdalena.tienda.entities.OrderStatusHistory;
import co.edu.unimagdalena.tienda.entities.Product;
import co.edu.unimagdalena.tienda.enums.CustomerStatus;
import co.edu.unimagdalena.tienda.enums.OrderStatus;
import co.edu.unimagdalena.tienda.exception.BusinessException;
import co.edu.unimagdalena.tienda.exception.ResourceNotFoundException;
import co.edu.unimagdalena.tienda.exception.ValidationException;
import co.edu.unimagdalena.tienda.mappers.OrderMapper;
import co.edu.unimagdalena.tienda.repositories.AddressRepository;
import co.edu.unimagdalena.tienda.repositories.CustomerRepository;
import co.edu.unimagdalena.tienda.repositories.InventoryRepository;
import co.edu.unimagdalena.tienda.repositories.OrderRepository;
import co.edu.unimagdalena.tienda.repositories.ProductRepository;
import co.edu.unimagdalena.tienda.services.OrderService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.time.Instant;
import java.util.ArrayList;
import java.util.List;

@Service
@RequiredArgsConstructor
@Transactional
public class OrderServiceImpl implements OrderService {

    private final OrderRepository orderRepository;
    private final CustomerRepository customerRepository;
    private final AddressRepository addressRepository;
    private final ProductRepository productRepository;
    private final InventoryRepository inventoryRepository;
    private final OrderMapper mapper;

    @Override
    public OrderResponse create(CreateOrderRequest request) {
        if (request.items() == null || request.items().isEmpty()) {
            throw new ValidationException("Order must contain at least one item");
        }

        var customer = findCustomer(request.customerId());
        if (customer.getStatus() != CustomerStatus.ACTIVE) {
            throw new BusinessException("Inactive customer cannot create orders");
        }

        if (!addressRepository.existsByIdAndCustomerId(request.addressId(), request.customerId())) {
            throw new ValidationException("Address does not belong to customer");
        }
        var address = addressRepository.findById(request.addressId())
                .orElseThrow(() -> new ResourceNotFoundException("Address", request.addressId()));

        var order = Order.builder()
                .customer(customer)
                .shippingAddress(address)
                .status(OrderStatus.CREATED)
                .build();

        BigDecimal total = BigDecimal.ZERO;
        List<OrderItem> items = new ArrayList<>();
        for (CreateOrderItemRequest itemRequest : request.items()) {
            if (itemRequest.quantity() <= 0) {
                throw new ValidationException("Item quantity must be greater than zero");
            }
            Product product = findProduct(itemRequest.productId());
            if (!product.isActive()) {
                throw new BusinessException("Inactive product cannot be ordered");
            }
            BigDecimal subtotal = product.getPrice().multiply(BigDecimal.valueOf(itemRequest.quantity()));
            var item = OrderItem.builder()
                    .order(order)
                    .product(product)
                    .quantity(itemRequest.quantity())
                    .unitPrice(product.getPrice())
                    .subtotal(subtotal)
                    .build();
            items.add(item);
            total = total.add(subtotal);
        }

        order.setItems(items);
        order.setTotal(total);
        order.getStatusHistory().add(OrderStatusHistory.builder()
                .order(order)
                .fromStatus(null)
                .toStatus(OrderStatus.CREATED)
                .note("Order created")
                .build());

        return mapper.toResponse(orderRepository.save(order));
    }

    @Override
    @Transactional(readOnly = true)
    public OrderResponse get(Long id) {
        return mapper.toResponse(findOrder(id));
    }

    @Override
    @Transactional(readOnly = true)
    public List<OrderResponse> findByCustomerId(Long customerId) {
        return orderRepository.findByCustomerId(customerId).stream().map(mapper::toResponse).toList();
    }

    @Override
    @Transactional(readOnly = true)
    public List<OrderResponse> findByStatus(OrderStatus status) {
        return orderRepository.findByStatus(status).stream().map(mapper::toResponse).toList();
    }

    @Override
    @Transactional(readOnly = true)
    public List<OrderResponse> findByFilters(Long customerId, OrderStatus status, Instant from, Instant to,
                                             BigDecimal minTotal, BigDecimal maxTotal) {
        return orderRepository.findByFilters(customerId, status, from, to, minTotal, maxTotal)
                .stream()
                .map(mapper::toResponse)
                .toList();
    }

    @Override
    public OrderResponse pay(Long orderId) {
        var order = findOrder(orderId);
        if (order.getStatus() != OrderStatus.CREATED) {
            throw new BusinessException("Only CREATED orders can be paid");
        }

        for (OrderItem item : order.getItems()) {
            Inventory inventory = inventoryRepository.findByProductId(item.getProduct().getId())
                    .orElseThrow(() -> new ResourceNotFoundException("Inventory for product", item.getProduct().getId()));
            if (inventory.getAvailableStock() < item.getQuantity()) {
                throw new ValidationException("Insufficient stock for product " + item.getProduct().getSku());
            }
        }

        for (OrderItem item : order.getItems()) {
            Inventory inventory = inventoryRepository.findByProductId(item.getProduct().getId())
                    .orElseThrow(() -> new ResourceNotFoundException("Inventory for product", item.getProduct().getId()));
            inventory.setAvailableStock(inventory.getAvailableStock() - item.getQuantity());
            inventoryRepository.save(inventory);
        }

        return changeStatus(order, OrderStatus.PAID, "Payment confirmed");
    }

    @Override
    public OrderResponse ship(Long orderId) {
        var order = findOrder(orderId);
        if (order.getStatus() != OrderStatus.PAID) {
            throw new BusinessException("Only PAID orders can be shipped");
        }
        return changeStatus(order, OrderStatus.SHIPPED, "Order shipped");
    }

    @Override
    public OrderResponse deliver(Long orderId) {
        var order = findOrder(orderId);
        if (order.getStatus() != OrderStatus.SHIPPED) {
            throw new BusinessException("Only SHIPPED orders can be delivered");
        }
        return changeStatus(order, OrderStatus.DELIVERED, "Order delivered");
    }

    @Override
    public OrderResponse cancel(Long orderId, CancelOrderRequest request) {
        var order = findOrder(orderId);
        if (order.getStatus() == OrderStatus.SHIPPED || order.getStatus() == OrderStatus.DELIVERED) {
            throw new BusinessException("This order can no longer be cancelled");
        }
        if (order.getStatus() == OrderStatus.CANCELLED) {
            throw new BusinessException("Order is already cancelled");
        }

        if (order.getStatus() == OrderStatus.PAID) {
            for (OrderItem item : order.getItems()) {
                Inventory inventory = inventoryRepository.findByProductId(item.getProduct().getId())
                        .orElseThrow(() -> new ResourceNotFoundException("Inventory for product", item.getProduct().getId()));
                inventory.setAvailableStock(inventory.getAvailableStock() + item.getQuantity());
                inventoryRepository.save(inventory);
            }
        }

        return changeStatus(order, OrderStatus.CANCELLED, request == null || request.note() == null
                ? "Order cancelled"
                : request.note());
    }

    private OrderResponse changeStatus(Order order, OrderStatus toStatus, String note) {
        OrderStatus previous = order.getStatus();
        order.setStatus(toStatus);
        order.getStatusHistory().add(OrderStatusHistory.builder()
                .order(order)
                .fromStatus(previous)
                .toStatus(toStatus)
                .note(note)
                .build());
        return mapper.toResponse(orderRepository.save(order));
    }

    private Order findOrder(Long id) {
        return orderRepository.findByIdWithItems(id)
                .orElseThrow(() -> new ResourceNotFoundException("Order", id));
    }

    private Customer findCustomer(Long id) {
        return customerRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Customer", id));
    }

    private Product findProduct(Long id) {
        return productRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Product", id));
    }
}
