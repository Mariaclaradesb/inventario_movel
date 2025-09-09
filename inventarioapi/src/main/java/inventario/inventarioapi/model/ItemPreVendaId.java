package inventario.inventarioapi.model;

import jakarta.persistence.Column;
import jakarta.persistence.Embeddable;
import jakarta.persistence.EmbeddedId;

import java.io.Serializable;
import java.util.Objects;

@Embeddable
public class ItemPreVendaId implements Serializable {
    @Column(name = "NUMVENDA")
    private Long preVendaId;

    @Column(name = "CODPRODUTO")
    private Long codProduto;

    @Column(name = "ITEM")
    private Long itemId;

    public ItemPreVendaId() {
    }

    public ItemPreVendaId(Long preVendaId, Long codProduto, Long itemId) {
        this.preVendaId = preVendaId;
        this.codProduto = codProduto;
        this.itemId = itemId;
    }

    public Long getPreVendaId() {
        return preVendaId;
    }

    public void setPreVendaId(Long preVendaId) {
        this.preVendaId = preVendaId;
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
        return Objects.equals(preVendaId, that.preVendaId) && Objects.equals(codProduto, that.codProduto) && Objects.equals(itemId, that.itemId);
    }

    @Override
    public int hashCode() {
        return Objects.hash(preVendaId, codProduto, itemId);
    }

    @Override
    public String toString() {
        return "ItemPreVendaId{" +
                "preVendaId=" + preVendaId +
                ", codProduto=" + codProduto +
                ", itemId=" + itemId +
                '}';
    }
}
