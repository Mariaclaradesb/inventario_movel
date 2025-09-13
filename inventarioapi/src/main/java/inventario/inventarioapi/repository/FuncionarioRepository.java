package inventario.inventarioapi.repository;

import inventario.inventarioapi.model.Funcionario;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface FuncionarioRepository extends JpaRepository<Funcionario, Long> {

    @Query("""
        SELECT f FROM Funcionario f
        WHERE f.loja.codigo = :codLoja
    """)
    List<Funcionario> getAll(Long codLoja);
}
