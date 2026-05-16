package co.edu.unimagdalena.tienda.repositories;

import co.edu.unimagdalena.tienda.entities.*;
import co.edu.unimagdalena.tienda.enums.CustomerStatus;
import co.edu.unimagdalena.tienda.enums.OrderStatus;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;

import static org.assertj.core.api.Assertions.assertThat;

@SpringBootTest
@Transactional
class OrderItemRepositoryTest {

    @Autowired OrderItemRepository orderItemRepository;
    @Autowired OrderRepository orderRepository;
    @Autowired CustomerRepository customerRepository;
    @Autowired AddressRepository addressRepository;
    @Autowired CategoryRepository categoryRepository;
    @Autowired ProductRepository productRepository;

    private Customer savedCustomer(String email) {
        return customerRepository.save(Customer.builder()
                .fullName("Test User")
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

    private Product savedProduct(String sku) {
        var category = categoryRepository.save(Category.builder().name("Cat-" + sku).build());
        return productRepository.save(Product.builder()
                .category(category)
                .name("Prod-" + sku)
                .sku(sku)
                .price(new BigDecimal("25000"))
                .build());
    }

    @Test
    void findBestSellingProducts_returnsProductsOrderedByQuantityDescending() {
        var customer = savedCustomer("best@test.com");
        var address = savedAddress(customer);
        var productA = savedProduct("BEST-A");
        var productB = savedProduct("BEST-B");

        var order = orderRepository.save(Order.builder()
                .customer(customer)
                .shippingAddress(address)
                .status(OrderStatus.PAID)
                .total(new BigDecimal("100000"))
                .build());

        orderItemRepository.save(OrderItem.builder()
                .order(order).product(productA).quantity(10)
                .unitPrice(productA.getPrice()).subtotal(productA.getPrice().multiply(BigDecimal.TEN))
                .build());
        orderItemRepository.save(OrderItem.builder()
                .order(order).product(productB).quantity(3)
                .unitPrice(productB.getPrice()).subtotal(productB.getPrice().multiply(new BigDecimal("3")))
                .build());

        var result = orderItemRepository.findBestSellingProducts(null, null);

        assertThat(result).hasSize(2);
        assertThat((String) result.get(0)[2]).isEqualTo(productA.getSku());
        assertThat(((Number) result.get(0)[3]).longValue()).isEqualTo(10);
    }

    @Test
    void findBestSellingProducts_excludesOrdersWithCreatedStatus() {
        var customer = savedCustomer("exclude@test.com");
        var address = savedAddress(customer);
        var product = savedProduct("EXCL-001");

        var cancelledOrder = orderRepository.save(Order.builder()
                .customer(customer)
                .shippingAddress(address)
                .status(OrderStatus.CREATED)
                .total(BigDecimal.ZERO)
                .build());

        orderItemRepository.save(OrderItem.builder()
                .order(cancelledOrder).product(product).quantity(99)
                .unitPrice(product.getPrice()).subtotal(product.getPrice())
                .build());

        var result = orderItemRepository.findBestSellingProducts(null, null);

        assertThat(result).isEmpty();
    }
}
