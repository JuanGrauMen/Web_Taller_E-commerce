package co.edu.unimagdalena.tienda.repositories.spec;

import co.edu.unimagdalena.tienda.entities.Order;
import co.edu.unimagdalena.tienda.enums.OrderStatus;
import org.springframework.data.jpa.domain.Specification;

import java.math.BigDecimal;
import java.time.Instant;

public final class OrderSpecifications {

    private OrderSpecifications() {}

    public static Specification<Order> hasCustomerId(Long customerId) {
        return (root, query, cb) -> customerId == null ? null : cb.equal(root.get("customer").get("id"), customerId);
    }

    public static Specification<Order> hasStatus(OrderStatus status) {
        return (root, query, cb) -> status == null ? null : cb.equal(root.get("status"), status);
    }

    public static Specification<Order> createdAfter(Instant from) {
        return (root, query, cb) -> from == null ? null : cb.greaterThanOrEqualTo(root.get("createdAt"), from);
    }

    public static Specification<Order> createdBefore(Instant to) {
        return (root, query, cb) -> to == null ? null : cb.lessThanOrEqualTo(root.get("createdAt"), to);
    }

    public static Specification<Order> totalAtLeast(BigDecimal minTotal) {
        return (root, query, cb) -> minTotal == null ? null : cb.greaterThanOrEqualTo(root.get("total"), minTotal);
    }

    public static Specification<Order> totalAtMost(BigDecimal maxTotal) {
        return (root, query, cb) -> maxTotal == null ? null : cb.lessThanOrEqualTo(root.get("total"), maxTotal);
    }
}
