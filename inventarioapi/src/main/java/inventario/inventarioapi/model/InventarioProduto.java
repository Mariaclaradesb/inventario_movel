package inventario.inventarioapi.model;

import java.io.Serializable;

import jakarta.persistence.Column;
import jakarta.persistence.Embeddable;

@Embeddable
public class InventarioProduto implements Serializable {

    @Column(name = "CODINVENTARIO")
    private Long codInventario;

    @Column(name = "CODPRODUTO")
    private Long codProduto;

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

    
}
