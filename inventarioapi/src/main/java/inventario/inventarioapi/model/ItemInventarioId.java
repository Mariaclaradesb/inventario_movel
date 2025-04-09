package inventario.inventarioapi.model;

import jakarta.persistence.Embeddable;

import java.io.Serializable;
import java.util.Objects;

@Embeddable
public class ItemInventarioId implements Serializable {

    private Long codInventario;

    private Long codProduto;

    private Long codLoja;

    public ItemInventarioId() {
    }

    public ItemInventarioId(InventarioData inventarioData, VProduto vProduto, Long codLoja) {
        this.codInventario = inventarioData.getCodigo();
        this.codProduto = vProduto.getCodigo();
        this.codLoja = codLoja;
    }

    public Long getCodInventario() {
        return codInventario;
    }

    public void setCodInventario(Long codInventario) {
        this.codInventario = codInventario;
    }

    public Long getCodProduto() {
        return codProduto;
    }

    public void setCodProduto(Long codProduto) {
        this.codProduto = codProduto;
    }

    public Long getCodLoja() {
        return codLoja;
    }

    public void setCodLoja(Long codLoja) {
        this.codLoja = codLoja;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        ItemInventarioId that = (ItemInventarioId) o;
        return Objects.equals(codInventario, that.codInventario) && Objects.equals(codProduto, that.codProduto) && Objects.equals(codLoja, that.codLoja);
    }

    @Override
    public int hashCode() {
        return Objects.hash(codInventario, codProduto, codLoja);
    }

}
