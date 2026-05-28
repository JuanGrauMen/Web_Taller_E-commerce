# Capa de Entidades

Primera capa del proyecto: define el modelo de dominio mediante entidades JPA que representan las tablas de la base de datos.

## Entidades

| Entidad | Descripción |
|---------|-------------|
| `Customer` | Cliente con nombre completo, email y estado |
| `Address` | Dirección de envío asociada a un cliente |
| `Category` | Categoría de productos |
| `Product` | Producto con nombre, precio, SKU y estado activo |
| `Inventory` | Stock disponible por producto |
| `Order` | Pedido realizado por un cliente |
| `OrderItem` | Línea de detalle de un pedido (producto + cantidad + precio) |
| `OrderStatusHistory` | Historial de cambios de estado de un pedido |

## Enums

- `CustomerStatus` — ACTIVE, INACTIVE
- `OrderStatus` — CREATED, PAID, SHIPPED, DELIVERED, CANCELLED

## Tecnologías

- Spring Boot 4 + Spring Data JPA
- Hibernate (ORM)
- PostgreSQL
- Lombok

## Cómo correr

1. Tener PostgreSQL en `localhost:5432` con base de datos `tienda_db`
2. Ajustar credenciales en `src/main/resources/application.properties`
3. Ejecutar:
```bash
./mvnw spring-boot:run
```

## Tests

```bash
./mvnw test
```
Verifica que el contexto de Spring Boot carga correctamente con todas las entidades.
