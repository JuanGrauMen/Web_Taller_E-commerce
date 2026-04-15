package co.edu.unimagdalena.tienda.mappers;

import co.edu.unimagdalena.tienda.entities.Address;
import co.edu.unimagdalena.tienda.entities.Customer;
import co.edu.unimagdalena.tienda.entities.Order;
import co.edu.unimagdalena.tienda.entities.OrderItem;
import co.edu.unimagdalena.tienda.entities.Product;
import co.edu.unimagdalena.tienda.enums.CustomerStatus;
import co.edu.unimagdalena.tienda.enums.OrderStatus;
import org.junit.jupiter.api.Test;

import java.math.BigDecimal;
import java.time.Instant;
import java.util.List;

import static org.assertj.core.api.Assertions.assertThat;

class OrderMapperTest {

    @Test
    void toResponse_mapsNestedFields() {
        var customer = Customer.builder().id(1L).fullName("Cliente Uno").email("a@a.com").status(CustomerStatus.ACTIVE).build();
        var address = Address.builder().id(3L).customer(customer).line1("Calle 1").city("Santa Marta").department("Magdalena").build();
        var product = Product.builder().id(9L).name("Libro").sku("LIB-1").price(new BigDecimal("12000")).build();
        var item = OrderItem.builder().id(7L).product(product).quantity(2).unitPrice(new BigDecimal("12000")).subtotal(new BigDecimal("24000")).build();
        var order = Order.builder()
                .id(10L)
                .customer(customer)
                .shippingAddress(address)
                .status(OrderStatus.CREATED)
                .total(new BigDecimal("24000"))
                .items(List.of(item))
                .createdAt(Instant.now())
                .updatedAt(Instant.now())
                .build();

        var response = OrderMapper.INSTANCE.toResponse(order);

        assertThat(response.customerId()).isEqualTo(1L);
        assertThat(response.addressId()).isEqualTo(3L);
        assertThat(response.items()).hasSize(1);
        assertThat(response.items().get(0).productSku()).isEqualTo("LIB-1");
    }
}
