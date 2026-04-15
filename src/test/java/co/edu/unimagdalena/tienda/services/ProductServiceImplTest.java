package co.edu.unimagdalena.tienda.services;

import co.edu.unimagdalena.tienda.services.dto.ProductDtos.CreateProductRequest;
import co.edu.unimagdalena.tienda.services.dto.ProductDtos.ProductResponse;
import co.edu.unimagdalena.tienda.entities.Category;
import co.edu.unimagdalena.tienda.entities.Product;
import co.edu.unimagdalena.tienda.exception.ConflictException;
import co.edu.unimagdalena.tienda.mappers.ProductMapper;
import co.edu.unimagdalena.tienda.repositories.CategoryRepository;
import co.edu.unimagdalena.tienda.repositories.InventoryRepository;
import co.edu.unimagdalena.tienda.repositories.ProductRepository;
import co.edu.unimagdalena.tienda.services.impl.ProductServiceImpl;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;

import java.math.BigDecimal;
import java.util.Optional;

import static org.assertj.core.api.Assertions.assertThat;
import static org.assertj.core.api.Assertions.assertThatThrownBy;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.when;

@ExtendWith(MockitoExtension.class)
class ProductServiceImplTest {

    @Mock private ProductRepository productRepository;
    @Mock private CategoryRepository categoryRepository;
    @Mock private InventoryRepository inventoryRepository;
    @Mock private ProductMapper mapper;

    @InjectMocks
    private ProductServiceImpl service;

    @Test
    void create_rejectsDuplicateSku() {
        when(productRepository.existsBySkuIgnoreCase("SKU-1")).thenReturn(true);

        assertThatThrownBy(() -> service.create(new CreateProductRequest(1L, "Prod", "SKU-1", BigDecimal.TEN)))
                .isInstanceOf(ConflictException.class);
    }

    @Test
    void create_savesProductAndCreatesInventory() {
        var category = Category.builder().id(1L).name("Libros").build();
        var product = Product.builder().id(10L).name("Prod").sku("SKU-2").price(BigDecimal.TEN).category(category).build();
        when(productRepository.existsBySkuIgnoreCase("SKU-2")).thenReturn(false);
        when(categoryRepository.findById(1L)).thenReturn(Optional.of(category));
        when(mapper.toEntity(any(CreateProductRequest.class))).thenReturn(product);
        when(productRepository.save(product)).thenReturn(product);
        when(mapper.toResponse(product)).thenReturn(new ProductResponse(10L, 1L, "Libros", "Prod", "SKU-2", BigDecimal.TEN, true));

        var result = service.create(new CreateProductRequest(1L, "Prod", "SKU-2", BigDecimal.TEN));

        assertThat(result.sku()).isEqualTo("SKU-2");
    }
}
