package co.edu.unimagdalena.tienda.services;

import co.edu.unimagdalena.tienda.services.dto.OrderDtos.CancelOrderRequest;
import co.edu.unimagdalena.tienda.services.dto.OrderDtos.CreateOrderItemRequest;
import co.edu.unimagdalena.tienda.services.dto.OrderDtos.CreateOrderRequest;
import co.edu.unimagdalena.tienda.services.dto.OrderDtos.OrderResponse;
import co.edu.unimagdalena.tienda.entities.Address;
import co.edu.unimagdalena.tienda.entities.Customer;
import co.edu.unimagdalena.tienda.entities.Inventory;
import co.edu.unimagdalena.tienda.entities.Order;
import co.edu.unimagdalena.tienda.entities.OrderItem;
import co.edu.unimagdalena.tienda.entities.Product;
import co.edu.unimagdalena.tienda.enums.CustomerStatus;
import co.edu.unimagdalena.tienda.enums.OrderStatus;
import co.edu.unimagdalena.tienda.exception.BusinessException;
import co.edu.unimagdalena.tienda.exception.ValidationException;
import co.edu.unimagdalena.tienda.mappers.OrderMapper;
import co.edu.unimagdalena.tienda.repositories.AddressRepository;
import co.edu.unimagdalena.tienda.repositories.CustomerRepository;
import co.edu.unimagdalena.tienda.repositories.InventoryRepository;
import co.edu.unimagdalena.tienda.repositories.OrderRepository;
import co.edu.unimagdalena.tienda.repositories.ProductRepository;
import co.edu.unimagdalena.tienda.services.impl.OrderServiceImpl;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;

import java.math.BigDecimal;
import java.util.List;
import java.util.Optional;

import static org.assertj.core.api.Assertions.assertThatThrownBy;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

@ExtendWith(MockitoExtension.class)
class OrderServiceImplTest {

    @Mock private OrderRepository orderRepository;
    @Mock private CustomerRepository customerRepository;
    @Mock private AddressRepository addressRepository;
    @Mock private ProductRepository productRepository;
    @Mock private InventoryRepository inventoryRepository;
    @Mock private OrderMapper mapper;

    @InjectMocks
    private OrderServiceImpl service;

    @Test
    void create_rejectsOrdersWithoutItems() {
        assertThatThrownBy(() -> service.create(new CreateOrderRequest(1L, 1L, List.of())))
                .isInstanceOf(ValidationException.class);
    }

    @Test
    void create_rejectsInvalidQuantity() {
        var customer = Customer.builder().id(1L).fullName("Ana").email("ana@a.com").status(CustomerStatus.ACTIVE).build();
        var address = Address.builder().id(1L).customer(customer).line1("Cra 1").city("Santa Marta").department("Magdalena").build();
        when(customerRepository.findById(1L)).thenReturn(Optional.of(customer));
        when(addressRepository.existsByIdAndCustomerId(1L, 1L)).thenReturn(true);
        when(addressRepository.findById(1L)).thenReturn(Optional.of(address));

        assertThatThrownBy(() -> service.create(new CreateOrderRequest(1L, 1L, List.of(new CreateOrderItemRequest(2L, 0)))))
                .isInstanceOf(ValidationException.class);
    }

    @Test
    void pay_rejectsWhenStockIsInsufficient() {
        var order = buildOrder(OrderStatus.CREATED);
        when(orderRepository.findByIdWithItems(1L)).thenReturn(Optional.of(order));
        when(inventoryRepository.findByProductId(9L)).thenReturn(
                Optional.of(Inventory.builder().product(order.getItems().get(0).getProduct()).availableStock(1).minimumStock(0).build()));

        assertThatThrownBy(() -> service.pay(1L)).isInstanceOf(ValidationException.class);
    }

    @Test
    void pay_discountsInventoryAndSavesOrder() {
        var order = buildOrder(OrderStatus.CREATED);
        var inventory = Inventory.builder().product(order.getItems().get(0).getProduct()).availableStock(10).minimumStock(1).build();
        when(orderRepository.findByIdWithItems(1L)).thenReturn(Optional.of(order));
        when(inventoryRepository.findByProductId(9L)).thenReturn(Optional.of(inventory));
        when(orderRepository.save(any(Order.class))).thenReturn(order);
        when(mapper.toResponse(any(Order.class))).thenReturn(
                new OrderResponse(1L, 1L, "Ana", 1L, OrderStatus.PAID, new BigDecimal("40000"), List.of(), null, null));

        service.pay(1L);

        verify(inventoryRepository).save(inventory);
        verify(orderRepository).save(order);
    }

    @Test
    void cancel_paidOrderRestoresStock() {
        var order = buildOrder(OrderStatus.PAID);
        var inventory = Inventory.builder().product(order.getItems().get(0).getProduct()).availableStock(3).minimumStock(1).build();
        when(orderRepository.findByIdWithItems(1L)).thenReturn(Optional.of(order));
        when(inventoryRepository.findByProductId(9L)).thenReturn(Optional.of(inventory));
        when(orderRepository.save(any(Order.class))).thenReturn(order);
        when(mapper.toResponse(any(Order.class))).thenReturn(
                new OrderResponse(1L, 1L, "Ana", 1L, OrderStatus.CANCELLED, new BigDecimal("40000"), List.of(), null, null));

        service.cancel(1L, new CancelOrderRequest("Cliente cancela"));

        verify(inventoryRepository).save(inventory);
    }

    @Test
    void ship_rejectsInvalidTransition() {
        var order = buildOrder(OrderStatus.CREATED);
        when(orderRepository.findByIdWithItems(1L)).thenReturn(Optional.of(order));

        assertThatThrownBy(() -> service.ship(1L)).isInstanceOf(BusinessException.class);
    }

    @Test
    void create_rejectsInactiveCustomer() {
        var customer = Customer.builder().id(1L).fullName("Ana").email("ana@a.com").status(CustomerStatus.INACTIVE).build();
        when(customerRepository.findById(1L)).thenReturn(Optional.of(customer));

        assertThatThrownBy(() -> service.create(new CreateOrderRequest(1L, 1L, List.of(new CreateOrderItemRequest(2L, 1)))))
                .isInstanceOf(BusinessException.class)
                .hasMessageContaining("Inactive");
    }

    private Order buildOrder(OrderStatus status) {
        var customer = Customer.builder().id(1L).fullName("Ana").email("ana@a.com").status(CustomerStatus.ACTIVE).build();
        var address = Address.builder().id(1L).customer(customer).line1("Cra 1").city("Santa Marta").department("Magdalena").build();
        var product = Product.builder().id(9L).name("Libro").sku("SKU-1").price(new BigDecimal("20000")).active(true).build();
        var order = Order.builder()
                .id(1L).customer(customer).shippingAddress(address).status(status).total(new BigDecimal("40000"))
                .build();
        var item = OrderItem.builder()
                .id(5L).order(order).product(product).quantity(2)
                .unitPrice(new BigDecimal("20000")).subtotal(new BigDecimal("40000"))
                .build();
        order.setItems(List.of(item));
        return order;
    }
}
