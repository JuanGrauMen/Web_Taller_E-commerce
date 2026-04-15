package co.edu.unimagdalena.tienda.mappers;

import co.edu.unimagdalena.tienda.services.dto.CustomerDtos.CreateCustomerRequest;
import co.edu.unimagdalena.tienda.entities.Customer;
import co.edu.unimagdalena.tienda.enums.CustomerStatus;
import org.junit.jupiter.api.Test;

import static org.assertj.core.api.Assertions.assertThat;

class CustomerMapperTest {

    @Test
    void toEntity_mapsCreateRequest() {
        var request = new CreateCustomerRequest("Ana Perez", "ana@correo.com");

        var entity = CustomerMapper.INSTANCE.toEntity(request);

        assertThat(entity.getFullName()).isEqualTo("Ana Perez");
        assertThat(entity.getEmail()).isEqualTo("ana@correo.com");
        assertThat(entity.getStatus()).isEqualTo(CustomerStatus.ACTIVE);
    }

    @Test
    void toResponse_mapsCustomer() {
        var customer = Customer.builder()
                .id(1L)
                .fullName("Ana Perez")
                .email("ana@correo.com")
                .status(CustomerStatus.ACTIVE)
                .build();

        var response = CustomerMapper.INSTANCE.toResponse(customer);

        assertThat(response.id()).isEqualTo(1L);
        assertThat(response.fullName()).isEqualTo("Ana Perez");
        assertThat(response.email()).isEqualTo("ana@correo.com");
    }
}
