package inventario.inventarioapi.model;

import java.io.Serializable;

import jakarta.persistence.Embedded;

public class NVendiId implements Serializable {

    private Long codigoVenda;
    private Long item;

    @Embedded
    private VProdutoId codProduto;

    public NVendiId() {
    }

    public NVendiId(NVenda nVenda, VProduto vProduto, Long item) {
        this.codigoVenda = nVenda.getCodigoVenda();
        this.codProduto = vProduto.getCodigo();
        this.item = item;
    }

    public Long getCodigoVenda() {
        return codigoVenda;
    }

    public void setCodigoVenda(Long codigoVenda) {
        this.codigoVenda = codigoVenda;
    }

    public VProdutoId getCodProduto() {
        return codProduto;
    }

    public void setCodProduto(VProdutoId codProduto) {
        this.codProduto = codProduto;
    }

    public Long getItem() {
        return item;
    }

    public void setItem(Long item) {
        this.item = item;
    }

}
