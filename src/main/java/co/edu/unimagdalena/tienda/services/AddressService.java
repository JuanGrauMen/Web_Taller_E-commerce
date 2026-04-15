package co.edu.unimagdalena.tienda.services;

import co.edu.unimagdalena.tienda.services.dto.AddressDtos.AddressResponse;
import co.edu.unimagdalena.tienda.services.dto.AddressDtos.CreateAddressRequest;

import java.util.List;

public interface AddressService {

    AddressResponse create(Long customerId, CreateAddressRequest request);

    List<AddressResponse> findByCustomerId(Long customerId);
}
