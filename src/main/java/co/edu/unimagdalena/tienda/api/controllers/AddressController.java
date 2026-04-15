package co.edu.unimagdalena.tienda.api.controllers;

import co.edu.unimagdalena.tienda.services.AddressService;
import co.edu.unimagdalena.tienda.services.dto.AddressDtos.AddressResponse;
import co.edu.unimagdalena.tienda.services.dto.AddressDtos.CreateAddressRequest;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/api/v1/customers/{customerId}/addresses")
@RequiredArgsConstructor
public class AddressController {

    private final AddressService service;

    @PostMapping
    @ResponseStatus(HttpStatus.CREATED)
    public AddressResponse create(@PathVariable Long customerId, @Valid @RequestBody CreateAddressRequest request) {
        return service.create(customerId, request);
    }

    @GetMapping
    public List<AddressResponse> findByCustomerId(@PathVariable Long customerId) {
        return service.findByCustomerId(customerId);
    }
}
