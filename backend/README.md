# Capa de Seguridad

Sexta capa del proyecto: protege la API REST con autenticación JWT y autorización basada en roles usando Spring Security.

## Qué agrega esta capa

### Autenticación JWT
- `AuthController` (`/api/auth/register`, `/api/auth/login`) — registro y login, devuelve token JWT
- `JwtService` — genera y valida tokens firmados con clave secreta
- `JwtAuthenticationFilter` — intercepta cada request y verifica el token en el header `Authorization: Bearer <token>`

### Modelo de usuarios
- `AppUser` — entidad de usuario con email, contraseña encriptada y rol
- `Role` — enum: `USER`, `ADMIN`
- `AppUserRepository` — repositorio para buscar usuarios por email

### Configuración de seguridad
- `SecurityConfig` — define reglas de acceso: `/api/auth/**` público, todo lo demás requiere autenticación
- `SecurityBeans` — beans de `PasswordEncoder` y `AuthenticationManager`
- `JpaUserDetailsService` — integra `AppUser` con Spring Security

### Manejo de errores HTTP
- `Http401EntryPoint` — responde 401 cuando no hay token o es inválido
- `Http403AccessDenied` — responde 403 cuando el token es válido pero no tiene permisos

## Variables de entorno requeridas

```properties
JWT_SECRET=clave-secreta-minimo-32-caracteres
JWT_EXPIRATION_SECONDS=3600
```

## Tests

```bash
./mvnw test
```
`AuthControllerTest` prueba el flujo completo: registro, login y acceso a endpoint protegido con token.
