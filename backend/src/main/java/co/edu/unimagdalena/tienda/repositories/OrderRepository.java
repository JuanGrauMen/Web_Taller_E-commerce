package co.edu.unimagdalena.tienda.repositories;

import co.edu.unimagdalena.tienda.entities.Order;
import co.edu.unimagdalena.tienda.enums.OrderStatus;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;
import java.util.Optional;

public interface OrderRepository extends JpaRepository<Order, Long>, JpaSpecificationExecutor<Order> {

    List<Order> findByCustomerId(Long customerId);

    List<Order> findByStatus(OrderStatus status);

    @Query("""
            SELECT YEAR(o.createdAt), MONTH(o.createdAt), SUM(o.total)
            FROM Order o
            WHERE o.status IN (co.edu.unimagdalena.tienda.enums.OrderStatus.PAID,
                               co.edu.unimagdalena.tienda.enums.OrderStatus.SHIPPED,
                               co.edu.unimagdalena.tienda.enums.OrderStatus.DELIVERED)
            GROUP BY YEAR(o.createdAt), MONTH(o.createdAt)
            ORDER BY YEAR(o.createdAt) DESC, MONTH(o.createdAt) DESC
            """)
    List<Object[]> findMonthlyIncome();

    @Query("""
            SELECT o.customer.id, o.customer.fullName, SUM(o.total)
            FROM Order o
            WHERE o.status IN (co.edu.unimagdalena.tienda.enums.OrderStatus.PAID,
                               co.edu.unimagdalena.tienda.enums.OrderStatus.SHIPPED,
                               co.edu.unimagdalena.tienda.enums.OrderStatus.DELIVERED)
            GROUP BY o.customer.id, o.customer.fullName
            ORDER BY SUM(o.total) DESC
            """)
    List<Object[]> findTopCustomers();

    @Query("""
            SELECT DISTINCT o FROM Order o
            LEFT JOIN FETCH o.items i
            LEFT JOIN FETCH i.product
            WHERE o.id = :id
            """)
    Optional<Order> findByIdWithItems(@Param("id") Long id);
}
