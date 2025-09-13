package inventario.inventarioapi.repository;

import inventario.inventarioapi.model.Sequencia;
import inventario.inventarioapi.model.SequenciaId;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface SequenciaRepository extends JpaRepository<Sequencia, SequenciaId> {
@Query("""
        SELECT max(s.id.sequencia) FROM Sequencia s
    """)
    Long findLastSequencia();
}
