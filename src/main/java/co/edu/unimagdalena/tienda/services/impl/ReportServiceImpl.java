package co.edu.unimagdalena.tienda.services.impl;

import co.edu.unimagdalena.tienda.services.dto.ReportDtos.BestSellingProductResponse;
import co.edu.unimagdalena.tienda.services.dto.ReportDtos.LowStockProductResponse;
import co.edu.unimagdalena.tienda.services.dto.ReportDtos.MonthlyIncomeResponse;
import co.edu.unimagdalena.tienda.services.dto.ReportDtos.TopCustomerResponse;
import co.edu.unimagdalena.tienda.repositories.InventoryRepository;
import co.edu.unimagdalena.tienda.repositories.OrderItemRepository;
import co.edu.unimagdalena.tienda.repositories.OrderRepository;
import co.edu.unimagdalena.tienda.services.ReportService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.time.Instant;
import java.util.List;

@Service
@RequiredArgsConstructor
@Transactional(readOnly = true)
public class ReportServiceImpl implements ReportService {

    private final OrderItemRepository orderItemRepository;
    private final OrderRepository orderRepository;
    private final InventoryRepository inventoryRepository;

    @Override
    public List<BestSellingProductResponse> findBestSellingProducts(Instant from, Instant to, int limit) {
        return orderItemRepository.findBestSellingProducts(from, to).stream()
                .limit(limit)
                .map(row -> new BestSellingProductResponse(
                        ((Number) row[0]).longValue(),
                        (String) row[1],
                        (String) row[2],
                        ((Number) row[3]).longValue()
                ))
                .toList();
    }

    @Override
    public List<MonthlyIncomeResponse> findMonthlyIncome() {
        return orderRepository.findMonthlyIncome().stream()
                .map(row -> {
                    int year = ((Number) row[0]).intValue();
                    int monthNumber = ((Number) row[1]).intValue();
                    BigDecimal income = (BigDecimal) row[2];
                    String month = "%d-%02d".formatted(year, monthNumber);
                    return new MonthlyIncomeResponse(month, income);
                })
                .toList();
    }

    @Override
    public List<TopCustomerResponse> findTopCustomers(int limit) {
        return orderRepository.findTopCustomers().stream()
                .limit(limit)
                .map(row -> new TopCustomerResponse(
                        ((Number) row[0]).longValue(),
                        (String) row[1],
                        (BigDecimal) row[2]
                ))
                .toList();
    }

    @Override
    public List<LowStockProductResponse> findLowStockProducts() {
        return inventoryRepository.findLowStockProducts().stream()
                .map(inventory -> new LowStockProductResponse(
                        inventory.getProduct().getId(),
                        inventory.getProduct().getName(),
                        inventory.getProduct().getSku(),
                        inventory.getAvailableStock(),
                        inventory.getMinimumStock()
                ))
                .toList();
    }

}
