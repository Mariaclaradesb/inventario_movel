package inventario.inventarioapi.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import inventario.inventarioapi.model.LojaFisica;

@Repository
public interface LojaFisicaRepository extends JpaRepository<LojaFisica, Long> {

    @Query("SELECT l.codigo FROM LojaFisica l") 
    List<Long> findAllCodigos();
}
