package co.edu.unimagdalena.tienda.mappers;

import co.edu.unimagdalena.tienda.services.dto.InventoryDtos.InventoryResponse;
import co.edu.unimagdalena.tienda.entities.Inventory;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.factory.Mappers;

@Mapper(componentModel = "spring")
public interface InventoryMapper {

    InventoryMapper INSTANCE = Mappers.getMapper(InventoryMapper.class);

    @Mapping(target = "productId", source = "product.id")
    InventoryResponse toResponse(Inventory inventory);
}
