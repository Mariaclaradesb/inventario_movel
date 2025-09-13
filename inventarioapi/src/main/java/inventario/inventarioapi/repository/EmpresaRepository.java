package inventario.inventarioapi.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import inventario.inventarioapi.model.Empresa;
import inventario.inventarioapi.model.dto.EmpresaDTO;

@Repository
public interface EmpresaRepository extends JpaRepository<Empresa, Long> {

   @Query("SELECT new inventario.inventarioapi.model.dto.EmpresaDTO(l.codigo, l.nome) FROM Empresa l") 
    List<EmpresaDTO> findAllCodigosENomes();
}
