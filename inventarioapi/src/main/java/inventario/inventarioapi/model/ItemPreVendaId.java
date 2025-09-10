package inventario.inventarioapi.model;

import jakarta.persistence.Column;
import jakarta.persistence.Embeddable;

import java.io.Serializable;
import java.util.Objects;

@Embeddable
public class ItemPreVendaId implements Serializable {
    @Column(name = "NUMVENDA")
    private Long codigoVenda;

    @Column(name = "CODPRODUTO")
    private Long codProduto;

    @Column(name = "ITEM")
    private Long itemId;

    public ItemPreVendaId() {
    }

    public ItemPreVendaId(Long codigoVenda, Long codProduto, Long itemId) {
        this.codigoVenda = codigoVenda;
        this.codProduto = codProduto;
        this.itemId = itemId;
    }

    public Long getCodigoVenda() {
        return codigoVenda;
    }

    public void setCodigoVenda(Long codigoVenda) {
        this.codigoVenda = codigoVenda;
    }

    public Long getCodProduto() {
        return codProduto;
    }

    public void setCodProduto(Long codProduto) {
        this.codProduto = codProduto;
    }

    public Long getItemId() {
        return itemId;
    }

    public void setItemId(Long itemId) {
        this.itemId = itemId;
    }

    @Override
    public boolean equals(Object o) {
        if (o == null || getClass() != o.getClass()) return false;
        ItemPreVendaId that = (ItemPreVendaId) o;
        return Objects.equals(codigoVenda, that.codigoVenda) && Objects.equals(codProduto, that.codProduto) && Objects.equals(itemId, that.itemId);
    }

    @Override
    public int hashCode() {
        return Objects.hash(codigoVenda, codProduto, itemId);
    }

    @Override
    public String toString() {
        return "ItemPreVendaId{" +
                "codigoVenda=" + codigoVenda +
                ", codProduto=" + codProduto +
                ", itemId=" + itemId +
                '}';
    }
}
