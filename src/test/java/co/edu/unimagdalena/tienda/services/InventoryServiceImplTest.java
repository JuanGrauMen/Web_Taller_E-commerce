package co.edu.unimagdalena.tienda.services;

import co.edu.unimagdalena.tienda.services.dto.InventoryDtos.InventoryResponse;
import co.edu.unimagdalena.tienda.services.dto.InventoryDtos.UpdateInventoryRequest;
import co.edu.unimagdalena.tienda.entities.Inventory;
import co.edu.unimagdalena.tienda.entities.Product;
import co.edu.unimagdalena.tienda.exception.ResourceNotFoundException;
import co.edu.unimagdalena.tienda.mappers.InventoryMapper;
import co.edu.unimagdalena.tienda.repositories.InventoryRepository;
import co.edu.unimagdalena.tienda.services.impl.InventoryServiceImpl;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;

import java.util.Optional;

import static org.assertj.core.api.Assertions.assertThat;
import static org.assertj.core.api.Assertions.assertThatThrownBy;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.when;

@ExtendWith(MockitoExtension.class)
class InventoryServiceImplTest {

    @Mock private InventoryRepository repository;
    @Mock private InventoryMapper mapper;

    @InjectMocks
    private InventoryServiceImpl service;

    @Test
    void update_updatesStockValues() {
        var product = Product.builder().id(1L).name("P").sku("S").build();
        var inventory = Inventory.builder().id(1L).product(product).availableStock(5).minimumStock(2).build();
        when(repository.findByProductId(1L)).thenReturn(Optional.of(inventory));
        when(repository.save(inventory)).thenReturn(inventory);
        when(mapper.toResponse(inventory)).thenReturn(new InventoryResponse(1L, 1L, 20, 5));

        var result = service.update(1L, new UpdateInventoryRequest(20, 5));

        assertThat(result.availableStock()).isEqualTo(20);
    }

    @Test
    void getByProductId_throwsWhenNotFound() {
        when(repository.findByProductId(99L)).thenReturn(Optional.empty());

        assertThatThrownBy(() -> service.getByProductId(99L))
                .isInstanceOf(ResourceNotFoundException.class);
    }
}
