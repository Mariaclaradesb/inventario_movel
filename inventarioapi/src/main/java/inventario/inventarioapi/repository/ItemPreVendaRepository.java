package inventario.inventarioapi.repository;

import inventario.inventarioapi.model.ItemPreVenda;
import inventario.inventarioapi.model.ItemPreVendaId;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ItemPreVendaRepository extends JpaRepository<ItemPreVenda, ItemPreVendaId> {
    @Query("""
        SELECT max(i.id.itemId) FROM ItemPreVenda i
        WHERE i.id.codProduto = :codProduto
        AND i.id.codigoVenda = :codigoVenda
    """)
    Long getLastItemId(Long codProduto, Long codigoVenda);

    @Query("""
        UPDATE ItemPreVenda i
        SET i.quantidade = :quantidade,
            i.menorUnidade = :quantidade
        WHERE i.id = :id
    """)
    @Modifying
    void updateQuantity(ItemPreVendaId id, Long quantidade);

    List<ItemPreVenda> findAllById_CodigoVenda(Long idCodigoVenda);
}
