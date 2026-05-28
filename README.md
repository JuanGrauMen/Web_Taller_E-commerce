# Tienda Universitaria — E-commerce

Proyecto académico de una tienda universitaria construido con Spring Boot y React.
Desarrollado capa por capa para ilustrar la arquitectura de una aplicación web completa.

## Estructura del proyecto

Cada rama `feature/capa-*` representa una etapa del desarrollo:

| Rama | Descripción |
|------|-------------|
| `feature/capa-entidades` | Modelo de dominio: entidades JPA y enums |
| `feature/capa-repositorios` | Acceso a datos: Spring Data JPA repositories |
| `feature/capa-dtos-mappers` | Transferencia de datos: DTOs y mappers MapStruct |
| `feature/capa-servicios` | Lógica de negocio: servicios e interfaces |
| `feature/capa-controladores` | API REST: controladores y manejo de errores |
| `feature/capa-front` | Frontend React + Docker para la base de datos |

## Cómo ejecutar (capa-front)

### Requisitos
- Docker y Docker Compose
- Node.js 20+

### Pasos
```bash
# 1. Levantar la base de datos
docker compose up -d

# 2. Ejecutar el backend
cd backend
./mvnw spring-boot:run

# 3. Ejecutar el frontend
cd frontend
npm install
npm run dev
```

## Tecnologías

- **Backend:** Spring Boot 4, Java 21, PostgreSQL, Hibernate, MapStruct, Lombok
- **Frontend:** React 19, Vite, React Router
- **Infraestructura:** Docker, Docker Compose
