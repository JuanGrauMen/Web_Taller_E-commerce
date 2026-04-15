package co.edu.unimagdalena.tienda.services.dto;

import co.edu.unimagdalena.tienda.enums.OrderStatus;

import java.math.BigDecimal;
import java.time.Instant;

public class ReportDtos {

    public record BestSellingProductResponse(
            Long productId,
            String productName,
            String sku,
            long unitsSold
    ) {
    }

    public record MonthlyIncomeResponse(
            String month,
            BigDecimal income
    ) {
    }

    public record TopCustomerResponse(
            Long customerId,
            String customerName,
            BigDecimal totalBilled
    ) {
    }

    public record LowStockProductResponse(
            Long productId,
            String productName,
            String sku,
            int availableStock,
            int minimumStock
    ) {
    }

    public record TopCategoryResponse(
            Long categoryId,
            String categoryName,
            long unitsSold
    ) {
    }

    public record OrderStatusHistoryResponse(
            Long id,
            OrderStatus fromStatus,
            OrderStatus toStatus,
            Instant changedAt,
            String note
    ) {
    }
}
