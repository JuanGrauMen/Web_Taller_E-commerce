package co.edu.unimagdalena.tienda.repositories;

import co.edu.unimagdalena.tienda.entities.Inventory;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;
import java.util.Optional;

public interface InventoryRepository extends JpaRepository<Inventory, Long> {

    Optional<Inventory> findByProductId(Long productId);

    @Query("SELECT i FROM Inventory i WHERE i.availableStock < i.minimumStock")
    List<Inventory> findLowStockProducts();
}
