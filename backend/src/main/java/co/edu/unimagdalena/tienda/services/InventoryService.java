package co.edu.unimagdalena.tienda.services;

import co.edu.unimagdalena.tienda.services.dto.InventoryDtos.InventoryResponse;
import co.edu.unimagdalena.tienda.services.dto.InventoryDtos.UpdateInventoryRequest;

public interface InventoryService {

    InventoryResponse update(Long productId, UpdateInventoryRequest request);

    InventoryResponse getByProductId(Long productId);
}
