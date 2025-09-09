package inventario.inventarioapi.repository;

import inventario.inventarioapi.model.Sequencia;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface SequenciaRepository extends JpaRepository<Sequencia, Long> {
    @Query("""
        SELECT max(s.sequencia) FROM Sequencia s
    """)
    Long findLastSequencia();
}
