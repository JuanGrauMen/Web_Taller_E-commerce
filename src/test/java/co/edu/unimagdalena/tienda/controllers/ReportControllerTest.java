package co.edu.unimagdalena.tienda.controllers;

import co.edu.unimagdalena.tienda.api.controllers.ReportController;
import co.edu.unimagdalena.tienda.api.error.GlobalExceptionHandler;
import co.edu.unimagdalena.tienda.services.ReportService;
import co.edu.unimagdalena.tienda.services.dto.ReportDtos.BestSellingProductResponse;
import co.edu.unimagdalena.tienda.services.dto.ReportDtos.LowStockProductResponse;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.webmvc.test.autoconfigure.WebMvcTest;
import org.springframework.context.annotation.Import;
import org.springframework.test.context.bean.override.mockito.MockitoBean;
import org.springframework.test.web.servlet.MockMvc;

import java.util.List;

import static org.mockito.Mockito.when;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.jsonPath;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

@WebMvcTest(ReportController.class)
@Import(GlobalExceptionHandler.class)
class ReportControllerTest {

    @Autowired
    private MockMvc mockMvc;

    @MockitoBean
    private ReportService service;

    @Test
    void bestSellingProducts_returnsData() throws Exception {
        when(service.findBestSellingProducts(null, null, 10))
                .thenReturn(List.of(new BestSellingProductResponse(1L, "Libro", "SKU-1", 20)));

        mockMvc.perform(get("/api/v1/reports/best-selling-products"))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$[0].productName").value("Libro"));
    }

    @Test
    void lowStockProducts_returnsData() throws Exception {
        when(service.findLowStockProducts())
                .thenReturn(List.of(new LowStockProductResponse(1L, "Libro", "SKU-1", 2, 5)));

        mockMvc.perform(get("/api/v1/reports/low-stock-products"))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$[0].minimumStock").value(5));
    }
}
