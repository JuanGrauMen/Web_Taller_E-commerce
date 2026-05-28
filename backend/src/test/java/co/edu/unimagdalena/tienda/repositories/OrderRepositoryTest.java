package co.edu.unimagdalena.tienda.repositories;

import co.edu.unimagdalena.tienda.entities.Address;
import co.edu.unimagdalena.tienda.entities.Customer;
import co.edu.unimagdalena.tienda.entities.Order;
import co.edu.unimagdalena.tienda.enums.CustomerStatus;
import co.edu.unimagdalena.tienda.enums.OrderStatus;
import co.edu.unimagdalena.tienda.repositories.spec.OrderSpecifications;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;

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
        return savedCustomer("maria@test.com");
    }

    private Customer savedCustomer(String email) {
        return customerRepository.save(Customer.builder()
                .fullName("María")
                .email(email)
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

    @Test
    void findByFilters_filterByCustomer_returnsOnlyMatchingOrders() {
        var c1 = savedCustomer("c1@test.com");
        var c2 = savedCustomer("c2@test.com");
        orderRepository.save(Order.builder().customer(c1).shippingAddress(savedAddress(c1)).build());
        orderRepository.save(Order.builder().customer(c2).shippingAddress(savedAddress(c2)).build());

        var spec = Specification.where(OrderSpecifications.hasCustomerId(c1.getId()));
        var result = orderRepository.findAll(spec);

        assertThat(result).hasSize(1);
        assertThat(result.get(0).getCustomer().getId()).isEqualTo(c1.getId());
    }

    @Test
    void findByFilters_filterByStatus_returnsOnlyMatchingStatus() {
        var customer = savedCustomer("status@test.com");
        var address = savedAddress(customer);
        orderRepository.save(Order.builder().customer(customer).shippingAddress(address).status(OrderStatus.PAID).total(new BigDecimal("50000")).build());
        orderRepository.save(Order.builder().customer(customer).shippingAddress(address).status(OrderStatus.CREATED).total(new BigDecimal("30000")).build());

        var spec = Specification.where(OrderSpecifications.hasStatus(OrderStatus.PAID));
        var result = orderRepository.findAll(spec);

        assertThat(result).hasSize(1);
        assertThat(result.get(0).getStatus()).isEqualTo(OrderStatus.PAID);
    }

    @Test
    void findByFilters_filterByTotalRange_returnsOrdersInRange() {
        var customer = savedCustomer("range@test.com");
        var address = savedAddress(customer);
        orderRepository.save(Order.builder().customer(customer).shippingAddress(address).total(new BigDecimal("10000")).build());
        orderRepository.save(Order.builder().customer(customer).shippingAddress(address).total(new BigDecimal("50000")).build());
        orderRepository.save(Order.builder().customer(customer).shippingAddress(address).total(new BigDecimal("100000")).build());

        var spec = Specification.where(OrderSpecifications.totalAtLeast(new BigDecimal("20000")))
                .and(OrderSpecifications.totalAtMost(new BigDecimal("80000")));
        var result = orderRepository.findAll(spec);

        assertThat(result).hasSize(1);
        assertThat(result.get(0).getTotal()).isEqualByComparingTo("50000");
    }

    @Test
    void findMonthlyIncome_sumsOnlyPaidShippedDeliveredOrders() {
        var customer = savedCustomer("income@test.com");
        var address = savedAddress(customer);
        orderRepository.save(Order.builder().customer(customer).shippingAddress(address)
                .status(OrderStatus.PAID).total(new BigDecimal("100000")).build());
        orderRepository.save(Order.builder().customer(customer).shippingAddress(address)
                .status(OrderStatus.DELIVERED).total(new BigDecimal("50000")).build());
        orderRepository.save(Order.builder().customer(customer).shippingAddress(address)
                .status(OrderStatus.CREATED).total(new BigDecimal("99999")).build()); // excluido

        var result = orderRepository.findMonthlyIncome();

        assertThat(result).isNotEmpty();
        var totalIncome = result.stream()
                .map(row -> (BigDecimal) row[2])
                .reduce(BigDecimal.ZERO, BigDecimal::add);
        assertThat(totalIncome).isEqualByComparingTo("150000");
    }

    @Test
    void findTopCustomers_ordersCustomersByTotalSpentDescending() {
        var cA = savedCustomer("top-a@test.com");
        var cB = savedCustomer("top-b@test.com");
        orderRepository.save(Order.builder().customer(cA).shippingAddress(savedAddress(cA))
                .status(OrderStatus.PAID).total(new BigDecimal("200000")).build());
        orderRepository.save(Order.builder().customer(cB).shippingAddress(savedAddress(cB))
                .status(OrderStatus.PAID).total(new BigDecimal("80000")).build());

        var result = orderRepository.findTopCustomers();

        assertThat(result).hasSize(2);
        assertThat(((Number) result.get(0)[0]).longValue()).isEqualTo(cA.getId());
        assertThat((BigDecimal) result.get(0)[2]).isEqualByComparingTo("200000");
    }
}
