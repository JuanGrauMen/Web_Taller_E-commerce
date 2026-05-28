package co.edu.unimagdalena.tienda.services.impl;

import co.edu.unimagdalena.tienda.services.dto.ProductDtos.CreateProductRequest;
import co.edu.unimagdalena.tienda.services.dto.ProductDtos.ProductResponse;
import co.edu.unimagdalena.tienda.services.dto.ProductDtos.UpdateProductRequest;
import co.edu.unimagdalena.tienda.entities.Inventory;
import co.edu.unimagdalena.tienda.enums.OrderStatus;
import co.edu.unimagdalena.tienda.exception.BusinessException;
import co.edu.unimagdalena.tienda.exception.ConflictException;
import co.edu.unimagdalena.tienda.exception.ResourceNotFoundException;
import co.edu.unimagdalena.tienda.mappers.ProductMapper;
import co.edu.unimagdalena.tienda.repositories.CategoryRepository;
import co.edu.unimagdalena.tienda.repositories.InventoryRepository;
import co.edu.unimagdalena.tienda.repositories.ProductRepository;
import co.edu.unimagdalena.tienda.services.ProductService;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@RequiredArgsConstructor
@Transactional
public class ProductServiceImpl implements ProductService {

    private final ProductRepository productRepository;
    private final CategoryRepository categoryRepository;
    private final InventoryRepository inventoryRepository;
    private final ProductMapper mapper;

    @Override
    public ProductResponse create(CreateProductRequest request) {
        if (productRepository.existsBySkuIgnoreCase(request.sku())) {
            throw new ConflictException("SKU already exists: " + request.sku());
        }
        var category = categoryRepository.findById(request.categoryId())
                .orElseThrow(() -> new ResourceNotFoundException("Category", request.categoryId()));

        var product = mapper.toEntity(request);
        product.setCategory(category);
        var saved = productRepository.save(product);
        inventoryRepository.save(Inventory.builder()
                .product(saved)
                .availableStock(0)
                .minimumStock(0)
                .build());
        return mapper.toResponse(saved);
    }

    @Override
    @Transactional(readOnly = true)
    public ProductResponse get(Long id) {
        return mapper.toResponse(findOrThrow(id));
    }

    @Override
    @Transactional(readOnly = true)
    public Page<ProductResponse> findAll(Pageable pageable) {
        return productRepository.findActiveWithCategory(pageable).map(mapper::toResponse);
    }

    @Override
    @Transactional(readOnly = true)
    public Page<ProductResponse> findByCategoryId(Long categoryId, Pageable pageable) {
        return productRepository.findActiveByCategoryWithCategory(categoryId, pageable).map(mapper::toResponse);
    }

    @Override
    public ProductResponse update(Long id, UpdateProductRequest request) {
        var product = findOrThrow(id);
        if (!request.active() && product.getOrderItems().stream().anyMatch(item ->
                item.getOrder().getStatus() != OrderStatus.CANCELLED
                        && item.getOrder().getStatus() != OrderStatus.DELIVERED)) {
            throw new BusinessException("Cannot deactivate product with active orders");
        }
        product.setName(request.name());
        product.setPrice(request.price());
        product.setActive(request.active());
        return mapper.toResponse(productRepository.save(product));
    }

    private co.edu.unimagdalena.tienda.entities.Product findOrThrow(Long id) {
        return productRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Product", id));
    }
}
