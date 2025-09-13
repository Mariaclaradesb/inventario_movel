package inventario.inventarioapi.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import inventario.inventarioapi.model.CotacaoContro;

@Repository
public interface CotacaoControRepository extends JpaRepository<CotacaoContro, Long> {}
