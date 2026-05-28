package co.edu.unimagdalena.tienda.services.dto;

import jakarta.validation.constraints.NotBlank;

public class CategoryDtos {

    public record CreateCategoryRequest(
            @NotBlank String name,
            String description
    ) {
    }

    public record CategoryResponse(
            Long id,
            String name,
            String description,
            boolean active
    ) {
    }
}
