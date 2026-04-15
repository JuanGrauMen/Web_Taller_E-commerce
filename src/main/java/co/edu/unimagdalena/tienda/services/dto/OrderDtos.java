package co.edu.unimagdalena.tienda.services.dto;

import co.edu.unimagdalena.tienda.enums.OrderStatus;
import jakarta.validation.Valid;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.NotNull;

import java.math.BigDecimal;
import java.time.Instant;
import java.util.List;

public class OrderDtos {

    public record CreateOrderItemRequest(
            @NotNull Long productId,
            @Min(1) int quantity
    ) {
    }

    public record CreateOrderRequest(
            @NotNull Long customerId,
            @NotNull Long addressId,
            @NotEmpty @Valid List<CreateOrderItemRequest> items
    ) {
    }

    public record CancelOrderRequest(String note) {
    }

    public record OrderItemResponse(
            Long id,
            Long productId,
            String productName,
            String productSku,
            int quantity,
            BigDecimal unitPrice,
            BigDecimal subtotal
    ) {
    }

    public record OrderResponse(
            Long id,
            Long customerId,
            String customerName,
            Long addressId,
            OrderStatus status,
            BigDecimal total,
            List<OrderItemResponse> items,
            Instant createdAt,
            Instant updatedAt
    ) {
    }
}
