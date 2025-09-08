package inventario.inventarioapi.model;

import jakarta.persistence.Embeddable;
import jakarta.persistence.Embedded;

import java.io.Serializable;
import java.util.Objects;

@Embeddable
public class ItemInventarioId implements Serializable {

    private Long codInventario;

    @Embedded
    private VProdutoId codProduto;

    public ItemInventarioId() {
    }

    public ItemInventarioId(InventarioData inventarioData, VProduto vProduto) {
        this.codInventario = inventarioData.getCodigo();
        this.codProduto = vProduto.getCodigo();
    }

    public Long getCodInventario() {
        return codInventario;
    }

    public void setCodInventario(Long codInventario) {
        this.codInventario = codInventario;
    }

    public VProdutoId getCodProduto() {
        return codProduto;
    }

    public void setCodProduto(VProdutoId codProduto) {
        this.codProduto = codProduto;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        ItemInventarioId that = (ItemInventarioId) o;
        return Objects.equals(codInventario, that.codInventario) && Objects.equals(codProduto, that.codProduto);
    }

    @Override
    public int hashCode() {
        return Objects.hash(codInventario, codProduto);
    }

}
