package co.edu.unimagdalena.tienda.services;

import co.edu.unimagdalena.tienda.services.dto.ProductDtos.CreateProductRequest;
import co.edu.unimagdalena.tienda.services.dto.ProductDtos.ProductResponse;
import co.edu.unimagdalena.tienda.services.dto.ProductDtos.UpdateProductRequest;

import java.util.List;

public interface ProductService {

    ProductResponse create(CreateProductRequest request);

    ProductResponse get(Long id);

    List<ProductResponse> findByCategoryId(Long categoryId);

    ProductResponse update(Long id, UpdateProductRequest request);
}
