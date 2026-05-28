package co.edu.unimagdalena.tienda.repositories;

import co.edu.unimagdalena.tienda.entities.Product;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.Optional;

public interface ProductRepository extends JpaRepository<Product, Long> {

    Optional<Product> findBySkuIgnoreCase(String sku);

    boolean existsBySkuIgnoreCase(String sku);

    @Query(value = "SELECT p FROM Product p JOIN FETCH p.category WHERE p.active = true",
           countQuery = "SELECT COUNT(p) FROM Product p WHERE p.active = true")
    Page<Product> findActiveWithCategory(Pageable pageable);

    @Query(value = "SELECT p FROM Product p JOIN FETCH p.category WHERE p.active = true AND p.category.id = :categoryId",
           countQuery = "SELECT COUNT(p) FROM Product p WHERE p.active = true AND p.category.id = :categoryId")
    Page<Product> findActiveByCategoryWithCategory(@Param("categoryId") Long categoryId, Pageable pageable);
}
