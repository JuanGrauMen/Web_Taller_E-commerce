package co.edu.unimagdalena.tienda.services.impl;

import co.edu.unimagdalena.tienda.services.dto.AddressDtos.AddressResponse;
import co.edu.unimagdalena.tienda.services.dto.AddressDtos.CreateAddressRequest;
import co.edu.unimagdalena.tienda.exception.ResourceNotFoundException;
import co.edu.unimagdalena.tienda.mappers.AddressMapper;
import co.edu.unimagdalena.tienda.repositories.AddressRepository;
import co.edu.unimagdalena.tienda.repositories.CustomerRepository;
import co.edu.unimagdalena.tienda.services.AddressService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@RequiredArgsConstructor
@Transactional
public class AddressServiceImpl implements AddressService {

    private final AddressRepository addressRepository;
    private final CustomerRepository customerRepository;
    private final AddressMapper mapper;

    @Override
    public AddressResponse create(Long customerId, CreateAddressRequest request) {
        var customer = customerRepository.findById(customerId)
                .orElseThrow(() -> new ResourceNotFoundException("Customer", customerId));

        if (request.defaultAddress()) {
            addressRepository.findByCustomerId(customerId).forEach(address -> address.setDefaultAddress(false));
        }

        var address = mapper.toEntity(request);
        address.setCustomer(customer);
        return mapper.toResponse(addressRepository.save(address));
    }

    @Override
    @Transactional(readOnly = true)
    public List<AddressResponse> findByCustomerId(Long customerId) {
        return addressRepository.findByCustomerId(customerId).stream().map(mapper::toResponse).toList();
    }
}
