package co.edu.unimagdalena.tienda.repositories;

import co.edu.unimagdalena.tienda.entities.Category;
import co.edu.unimagdalena.tienda.entities.Inventory;
import co.edu.unimagdalena.tienda.entities.Product;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;

import static org.assertj.core.api.Assertions.assertThat;

@SpringBootTest
@Transactional
class InventoryRepositoryTest {

    @Autowired
    private InventoryRepository inventoryRepository;

    @Autowired
    private ProductRepository productRepository;

    @Autowired
    private CategoryRepository categoryRepository;

    private Product savedProduct(String sku) {
        var cat = categoryRepository.save(Category.builder().name("Cat-" + sku).build());
        return productRepository.save(Product.builder()
                .category(cat).name("Prod-" + sku).sku(sku).price(BigDecimal.TEN).build());
    }

    @Test
    void findByProductId_returnsInventory() {
        var product = savedProduct("INV-001");
        var inventory = inventoryRepository.save(Inventory.builder()
                .product(product).availableStock(10).minimumStock(2).build());

        var result = inventoryRepository.findByProductId(product.getId());

        assertThat(result).isPresent();
        assertThat(result.get().getId()).isEqualTo(inventory.getId());
    }

    @Test
    void findLowStockProducts_returnsOnlyBelowMinimum() {
        var p1 = savedProduct("LOW-001");
        var p2 = savedProduct("LOW-002");
        inventoryRepository.save(Inventory.builder().product(p1).availableStock(1).minimumStock(5).build());
        inventoryRepository.save(Inventory.builder().product(p2).availableStock(10).minimumStock(5).build());

        var result = inventoryRepository.findLowStockProducts();

        assertThat(result).hasSize(1);
        assertThat(result.get(0).getProduct().getSku()).isEqualTo("LOW-001");
    }
}
