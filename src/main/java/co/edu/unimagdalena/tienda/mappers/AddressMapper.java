package co.edu.unimagdalena.tienda.mappers;

import co.edu.unimagdalena.tienda.services.dto.AddressDtos.AddressResponse;
import co.edu.unimagdalena.tienda.services.dto.AddressDtos.CreateAddressRequest;
import co.edu.unimagdalena.tienda.entities.Address;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.factory.Mappers;

@Mapper(componentModel = "spring")
public interface AddressMapper {

    AddressMapper INSTANCE = Mappers.getMapper(AddressMapper.class);

    @Mapping(target = "id", ignore = true)
    @Mapping(target = "customer", ignore = true)
    Address toEntity(CreateAddressRequest request);

    @Mapping(target = "customerId", source = "customer.id")
    AddressResponse toResponse(Address address);
}
