package co.edu.unimagdalena.tienda.mappers;

import co.edu.unimagdalena.tienda.services.dto.CategoryDtos.CategoryResponse;
import co.edu.unimagdalena.tienda.services.dto.CategoryDtos.CreateCategoryRequest;
import co.edu.unimagdalena.tienda.entities.Category;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.factory.Mappers;

@Mapper(componentModel = "spring")
public interface CategoryMapper {

    CategoryMapper INSTANCE = Mappers.getMapper(CategoryMapper.class);

    @Mapping(target = "id", ignore = true)
    @Mapping(target = "active", constant = "true")
    Category toEntity(CreateCategoryRequest request);

    CategoryResponse toResponse(Category category);
}
