package co.edu.unimagdalena.tienda.repositories;

import co.edu.unimagdalena.tienda.entities.Customer;
import co.edu.unimagdalena.tienda.enums.CustomerStatus;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.transaction.annotation.Transactional;

import static org.assertj.core.api.Assertions.assertThat;

@SpringBootTest
@Transactional
class CustomerRepositoryTest {

    @Autowired
    private CustomerRepository repository;

    @Test
    void findByEmailIgnoreCase_findsStoredCustomer() {
        repository.save(Customer.builder()
                .fullName("Luis")
                .email("luis@correo.com")
                .status(CustomerStatus.ACTIVE)
                .build());

        var result = repository.findByEmailIgnoreCase("LUIS@CORREO.COM");

        assertThat(result).isPresent();
        assertThat(result.get().getFullName()).isEqualTo("Luis");
    }

    @Test
    void existsByEmailIgnoreCase_returnsTrueForExistingEmail() {
        repository.save(Customer.builder()
                .fullName("Ana")
                .email("ana@correo.com")
                .status(CustomerStatus.ACTIVE)
                .build());

        assertThat(repository.existsByEmailIgnoreCase("ANA@CORREO.COM")).isTrue();
        assertThat(repository.existsByEmailIgnoreCase("otro@correo.com")).isFalse();
    }

    @Test
    void save_persistsCustomerWithDefaultActiveStatus() {
        var saved = repository.save(Customer.builder()
                .fullName("Pedro")
                .email("pedro@correo.com")
                .build());

        assertThat(saved.getId()).isNotNull();
        assertThat(saved.getStatus()).isEqualTo(CustomerStatus.ACTIVE);
        assertThat(saved.getCreatedAt()).isNotNull();
    }
}
