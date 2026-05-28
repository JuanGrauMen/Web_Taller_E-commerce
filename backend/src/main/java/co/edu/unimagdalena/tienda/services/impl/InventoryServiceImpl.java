package co.edu.unimagdalena.tienda.services.impl;

import co.edu.unimagdalena.tienda.services.dto.InventoryDtos.InventoryResponse;
import co.edu.unimagdalena.tienda.services.dto.InventoryDtos.UpdateInventoryRequest;
import co.edu.unimagdalena.tienda.exception.ResourceNotFoundException;
import co.edu.unimagdalena.tienda.exception.ValidationException;
import co.edu.unimagdalena.tienda.mappers.InventoryMapper;
import co.edu.unimagdalena.tienda.repositories.InventoryRepository;
import co.edu.unimagdalena.tienda.services.InventoryService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@RequiredArgsConstructor
@Transactional
public class InventoryServiceImpl implements InventoryService {

    private final InventoryRepository repository;
    private final InventoryMapper mapper;

    @Override
    public InventoryResponse update(Long productId, UpdateInventoryRequest request) {
        if (request.availableStock() < 0 || request.minimumStock() < 0) {
            throw new ValidationException("Stock values cannot be negative");
        }
        var inventory = repository.findByProductId(productId)
                .orElseThrow(() -> new ResourceNotFoundException("Inventory for product", productId));
        inventory.setAvailableStock(request.availableStock());
        inventory.setMinimumStock(request.minimumStock());
        return mapper.toResponse(repository.save(inventory));
    }

    @Override
    @Transactional(readOnly = true)
    public InventoryResponse getByProductId(Long productId) {
        return repository.findByProductId(productId)
                .map(mapper::toResponse)
                .orElseThrow(() -> new ResourceNotFoundException("Inventory for product", productId));
    }
}
