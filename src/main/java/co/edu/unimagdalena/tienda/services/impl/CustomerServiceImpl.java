package co.edu.unimagdalena.tienda.services.impl;

import co.edu.unimagdalena.tienda.services.dto.CustomerDtos.CreateCustomerRequest;
import co.edu.unimagdalena.tienda.services.dto.CustomerDtos.CustomerResponse;
import co.edu.unimagdalena.tienda.services.dto.CustomerDtos.UpdateCustomerRequest;
import co.edu.unimagdalena.tienda.exception.ConflictException;
import co.edu.unimagdalena.tienda.exception.ResourceNotFoundException;
import co.edu.unimagdalena.tienda.mappers.CustomerMapper;
import co.edu.unimagdalena.tienda.repositories.CustomerRepository;
import co.edu.unimagdalena.tienda.services.CustomerService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@RequiredArgsConstructor
@Transactional
public class CustomerServiceImpl implements CustomerService {

    private final CustomerRepository repository;
    private final CustomerMapper mapper;

    @Override
    public CustomerResponse create(CreateCustomerRequest request) {
        if (repository.existsByEmailIgnoreCase(request.email())) {
            throw new ConflictException("Customer email already exists: " + request.email());
        }
        return mapper.toResponse(repository.save(mapper.toEntity(request)));
    }

    @Override
    @Transactional(readOnly = true)
    public CustomerResponse get(Long id) {
        return mapper.toResponse(findOrThrow(id));
    }

    @Override
    @Transactional(readOnly = true)
    public List<CustomerResponse> findAll() {
        return repository.findAll().stream().map(mapper::toResponse).toList();
    }

    @Override
    public CustomerResponse update(Long id, UpdateCustomerRequest request) {
        var customer = findOrThrow(id);
        customer.setFullName(request.fullName());
        customer.setStatus(request.status());
        return mapper.toResponse(repository.save(customer));
    }

    private co.edu.unimagdalena.tienda.entities.Customer findOrThrow(Long id) {
        return repository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Customer", id));
    }
}
