package co.edu.unimagdalena.tienda.services.dto;

import jakarta.validation.constraints.NotBlank;

public class AddressDtos {

    public record CreateAddressRequest(
            @NotBlank String line1,
            @NotBlank String city,
            @NotBlank String department,
            String postalCode,
            boolean defaultAddress
    ) {
    }

    public record AddressResponse(
            Long id,
            Long customerId,
            String line1,
            String city,
            String department,
            String postalCode,
            boolean defaultAddress
    ) {
    }
}
