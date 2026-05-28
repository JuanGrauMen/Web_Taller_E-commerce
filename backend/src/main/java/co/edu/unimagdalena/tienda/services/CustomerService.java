package co.edu.unimagdalena.tienda.services;

import co.edu.unimagdalena.tienda.services.dto.CustomerDtos.CreateCustomerRequest;
import co.edu.unimagdalena.tienda.services.dto.CustomerDtos.CustomerResponse;
import co.edu.unimagdalena.tienda.services.dto.CustomerDtos.UpdateCustomerRequest;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

public interface CustomerService {

    CustomerResponse create(CreateCustomerRequest request);

    CustomerResponse get(Long id);

    Page<CustomerResponse> findAll(Pageable pageable);

    CustomerResponse update(Long id, UpdateCustomerRequest request);
}
