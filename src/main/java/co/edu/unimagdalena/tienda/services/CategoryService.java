package co.edu.unimagdalena.tienda.services;

import co.edu.unimagdalena.tienda.services.dto.CategoryDtos.CategoryResponse;
import co.edu.unimagdalena.tienda.services.dto.CategoryDtos.CreateCategoryRequest;

import java.util.List;

public interface CategoryService {

    CategoryResponse create(CreateCategoryRequest request);

    List<CategoryResponse> findAllActive();
}
