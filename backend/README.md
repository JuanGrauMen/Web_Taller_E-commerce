# Capa de DTOs y Mappers

Tercera capa del proyecto: introduce los objetos de transferencia de datos (DTOs) y los mappers que convierten entre entidades y DTOs sin exponer el modelo interno.

## DTOs (services/dto/)

Cada entidad tiene su propio archivo de DTOs con records Java:

| Archivo | Records incluidos |
|---------|------------------|
| `CustomerDtos` | `CreateCustomerRequest`, `UpdateCustomerRequest`, `CustomerResponse` |
| `ProductDtos` | `CreateProductRequest`, `UpdateProductRequest`, `ProductResponse` |
| `OrderDtos` | `CreateOrderRequest`, `OrderResponse`, `OrderFilterRequest` |
| `AddressDtos` | `CreateAddressRequest`, `AddressResponse` |
| `CategoryDtos` | `CreateCategoryRequest`, `CategoryResponse` |
| `InventoryDtos` | `UpdateStockRequest`, `InventoryResponse` |
| `ReportDtos` | `BestSellingProductResponse`, `RevenueByPeriodResponse` |

## Mappers (mappers/)

Interfaces anotadas con `@Mapper` procesadas en tiempo de compilación por MapStruct:
`CustomerMapper`, `ProductMapper`, `OrderMapper`, `AddressMapper`, `CategoryMapper`, `InventoryMapper`

## Tecnologías añadidas

- MapStruct 1.6.3
- Jakarta Bean Validation

## Tests

```bash
./mvnw test
```
Prueba la conversión correcta entre entidades y DTOs en ambas direcciones.
