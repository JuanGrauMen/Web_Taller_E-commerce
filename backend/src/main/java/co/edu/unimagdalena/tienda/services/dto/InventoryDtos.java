package co.edu.unimagdalena.tienda.services.dto;

import jakarta.validation.constraints.Min;

public class InventoryDtos {

    public record UpdateInventoryRequest(
            @Min(0) int availableStock,
            @Min(0) int minimumStock
    ) {
    }

    public record InventoryResponse(
            Long id,
            Long productId,
            int availableStock,
            int minimumStock
    ) {
    }
}
