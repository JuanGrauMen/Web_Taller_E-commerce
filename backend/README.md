# Capa de Repositorios

Segunda capa del proyecto: define el acceso a datos mediante Spring Data JPA repositories, incluyendo consultas personalizadas y especificaciones dinámicas.

## Repositorios

| Repositorio | Características destacadas |
|-------------|---------------------------|
| `CustomerRepository` | Búsqueda por email (ignorando mayúsculas) |
| `ProductRepository` | JOIN FETCH con categoría, filtro por activo y categoría |
| `OrderRepository` | `JpaSpecificationExecutor` para filtros dinámicos |
| `OrderItemRepository` | Consulta de productos más vendidos por rango de fechas |
| `InventoryRepository` | Búsqueda por producto |
| `CategoryRepository` | CRUD básico |
| `AddressRepository` | Búsqueda por cliente |
| `OrderStatusHistoryRepository` | Historial por orden |

## Especificaciones (spec/)

`OrderSpecifications` — implementa filtros dinámicos para pedidos usando la API `Specification` de Spring Data JPA, evitando el problema de parámetros nulos en Hibernate 7.

## Tecnologías

- Spring Data JPA
- JpaSpecificationExecutor
- H2 (base de datos en memoria para tests)

## Tests

```bash
./mvnw test
```
Pruebas de repositorios con H2 en memoria: consultas personalizadas, filtros y relaciones.
