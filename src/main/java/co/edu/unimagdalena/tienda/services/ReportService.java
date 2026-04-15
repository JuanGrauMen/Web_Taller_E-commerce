package co.edu.unimagdalena.tienda.services;

import co.edu.unimagdalena.tienda.services.dto.ReportDtos.BestSellingProductResponse;
import co.edu.unimagdalena.tienda.services.dto.ReportDtos.LowStockProductResponse;
import co.edu.unimagdalena.tienda.services.dto.ReportDtos.MonthlyIncomeResponse;
import co.edu.unimagdalena.tienda.services.dto.ReportDtos.TopCustomerResponse;

import java.time.Instant;
import java.util.List;

public interface ReportService {

    List<BestSellingProductResponse> findBestSellingProducts(Instant from, Instant to, int limit);

    List<MonthlyIncomeResponse> findMonthlyIncome();

    List<TopCustomerResponse> findTopCustomers(int limit);

    List<LowStockProductResponse> findLowStockProducts();
}
