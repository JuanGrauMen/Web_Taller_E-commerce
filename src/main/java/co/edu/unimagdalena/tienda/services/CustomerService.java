package co.edu.unimagdalena.tienda.services;

import co.edu.unimagdalena.tienda.services.dto.CustomerDtos.CreateCustomerRequest;
import co.edu.unimagdalena.tienda.services.dto.CustomerDtos.CustomerResponse;
import co.edu.unimagdalena.tienda.services.dto.CustomerDtos.UpdateCustomerRequest;

import java.util.List;

public interface CustomerService {

    CustomerResponse create(CreateCustomerRequest request);

    CustomerResponse get(Long id);

    List<CustomerResponse> findAll();

    CustomerResponse update(Long id, UpdateCustomerRequest request);
}
