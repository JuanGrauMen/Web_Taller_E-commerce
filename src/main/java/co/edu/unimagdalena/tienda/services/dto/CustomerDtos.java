package co.edu.unimagdalena.tienda.services.dto;

import co.edu.unimagdalena.tienda.enums.CustomerStatus;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;

public class CustomerDtos {

    public record CreateCustomerRequest(
            @NotBlank String fullName,
            @NotBlank @Email String email
    ) {
    }

    public record UpdateCustomerRequest(
            @NotBlank String fullName,
            @NotNull CustomerStatus status
    ) {
    }

    public record CustomerResponse(
            Long id,
            String fullName,
            String email,
            CustomerStatus status
    ) {
    }
}
