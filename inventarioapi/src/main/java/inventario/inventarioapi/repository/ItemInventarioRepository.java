package inventario.inventarioapi.repository;

import inventario.inventarioapi.model.ItemInventario;
import inventario.inventarioapi.model.ItemInventarioId;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ItemInventarioRepository extends JpaRepository<ItemInventario, ItemInventarioId> {
    
}
