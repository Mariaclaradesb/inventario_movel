package inventario.inventarioapi.model;

import jakarta.persistence.Embeddable;

import java.io.Serializable;

@Embeddable
public class ItemInventarioId implements Serializable {

    private Long codInventario;

    private Long codProduto;

    private Long codLoja;

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

}
