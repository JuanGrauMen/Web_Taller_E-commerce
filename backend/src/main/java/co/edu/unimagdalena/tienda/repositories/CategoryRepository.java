package co.edu.unimagdalena.tienda.repositories;

import co.edu.unimagdalena.tienda.entities.Category;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;
import java.util.Optional;

public interface CategoryRepository extends JpaRepository<Category, Long> {

    Optional<Category> findByNameIgnoreCase(String name);

    List<Category> findByActiveTrueOrderByNameAsc();

    @Query("SELECT COUNT(p) > 0 FROM Product p WHERE p.category.id = :categoryId AND p.active = true")
    boolean existsActiveProductByCategoryId(@Param("categoryId") Long categoryId);
}
