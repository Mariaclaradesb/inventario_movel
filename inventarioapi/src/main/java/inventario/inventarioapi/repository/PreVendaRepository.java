package inventario.inventarioapi.repository;

import inventario.inventarioapi.model.PreVenda;
import inventario.inventarioapi.model.PreVendaId;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface PreVendaRepository extends JpaRepository<PreVenda, PreVendaId> {
}
