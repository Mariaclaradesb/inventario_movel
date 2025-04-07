package inventario.inventarioapi.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import inventario.inventarioapi.model.VProduto;
import java.util.List;
import java.util.Optional;

@Repository
public interface VprodutosRepository extends JpaRepository<VProduto, Long> {
    Optional<VProduto> findById(Long codigo);
    
    @Query("SELECT v FROM VProduto v WHERE ( " +
    "LOWER(v.nome) LIKE LOWER(CONCAT('%', :termo, '%')) " +
    "OR LOWER(v.alternati) LIKE LOWER(CONCAT('%', :termo, '%')) " +
    "OR v.cbarra LIKE %:termo% " +
    "OR v.cbarra2 LIKE %:termo% " +
    "OR v.cbarra3 LIKE %:termo% " +  
    "OR LOWER(v.original) LIKE LOWER(CONCAT('%', :termo, '%')) " +
    "OR LOWER(v.marca.nome) LIKE LOWER(CONCAT('%', :termo, '%')) ) " +  
    "AND v.loja.codigo = :codLoja")
    List<VProduto> buscarPorTodosOsCampos(@Param("termo") String termo, @Param("codLoja") Long codLoja);

}