package co.edu.unimagdalena.tienda.repositories;

import co.edu.unimagdalena.tienda.entities.OrderItem;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.time.Instant;
import java.util.List;

public interface OrderItemRepository extends JpaRepository<OrderItem, Long> {

    @Query("""
            SELECT oi.product.id, oi.product.name, oi.product.sku, SUM(oi.quantity)
            FROM OrderItem oi
            WHERE oi.order.status IN (co.edu.unimagdalena.tienda.enums.OrderStatus.PAID,
                                      co.edu.unimagdalena.tienda.enums.OrderStatus.SHIPPED,
                                      co.edu.unimagdalena.tienda.enums.OrderStatus.DELIVERED)
              AND (:from IS NULL OR oi.order.createdAt >= :from)
              AND (:to IS NULL OR oi.order.createdAt <= :to)
            GROUP BY oi.product.id, oi.product.name, oi.product.sku
            ORDER BY SUM(oi.quantity) DESC
            """)
    List<Object[]> findBestSellingProducts(@Param("from") Instant from, @Param("to") Instant to);

    @Query("""
            SELECT oi.product.category.id, oi.product.category.name, SUM(oi.quantity)
            FROM OrderItem oi
            WHERE oi.order.status IN (co.edu.unimagdalena.tienda.enums.OrderStatus.PAID,
                                      co.edu.unimagdalena.tienda.enums.OrderStatus.SHIPPED,
                                      co.edu.unimagdalena.tienda.enums.OrderStatus.DELIVERED)
            GROUP BY oi.product.category.id, oi.product.category.name
            ORDER BY SUM(oi.quantity) DESC
            """)
    List<Object[]> findTopCategoriesByVolume();
}
