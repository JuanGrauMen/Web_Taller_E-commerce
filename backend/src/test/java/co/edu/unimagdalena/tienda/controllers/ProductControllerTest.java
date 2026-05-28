package co.edu.unimagdalena.tienda.controllers;

import co.edu.unimagdalena.tienda.exception.BusinessException;
import co.edu.unimagdalena.tienda.exception.ConflictException;
import co.edu.unimagdalena.tienda.services.InventoryService;
import co.edu.unimagdalena.tienda.services.ProductService;
import co.edu.unimagdalena.tienda.services.dto.InventoryDtos.InventoryResponse;
import co.edu.unimagdalena.tienda.services.dto.ProductDtos.ProductResponse;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;
import org.springframework.http.MediaType;
import org.springframework.test.context.bean.override.mockito.MockitoBean;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import java.math.BigDecimal;
import java.util.List;

import static org.mockito.ArgumentMatchers.any;
import static org.mockito.ArgumentMatchers.eq;
import static org.mockito.Mockito.when;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.jsonPath;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

@SpringBootTest
class ProductControllerTest {

    @Autowired
    private WebApplicationContext wac;

    @MockitoBean
    private ProductService productService;

    @MockitoBean
    private InventoryService inventoryService;

    private MockMvc mockMvc;

    @BeforeEach
    void setUp() {
        mockMvc = MockMvcBuilders.webAppContextSetup(wac).build();
    }

    @Test
    void create_returns201() throws Exception {
        var response = new ProductResponse(1L, 2L, "Libros", "Libro Java", "LIB-001", new BigDecimal("35000"), true);
        when(productService.create(any())).thenReturn(response);

        mockMvc.perform(post("/api/products")
                        .contentType(MediaType.APPLICATION_JSON)
                        .content("{\"categoryId\":2,\"name\":\"Libro Java\",\"sku\":\"LIB-001\",\"price\":35000}"))
                .andExpect(status().isCreated())
                .andExpect(jsonPath("$.sku").value("LIB-001"));
    }

    @Test
    void create_returns409OnDuplicateSku() throws Exception {
        when(productService.create(any())).thenThrow(new ConflictException("SKU already exists"));

        mockMvc.perform(post("/api/products")
                        .contentType(MediaType.APPLICATION_JSON)
                        .content("{\"categoryId\":2,\"name\":\"Libro\",\"sku\":\"DUP-001\",\"price\":10000}"))
                .andExpect(status().isConflict());
    }

    @Test
    void create_returns422OnBusinessError() throws Exception {
        when(productService.create(any())).thenThrow(new BusinessException("Invalid product"));

        mockMvc.perform(post("/api/products")
                        .contentType(MediaType.APPLICATION_JSON)
                        .content("{\"categoryId\":2,\"name\":\"Libro\",\"sku\":\"SKU-X\",\"price\":10000}"))
                .andExpect(status().isUnprocessableEntity());
    }

    @Test
    void findAll_filtersByCategory() throws Exception {
        when(productService.findByCategoryId(eq(2L), any(Pageable.class))).thenReturn(new PageImpl<>(List.of(
                new ProductResponse(1L, 2L, "Libros", "Libro Java", "LIB-001", new BigDecimal("35000"), true)
        )));

        mockMvc.perform(get("/api/products").param("categoryId", "2"))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$.content.length()").value(1));
    }

    @Test
    void getInventory_returns200() throws Exception {
        when(inventoryService.getByProductId(1L)).thenReturn(new InventoryResponse(10L, 1L, 50, 5));

        mockMvc.perform(get("/api/products/1/inventory"))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$.availableStock").value(50));
    }
}
