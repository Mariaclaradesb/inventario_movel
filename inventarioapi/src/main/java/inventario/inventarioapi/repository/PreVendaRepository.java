package inventario.inventarioapi.repository;

import inventario.inventarioapi.model.PreVenda;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.List;

@Repository
public interface PreVendaRepository extends JpaRepository<PreVenda, Long> {
    @Query("""
        SELECT p FROM PreVenda p
        WHERE p.codLoja = :codLoja
        AND p.emissao > :dataInicial
        ORDER BY p.emissao DESC
    """)
    List<PreVenda> getAllOrdered(Long codLoja, LocalDateTime dataInicial);

    @Modifying
    @Query("""
        UPDATE PreVenda p
        SET p.totalVenda = COALESCE(p.totalVenda, 0) + :total
        WHERE p.codigoVenda = :codigoVenda
    """)
    void updateValorTotal(Long codigoVenda, BigDecimal total);
}
