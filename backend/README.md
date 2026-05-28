# Capa de Controladores

Quinta capa del proyecto: expone la API REST con controladores Spring MVC, manejo centralizado de errores y datos de prueba precargados.

## Endpoints disponibles

| Controlador | Ruta base | Métodos |
|-------------|-----------|---------|
| `CustomerController` | `/api/customers` | GET, POST, PUT |
| `ProductController` | `/api/products` | GET, POST, PUT, DELETE |
| `OrderController` | `/api/orders` | GET, POST, PUT (filtros paginados) |
| `CategoryController` | `/api/categories` | GET, POST, PUT, DELETE |
| `AddressController` | `/api/addresses` | GET, POST, PUT, DELETE |
| `ReportController` | `/api/reports` | GET |

## Manejo de errores (api/error/)

- `ApiError` — estructura de respuesta de error estandarizada
- `GlobalExceptionHandler` — captura y transforma todas las excepciones en respuestas HTTP apropiadas

## Configuración (config/)

`WebConfig` — configura CORS para permitir peticiones desde el frontend en desarrollo (`localhost:5173`).

## Datos de prueba

`data.sql` precarga 20 categorías, 80 productos, 16 clientes, 24 órdenes y sus datos relacionados.

## Cómo probar la API

```bash
./mvnw spring-boot:run
# API disponible en http://localhost:8082
```

## Tests

```bash
./mvnw test
```
Pruebas de integración con MockMvc: validan los endpoints, códigos HTTP y formato de respuesta.
