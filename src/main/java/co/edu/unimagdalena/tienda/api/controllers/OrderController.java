package co.edu.unimagdalena.tienda.api.controllers;

import co.edu.unimagdalena.tienda.enums.OrderStatus;
import co.edu.unimagdalena.tienda.services.OrderService;
import co.edu.unimagdalena.tienda.services.dto.OrderDtos.CancelOrderRequest;
import co.edu.unimagdalena.tienda.services.dto.OrderDtos.CreateOrderRequest;
import co.edu.unimagdalena.tienda.services.dto.OrderDtos.OrderResponse;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

import java.math.BigDecimal;
import java.time.Instant;
import java.util.List;

@RestController
@RequestMapping("/api/v1/orders")
@RequiredArgsConstructor
public class OrderController {

    private final OrderService service;

    @PostMapping
    @ResponseStatus(HttpStatus.CREATED)
    public OrderResponse create(@Valid @RequestBody CreateOrderRequest request) {
        return service.create(request);
    }

    @GetMapping("/{id}")
    public OrderResponse get(@PathVariable Long id) {
        return service.get(id);
    }

    @GetMapping
    public List<OrderResponse> findByFilters(
            @RequestParam(required = false) Long customerId,
            @RequestParam(required = false) OrderStatus status,
            @RequestParam(required = false) Instant from,
            @RequestParam(required = false) Instant to,
            @RequestParam(required = false) BigDecimal minTotal,
            @RequestParam(required = false) BigDecimal maxTotal
    ) {
        return service.findByFilters(customerId, status, from, to, minTotal, maxTotal);
    }

    @PutMapping("/{id}/pay")
    public OrderResponse pay(@PathVariable Long id) {
        return service.pay(id);
    }

    @PutMapping("/{id}/ship")
    public OrderResponse ship(@PathVariable Long id) {
        return service.ship(id);
    }

    @PutMapping("/{id}/deliver")
    public OrderResponse deliver(@PathVariable Long id) {
        return service.deliver(id);
    }

    @PutMapping("/{id}/cancel")
    public OrderResponse cancel(@PathVariable Long id, @RequestBody(required = false) CancelOrderRequest request) {
        return service.cancel(id, request);
    }
}
