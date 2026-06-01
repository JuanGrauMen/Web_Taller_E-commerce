package co.edu.unimagdalena.tienda.services;

import co.edu.unimagdalena.tienda.services.dto.ProductDtos.CreateProductRequest;
import co.edu.unimagdalena.tienda.services.dto.ProductDtos.ProductResponse;
import co.edu.unimagdalena.tienda.services.dto.ProductDtos.UpdateProductRequest;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;

public interface ProductService {

    ProductResponse create(CreateProductRequest request);

    ProductResponse get(Long id);

    Page<ProductResponse> findAll(Pageable pageable);

    Page<ProductResponse> findByCategoryId(Long categoryId, Pageable pageable);

    ProductResponse update(Long id, UpdateProductRequest request);

    List<String> getSkusByCategoryId(Long categoryId);
}
