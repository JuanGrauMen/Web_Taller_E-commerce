package co.edu.unimagdalena.tienda.controllers;

import co.edu.unimagdalena.tienda.services.ReportService;
import co.edu.unimagdalena.tienda.services.dto.ReportDtos.BestSellingProductResponse;
import co.edu.unimagdalena.tienda.services.dto.ReportDtos.LowStockProductResponse;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.bean.override.mockito.MockitoBean;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import java.util.List;

import static org.mockito.Mockito.when;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.jsonPath;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

@SpringBootTest
class ReportControllerTest {

    @Autowired
    private WebApplicationContext wac;

    @MockitoBean
    private ReportService service;

    private MockMvc mockMvc;

    @BeforeEach
    void setUp() {
        mockMvc = MockMvcBuilders.webAppContextSetup(wac).build();
    }

    @Test
    void bestSellingProducts_returnsData() throws Exception {
        when(service.findBestSellingProducts(null, null, 10))
                .thenReturn(List.of(new BestSellingProductResponse(1L, "Libro", "SKU-1", 20)));

        mockMvc.perform(get("/api/reports/best-selling-products"))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$[0].productName").value("Libro"));
    }

    @Test
    void lowStockProducts_returnsData() throws Exception {
        when(service.findLowStockProducts())
                .thenReturn(List.of(new LowStockProductResponse(1L, "Libro", "SKU-1", 2, 5)));

        mockMvc.perform(get("/api/reports/low-stock-products"))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$[0].minimumStock").value(5));
    }
}
