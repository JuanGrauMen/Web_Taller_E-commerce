# Capa de Servicios

Cuarta capa del proyecto: implementa la lógica de negocio mediante interfaces de servicio e implementaciones concretas, con manejo de excepciones personalizadas.

## Interfaces de servicio

`CustomerService`, `ProductService`, `OrderService`, `AddressService`, `CategoryService`, `InventoryService`, `ReportService`

Cada interfaz define el contrato que debe cumplir la implementación, facilitando las pruebas unitarias con mocks.

## Implementaciones (impl/)

Cada `*ServiceImpl` implementa su interfaz correspondiente con:
- Validación de reglas de negocio
- Llamadas al repositorio con transacciones (`@Transactional`)
- Conversión entidad ↔ DTO mediante mappers

## Excepciones personalizadas (exception/)

| Excepción | Código HTTP |
|-----------|-------------|
| `ResourceNotFoundException` | 404 Not Found |
| `ConflictException` | 409 Conflict |
| `BusinessException` | 422 Unprocessable Entity |
| `ValidationException` | 400 Bad Request |

## Tests

```bash
./mvnw test
```
Pruebas unitarias con Mockito: validan la lógica de negocio aislada del repositorio.
