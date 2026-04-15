package co.edu.unimagdalena.tienda.repositories;

import co.edu.unimagdalena.tienda.entities.Address;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface AddressRepository extends JpaRepository<Address, Long> {

    List<Address> findByCustomerId(Long customerId);

    boolean existsByIdAndCustomerId(Long id, Long customerId);
}
