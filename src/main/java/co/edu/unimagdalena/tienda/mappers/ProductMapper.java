package co.edu.unimagdalena.tienda.mappers;

import co.edu.unimagdalena.tienda.services.dto.ProductDtos.CreateProductRequest;
import co.edu.unimagdalena.tienda.services.dto.ProductDtos.ProductResponse;
import co.edu.unimagdalena.tienda.entities.Product;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.factory.Mappers;

@Mapper(componentModel = "spring")
public interface ProductMapper {

    ProductMapper INSTANCE = Mappers.getMapper(ProductMapper.class);

    @Mapping(target = "id", ignore = true)
    @Mapping(target = "category", ignore = true)
    @Mapping(target = "active", constant = "true")
    @Mapping(target = "inventory", ignore = true)
    @Mapping(target = "orderItems", ignore = true)
    Product toEntity(CreateProductRequest request);

    @Mapping(target = "categoryId", source = "category.id")
    @Mapping(target = "categoryName", source = "category.name")
    ProductResponse toResponse(Product product);
}
