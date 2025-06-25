package inventario.inventarioapi.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import inventario.inventarioapi.model.NVenda;

@Repository
public interface NVendaRepository extends JpaRepository<NVenda, Long> {

    @Query("""
        SELECT COALESCE(MAX(n.codigoVenda) + 1, 1)
        FROM NVenda2 n
    """)
    Long findNewId();

    List<NVenda> findByLojaCodigo(Long codLoja);
}
