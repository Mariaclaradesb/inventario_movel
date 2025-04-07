package inventario.inventarioapi.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import inventario.inventarioapi.model.InventarioData;

@Repository
public interface InventarioDataRepository  extends JpaRepository<InventarioData, Long> {
    
    
}
