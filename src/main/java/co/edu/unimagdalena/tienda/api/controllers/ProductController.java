package co.edu.unimagdalena.tienda.api.controllers;

import co.edu.unimagdalena.tienda.services.InventoryService;
import co.edu.unimagdalena.tienda.services.ProductService;
import co.edu.unimagdalena.tienda.services.dto.InventoryDtos.InventoryResponse;
import co.edu.unimagdalena.tienda.services.dto.InventoryDtos.UpdateInventoryRequest;
import co.edu.unimagdalena.tienda.services.dto.ProductDtos.CreateProductRequest;
import co.edu.unimagdalena.tienda.services.dto.ProductDtos.ProductResponse;
import co.edu.unimagdalena.tienda.services.dto.ProductDtos.UpdateProductRequest;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/api/v1/products")
@RequiredArgsConstructor
public class ProductController {

    private final ProductService productService;
    private final InventoryService inventoryService;

    @PostMapping
    @ResponseStatus(HttpStatus.CREATED)
    public ProductResponse create(@Valid @RequestBody CreateProductRequest request) {
        return productService.create(request);
    }

    @GetMapping("/{id}")
    public ProductResponse get(@PathVariable Long id) {
        return productService.get(id);
    }

    @GetMapping
    public List<ProductResponse> findAll(@RequestParam(required = false) Long categoryId) {
        return categoryId == null ? productService.findAll() : productService.findByCategoryId(categoryId);
    }

    @PutMapping("/{id}")
    public ProductResponse update(@PathVariable Long id, @Valid @RequestBody UpdateProductRequest request) {
        return productService.update(id, request);
    }

    @GetMapping("/{id}/inventory")
    public InventoryResponse getInventory(@PathVariable Long id) {
        return inventoryService.getByProductId(id);
    }

    @PutMapping("/{id}/inventory")
    public InventoryResponse updateInventory(@PathVariable Long id, @Valid @RequestBody UpdateInventoryRequest request) {
        return inventoryService.update(id, request);
    }
}
