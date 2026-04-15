package co.edu.unimagdalena.tienda.repositories;

import co.edu.unimagdalena.tienda.entities.Address;
import co.edu.unimagdalena.tienda.entities.Customer;
import co.edu.unimagdalena.tienda.entities.Order;
import co.edu.unimagdalena.tienda.enums.CustomerStatus;
import co.edu.unimagdalena.tienda.enums.OrderStatus;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.transaction.annotation.Transactional;

import static org.assertj.core.api.Assertions.assertThat;

@SpringBootTest
@Transactional
class OrderRepositoryTest {

    @Autowired
    private OrderRepository orderRepository;

    @Autowired
    private CustomerRepository customerRepository;

    @Autowired
    private AddressRepository addressRepository;

    private Customer savedCustomer() {
        return customerRepository.save(Customer.builder()
                .fullName("María")
                .email("maria@test.com")
                .status(CustomerStatus.ACTIVE)
                .build());
    }

    private Address savedAddress(Customer customer) {
        return addressRepository.save(Address.builder()
                .customer(customer)
                .line1("Cra 1 #1-1")
                .city("Santa Marta")
                .department("Magdalena")
                .build());
    }

    @Test
    void findByCustomerId_returnsOrdersForCustomer() {
        var customer = savedCustomer();
        var address = savedAddress(customer);
        orderRepository.save(Order.builder().customer(customer).shippingAddress(address).build());

        var result = orderRepository.findByCustomerId(customer.getId());

        assertThat(result).hasSize(1);
    }

    @Test
    void findByStatus_returnsMatchingOrders() {
        var customer = savedCustomer();
        var address = savedAddress(customer);
        orderRepository.save(Order.builder().customer(customer).shippingAddress(address).status(OrderStatus.CREATED).build());
        orderRepository.save(Order.builder().customer(customer).shippingAddress(address).status(OrderStatus.PAID).build());

        var created = orderRepository.findByStatus(OrderStatus.CREATED);
        var paid = orderRepository.findByStatus(OrderStatus.PAID);

        assertThat(created).hasSize(1);
        assertThat(paid).hasSize(1);
    }

    @Test
    void findByIdWithItems_returnsOrderWithFetchedItems() {
        var customer = savedCustomer();
        var address = savedAddress(customer);
        var order = orderRepository.save(Order.builder().customer(customer).shippingAddress(address).build());

        var result = orderRepository.findByIdWithItems(order.getId());

        assertThat(result).isPresent();
        assertThat(result.get().getId()).isEqualTo(order.getId());
    }
}
