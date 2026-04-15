package co.edu.unimagdalena.tienda.mappers;

import co.edu.unimagdalena.tienda.services.dto.CustomerDtos.CreateCustomerRequest;
import co.edu.unimagdalena.tienda.services.dto.CustomerDtos.CustomerResponse;
import co.edu.unimagdalena.tienda.entities.Customer;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.factory.Mappers;

@Mapper(componentModel = "spring")
public interface CustomerMapper {

    CustomerMapper INSTANCE = Mappers.getMapper(CustomerMapper.class);

    @Mapping(target = "id", ignore = true)
    @Mapping(target = "status", expression = "java(co.edu.unimagdalena.tienda.enums.CustomerStatus.ACTIVE)")
    @Mapping(target = "createdAt", ignore = true)
    @Mapping(target = "updatedAt", ignore = true)
    @Mapping(target = "addresses", ignore = true)
    Customer toEntity(CreateCustomerRequest request);

    CustomerResponse toResponse(Customer customer);
}
