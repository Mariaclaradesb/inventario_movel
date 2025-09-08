package inventario.inventarioapi.repository;

import inventario.inventarioapi.model.Empresa;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import inventario.inventarioapi.model.InventarioData;

import java.util.List;

@Repository
public interface InventarioDataRepository  extends JpaRepository<InventarioData, Long> {
    
    @Query("""
        SELECT COALESCE(MAX(i.codigo) + 1, 1)
        FROM InventarioData i
    """)
    Long findNewId();

    List<InventarioData> findByLojaCodigo(Long codLoja);

}
