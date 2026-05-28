package co.edu.unimagdalena.tienda.services.impl;

import co.edu.unimagdalena.tienda.services.dto.CategoryDtos.CategoryResponse;
import co.edu.unimagdalena.tienda.services.dto.CategoryDtos.CreateCategoryRequest;
import co.edu.unimagdalena.tienda.exception.ConflictException;
import co.edu.unimagdalena.tienda.mappers.CategoryMapper;
import co.edu.unimagdalena.tienda.repositories.CategoryRepository;
import co.edu.unimagdalena.tienda.services.CategoryService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@RequiredArgsConstructor
@Transactional
public class CategoryServiceImpl implements CategoryService {

    private final CategoryRepository repository;
    private final CategoryMapper mapper;

    @Override
    public CategoryResponse create(CreateCategoryRequest request) {
        if (repository.findByNameIgnoreCase(request.name()).isPresent()) {
            throw new ConflictException("Category already exists: " + request.name());
        }
        return mapper.toResponse(repository.save(mapper.toEntity(request)));
    }

    @Override
    @Transactional(readOnly = true)
    public List<CategoryResponse> findAllActive() {
        return repository.findByActiveTrueOrderByNameAsc().stream().map(mapper::toResponse).toList();
    }
}
