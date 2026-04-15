package co.edu.unimagdalena.tienda.repositories;

import co.edu.unimagdalena.tienda.entities.Product;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;

public interface ProductRepository extends JpaRepository<Product, Long> {

    Optional<Product> findBySkuIgnoreCase(String sku);

    boolean existsBySkuIgnoreCase(String sku);

    List<Product> findByActiveTrueAndCategoryId(Long categoryId);
}
