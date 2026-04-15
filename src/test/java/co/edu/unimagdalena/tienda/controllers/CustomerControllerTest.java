package co.edu.unimagdalena.tienda.controllers;

import co.edu.unimagdalena.tienda.api.controllers.CustomerController;
import co.edu.unimagdalena.tienda.api.error.GlobalExceptionHandler;
import co.edu.unimagdalena.tienda.enums.CustomerStatus;
import co.edu.unimagdalena.tienda.exception.ConflictException;
import co.edu.unimagdalena.tienda.exception.ResourceNotFoundException;
import co.edu.unimagdalena.tienda.services.CustomerService;
import co.edu.unimagdalena.tienda.services.dto.CustomerDtos.CustomerResponse;
import tools.jackson.databind.ObjectMapper;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.webmvc.test.autoconfigure.WebMvcTest;
import org.springframework.context.annotation.Import;
import org.springframework.http.MediaType;
import org.springframework.test.context.bean.override.mockito.MockitoBean;
import org.springframework.test.web.servlet.MockMvc;

import java.util.List;

import static org.mockito.ArgumentMatchers.any;
import static org.mockito.ArgumentMatchers.eq;
import static org.mockito.Mockito.when;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.put;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.jsonPath;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

@WebMvcTest(CustomerController.class)
@Import(GlobalExceptionHandler.class)
class CustomerControllerTest {

    @Autowired
    private MockMvc mockMvc;

    @Autowired
    private ObjectMapper objectMapper;

    @MockitoBean
    private CustomerService service;

    @Test
    void create_returns201WithBody() throws Exception {
        var response = new CustomerResponse(1L, "Luis Garcia", "luis@correo.com", CustomerStatus.ACTIVE);
        when(service.create(any())).thenReturn(response);

        mockMvc.perform(post("/api/v1/customers")
                        .contentType(MediaType.APPLICATION_JSON)
                        .content("{\"fullName\":\"Luis Garcia\",\"email\":\"luis@correo.com\"}"))
                .andExpect(status().isCreated())
                .andExpect(jsonPath("$.id").value(1))
                .andExpect(jsonPath("$.email").value("luis@correo.com"));
    }

    @Test
    void create_returns400WhenEmailMissing() throws Exception {
        mockMvc.perform(post("/api/v1/customers")
                        .contentType(MediaType.APPLICATION_JSON)
                        .content("{\"fullName\":\"Luis Garcia\"}"))
                .andExpect(status().isBadRequest());
    }

    @Test
    void create_returns409WhenEmailExists() throws Exception {
        when(service.create(any())).thenThrow(new ConflictException("Email already exists"));

        mockMvc.perform(post("/api/v1/customers")
                        .contentType(MediaType.APPLICATION_JSON)
                        .content("{\"fullName\":\"Luis\",\"email\":\"luis@correo.com\"}"))
                .andExpect(status().isConflict())
                .andExpect(jsonPath("$.status").value(409));
    }

    @Test
    void get_returns200WhenFound() throws Exception {
        when(service.get(1L)).thenReturn(new CustomerResponse(1L, "Luis", "luis@correo.com", CustomerStatus.ACTIVE));

        mockMvc.perform(get("/api/v1/customers/1"))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$.fullName").value("Luis"));
    }

    @Test
    void get_returns404WhenNotFound() throws Exception {
        when(service.get(99L)).thenThrow(new ResourceNotFoundException("Customer", 99L));

        mockMvc.perform(get("/api/v1/customers/99"))
                .andExpect(status().isNotFound())
                .andExpect(jsonPath("$.status").value(404));
    }

    @Test
    void findAll_returnsList() throws Exception {
        when(service.findAll()).thenReturn(List.of(
                new CustomerResponse(1L, "A", "a@a.com", CustomerStatus.ACTIVE),
                new CustomerResponse(2L, "B", "b@b.com", CustomerStatus.INACTIVE)
        ));

        mockMvc.perform(get("/api/v1/customers"))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$.length()").value(2));
    }

    @Test
    void update_returns200() throws Exception {
        var response = new CustomerResponse(1L, "Nuevo Nombre", "luis@correo.com", CustomerStatus.INACTIVE);
        when(service.update(eq(1L), any())).thenReturn(response);

        mockMvc.perform(put("/api/v1/customers/1")
                        .contentType(MediaType.APPLICATION_JSON)
                        .content("{\"fullName\":\"Nuevo Nombre\",\"status\":\"INACTIVE\"}"))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$.status").value("INACTIVE"));
    }
}
