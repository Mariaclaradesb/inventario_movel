package inventario.inventarioapi.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import inventario.inventarioapi.model.InventarioProduto;
import inventario.inventarioapi.model.ItemInventario;

@Repository
public interface ItemInventarioRepository extends JpaRepository<ItemInventario, InventarioProduto> {
    
}
