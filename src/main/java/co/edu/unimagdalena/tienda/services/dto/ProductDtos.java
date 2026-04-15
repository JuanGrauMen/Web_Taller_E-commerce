package co.edu.unimagdalena.tienda.services.dto;

import jakarta.validation.constraints.DecimalMin;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;

import java.math.BigDecimal;

public class ProductDtos {

    public record CreateProductRequest(
            @NotNull Long categoryId,
            @NotBlank String name,
            @NotBlank String sku,
            @NotNull @DecimalMin("0.01") BigDecimal price
    ) {
    }

    public record UpdateProductRequest(
            @NotBlank String name,
            @NotNull @DecimalMin("0.01") BigDecimal price,
            boolean active
    ) {
    }

    public record ProductResponse(
            Long id,
            Long categoryId,
            String categoryName,
            String name,
            String sku,
            BigDecimal price,
            boolean active
    ) {
    }
}
