package co.edu.unimagdalena.tienda.controllers;

import co.edu.unimagdalena.tienda.api.controllers.OrderController;
import co.edu.unimagdalena.tienda.api.error.GlobalExceptionHandler;
import co.edu.unimagdalena.tienda.enums.OrderStatus;
import co.edu.unimagdalena.tienda.exception.BusinessException;
import co.edu.unimagdalena.tienda.exception.ResourceNotFoundException;
import co.edu.unimagdalena.tienda.exception.ValidationException;
import co.edu.unimagdalena.tienda.services.OrderService;
import co.edu.unimagdalena.tienda.services.dto.OrderDtos.OrderResponse;
import tools.jackson.databind.ObjectMapper;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.webmvc.test.autoconfigure.WebMvcTest;
import org.springframework.context.annotation.Import;
import org.springframework.http.MediaType;
import org.springframework.test.context.bean.override.mockito.MockitoBean;
import org.springframework.test.web.servlet.MockMvc;

import java.math.BigDecimal;
import java.util.List;

import static org.mockito.ArgumentMatchers.any;
import static org.mockito.ArgumentMatchers.eq;
import static org.mockito.Mockito.when;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.put;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.jsonPath;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

@WebMvcTest(OrderController.class)
@Import(GlobalExceptionHandler.class)
class OrderControllerTest {

    @Autowired
    private MockMvc mockMvc;

    @Autowired
    private ObjectMapper objectMapper;

    @MockitoBean
    private OrderService service;

    private OrderResponse sampleOrder(OrderStatus status) {
        return new OrderResponse(1L, 1L, "Ana", 1L, status, new BigDecimal("50000"), List.of(), null, null);
    }

    @Test
    void create_returns201() throws Exception {
        when(service.create(any())).thenReturn(sampleOrder(OrderStatus.CREATED));

        mockMvc.perform(post("/api/v1/orders")
                        .contentType(MediaType.APPLICATION_JSON)
                        .content("{\"customerId\":1,\"addressId\":1,\"items\":[{\"productId\":2,\"quantity\":1}]}"))
                .andExpect(status().isCreated())
                .andExpect(jsonPath("$.status").value("CREATED"));
    }

    @Test
    void create_returns400WhenBodyInvalid() throws Exception {
        mockMvc.perform(post("/api/v1/orders")
                        .contentType(MediaType.APPLICATION_JSON)
                        .content("{\"customerId\":1}"))
                .andExpect(status().isBadRequest());
    }

    @Test
    void get_returns404WhenNotFound() throws Exception {
        when(service.get(99L)).thenThrow(new ResourceNotFoundException("Order", 99L));

        mockMvc.perform(get("/api/v1/orders/99"))
                .andExpect(status().isNotFound());
    }

    @Test
    void pay_returns200() throws Exception {
        when(service.pay(1L)).thenReturn(sampleOrder(OrderStatus.PAID));

        mockMvc.perform(put("/api/v1/orders/1/pay"))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$.status").value("PAID"));
    }

    @Test
    void pay_returns400WhenStockInsufficient() throws Exception {
        when(service.pay(1L)).thenThrow(new ValidationException("Insufficient stock"));

        mockMvc.perform(put("/api/v1/orders/1/pay"))
                .andExpect(status().isBadRequest());
    }

    @Test
    void ship_returns422WhenBusinessRuleViolated() throws Exception {
        when(service.ship(1L)).thenThrow(new BusinessException("Only PAID orders can be shipped"));

        mockMvc.perform(put("/api/v1/orders/1/ship"))
                .andExpect(status().isUnprocessableEntity())
                .andExpect(jsonPath("$.status").value(422));
    }

    @Test
    void cancel_returns200WithNote() throws Exception {
        when(service.cancel(eq(1L), any())).thenReturn(sampleOrder(OrderStatus.CANCELLED));

        mockMvc.perform(put("/api/v1/orders/1/cancel")
                        .contentType(MediaType.APPLICATION_JSON)
                        .content("{\"note\":\"El cliente cancelo\"}"))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$.status").value("CANCELLED"));
    }
}
