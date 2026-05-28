package co.edu.unimagdalena.tienda.api.error;

import java.time.Instant;
import java.util.List;

public record ApiError(
        int status,
        String error,
        String message,
        String path,
        Instant timestamp,
        List<String> details
) {
    public ApiError(int status, String error, String message, String path) {
        this(status, error, message, path, Instant.now(), List.of());
    }

    public ApiError(int status, String error, String message, String path, List<String> details) {
        this(status, error, message, path, Instant.now(), details);
    }
}
