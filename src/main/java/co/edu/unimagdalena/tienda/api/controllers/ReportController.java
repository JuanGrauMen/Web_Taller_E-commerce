package co.edu.unimagdalena.tienda.api.controllers;

import co.edu.unimagdalena.tienda.services.ReportService;
import co.edu.unimagdalena.tienda.services.dto.ReportDtos.BestSellingProductResponse;
import co.edu.unimagdalena.tienda.services.dto.ReportDtos.LowStockProductResponse;
import co.edu.unimagdalena.tienda.services.dto.ReportDtos.MonthlyIncomeResponse;
import co.edu.unimagdalena.tienda.services.dto.ReportDtos.TopCustomerResponse;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.time.Instant;
import java.util.List;

@RestController
@RequestMapping("/api/v1/reports")
@RequiredArgsConstructor
public class ReportController {

    private final ReportService service;

    @GetMapping("/best-selling-products")
    public List<BestSellingProductResponse> bestSellingProducts(
            @RequestParam(required = false) Instant from,
            @RequestParam(required = false) Instant to,
            @RequestParam(defaultValue = "10") int limit
    ) {
        return service.findBestSellingProducts(from, to, limit);
    }

    @GetMapping("/monthly-income")
    public List<MonthlyIncomeResponse> monthlyIncome() {
        return service.findMonthlyIncome();
    }

    @GetMapping("/top-customers")
    public List<TopCustomerResponse> topCustomers(@RequestParam(defaultValue = "10") int limit) {
        return service.findTopCustomers(limit);
    }

    @GetMapping("/low-stock-products")
    public List<LowStockProductResponse> lowStockProducts() {
        return service.findLowStockProducts();
    }
}
