# Tienda Universitaria — Backend + Frontend con Docker

Capa final del proyecto: integra el backend Spring Boot con un frontend React y una base de datos PostgreSQL levantada con Docker.

## Estructura

```
Web_Taller_E-commerce/
├── backend/          ← API REST Spring Boot (puerto 8082)
├── frontend/         ← Aplicacion React + Vite (puerto 5173)
├── docker-compose.yml
└── .env.example
```

## Requisitos

- Docker Desktop instalado y corriendo
- Java 21
- Node.js 20+

## Cómo ejecutar

### 1. Configurar variables de entorno
```bash
cp .env.example .env
# Editar .env con las credenciales deseadas
```

### 2. Levantar la base de datos
```bash
docker compose up -d
```

### 3. Ejecutar el backend
```bash
cd backend
./mvnw spring-boot:run
# API disponible en http://localhost:8082
```

### 4. Ejecutar el frontend
```bash
cd frontend
npm install
npm run dev
# Frontend disponible en http://localhost:5173
```

## API Endpoints

| Recurso | Ruta |
|---------|------|
| Customers | `/api/customers` |
| Products | `/api/products` |
| Orders | `/api/orders` |
| Categories | `/api/categories` |
| Addresses | `/api/addresses` |
| Reports | `/api/reports` |

## Tests

```bash
cd backend
./mvnw test
```
