package inventario.inventarioapi.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import inventario.inventarioapi.model.VProduto;
import inventario.inventarioapi.model.VProdutoId;

import java.util.List;
import java.util.Optional;

@Repository
public interface VprodutosRepository extends JpaRepository<VProduto, VProdutoId> {
    Optional<VProduto> findById(VProdutoId codigo);
    
    @Query("SELECT v FROM VProduto v WHERE " +
           "(v.codigo.codigo = :codigoTermo OR v.cbarra = :stringTermo OR v.cbarra2 = :stringTermo OR v.cbarra3 = :stringTermo) " +
           "AND v.codigo.codLoja = :codLoja")
    List<VProduto> buscarPorCamposNumericos(@Param("codigoTermo") Long codigoTermo, @Param("stringTermo") String stringTermo, @Param("codLoja") Long codLoja);

    @Query("SELECT v FROM VProduto v WHERE ( " +
           "LOWER(v.nome) LIKE LOWER(CONCAT('%', :termo, '%')) " +
           "OR LOWER(v.marca.nome) LIKE LOWER(CONCAT('%', :termo, '%')) ) " +
           "AND v.codigo.codLoja = :codLoja")
    List<VProduto> buscarPorCamposDeTexto(@Param("termo") String termo, @Param("codLoja") Long codLoja);


}