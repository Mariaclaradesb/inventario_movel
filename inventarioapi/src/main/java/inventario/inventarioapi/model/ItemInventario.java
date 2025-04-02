package inventario.inventarioapi.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

@Entity
@Table(name = "ITEM_INVENTARIO_DATA")
public class ItemInventario {

    @ManyToOne
    @JoinColumn(name = "CODINVENTARIO")
    private InventarioData inventarioData;

    @ManyToOne
    @JoinColumn(name = "CODPRODUTO")
    private VProduto produto;

    @Column(name = "EST_ATUAL")
    private Double estAtual;

    @Column(name = "EST_LOJA")
    private Double estLoja;
    
    public ItemInventario(){}

    public ItemInventario(InventarioData inventarioData, VProduto vProduto, double estAtual, double estLoja) {
        this.inventarioData = inventarioData;
        this.produto = vProduto;
        this.estAtual = (double) estAtual;
        this.estLoja = (double) estLoja;
    }

    public InventarioData getInventarioData() {
        return inventarioData;
    }

    public void setInventarioData(InventarioData inventarioData) {
        this.inventarioData = inventarioData;
    }

    public VProduto getProduto() {
        return produto;
    }

    public void setProduto(VProduto produto) {
        this.produto = produto;
    }

    public Double getEstAtual() {
        return estAtual;
    }

    public void setEstAtual(Double estAtual) {
        this.estAtual = estAtual;
    }

    public Double getEstLoja() {
        return estLoja;
    }

    public void setEstLoja(Double estLoja) {
        this.estLoja = estLoja;
    }

}
