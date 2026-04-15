package co.edu.unimagdalena.tienda.repositories;

import co.edu.unimagdalena.tienda.entities.Category;
import co.edu.unimagdalena.tienda.entities.Product;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;

import static org.assertj.core.api.Assertions.assertThat;

@SpringBootTest
@Transactional
class ProductRepositoryTest {

    @Autowired
    private ProductRepository productRepository;

    @Autowired
    private CategoryRepository categoryRepository;

    private Category savedCategory() {
        return categoryRepository.save(Category.builder().name("Libros").build());
    }

    @Test
    void existsBySkuIgnoreCase_trueForExistingSku() {
        productRepository.save(Product.builder()
                .category(savedCategory())
                .name("Libro Java")
                .sku("LIB-001")
                .price(new BigDecimal("35000"))
                .build());

        assertThat(productRepository.existsBySkuIgnoreCase("lib-001")).isTrue();
        assertThat(productRepository.existsBySkuIgnoreCase("lib-999")).isFalse();
    }

    @Test
    void findByActiveTrueAndCategoryId_returnsOnlyActiveProducts() {
        var cat = savedCategory();
        productRepository.save(Product.builder().category(cat).name("Activo").sku("A-1").price(BigDecimal.TEN).active(true).build());
        productRepository.save(Product.builder().category(cat).name("Inactivo").sku("I-1").price(BigDecimal.TEN).active(false).build());

        var result = productRepository.findByActiveTrueAndCategoryId(cat.getId());

        assertThat(result).hasSize(1);
        assertThat(result.get(0).getSku()).isEqualTo("A-1");
    }
}
