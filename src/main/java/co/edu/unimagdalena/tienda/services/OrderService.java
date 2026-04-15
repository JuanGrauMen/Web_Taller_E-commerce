package co.edu.unimagdalena.tienda.services;

import co.edu.unimagdalena.tienda.services.dto.OrderDtos.CancelOrderRequest;
import co.edu.unimagdalena.tienda.services.dto.OrderDtos.CreateOrderRequest;
import co.edu.unimagdalena.tienda.services.dto.OrderDtos.OrderResponse;
import co.edu.unimagdalena.tienda.enums.OrderStatus;

import java.math.BigDecimal;
import java.time.Instant;
import java.util.List;

public interface OrderService {

    OrderResponse create(CreateOrderRequest request);

    OrderResponse get(Long id);

    List<OrderResponse> findByCustomerId(Long customerId);

    List<OrderResponse> findByStatus(OrderStatus status);

    List<OrderResponse> findByFilters(Long customerId, OrderStatus status, Instant from, Instant to,
                                      BigDecimal minTotal, BigDecimal maxTotal);

    OrderResponse pay(Long orderId);

    OrderResponse ship(Long orderId);

    OrderResponse deliver(Long orderId);

    OrderResponse cancel(Long orderId, CancelOrderRequest request);
}
