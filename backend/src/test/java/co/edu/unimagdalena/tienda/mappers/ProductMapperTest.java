package co.edu.unimagdalena.tienda.mappers;

import co.edu.unimagdalena.tienda.services.dto.ProductDtos.CreateProductRequest;
import co.edu.unimagdalena.tienda.entities.Category;
import co.edu.unimagdalena.tienda.entities.Product;
import org.junit.jupiter.api.Test;

import java.math.BigDecimal;

import static org.assertj.core.api.Assertions.assertThat;

class ProductMapperTest {

    @Test
    void toEntity_mapsCreateRequest() {
        var request = new CreateProductRequest(2L, "Sudadera", "SKU-01", new BigDecimal("79900"));

        var entity = ProductMapper.INSTANCE.toEntity(request);

        assertThat(entity.getName()).isEqualTo("Sudadera");
        assertThat(entity.getSku()).isEqualTo("SKU-01");
        assertThat(entity.getPrice()).isEqualByComparingTo("79900");
        assertThat(entity.isActive()).isTrue();
    }

    @Test
    void toResponse_mapsProductAndCategory() {
        var category = Category.builder().id(2L).name("Ropa").build();
        var product = Product.builder()
                .id(5L)
                .category(category)
                .name("Sudadera")
                .sku("SKU-01")
                .price(new BigDecimal("79900"))
                .active(true)
                .build();

        var response = ProductMapper.INSTANCE.toResponse(product);

        assertThat(response.id()).isEqualTo(5L);
        assertThat(response.categoryId()).isEqualTo(2L);
        assertThat(response.categoryName()).isEqualTo("Ropa");
    }
}
