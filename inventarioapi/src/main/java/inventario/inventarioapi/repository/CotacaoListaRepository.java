package inventario.inventarioapi.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import inventario.inventarioapi.model.CotacaoLista;
import inventario.inventarioapi.model.CotacaoListaId;

@Repository
public interface CotacaoListaRepository extends JpaRepository<CotacaoLista, CotacaoListaId> {}
