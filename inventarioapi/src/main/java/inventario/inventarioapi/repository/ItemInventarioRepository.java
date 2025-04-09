package inventario.inventarioapi.repository;

import inventario.inventarioapi.model.ItemInventario;
import inventario.inventarioapi.model.ItemInventarioId;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ItemInventarioRepository extends JpaRepository<ItemInventario, ItemInventarioId> {

    @Query("""
        SELECT i FROM ItemInventario i
        WHERE i.loja.codigo = :storeId
        AND i.inventarioData.codigo = :inventoryId
    """)
    List<ItemInventario> findByInventoryId(Long storeId, Long inventoryId);

}
