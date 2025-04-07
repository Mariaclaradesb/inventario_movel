package inventario.inventarioapi.model;

import com.fasterxml.jackson.annotation.JsonIgnore;

import jakarta.persistence.Column;
import jakarta.persistence.EmbeddedId;
import jakarta.persistence.Entity;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.MapsId;
import jakarta.persistence.Table;

@Entity
@Table(name = "ITEM_INVENTARIO_DATA")
public class ItemInventario {

    @EmbeddedId
    private ItemInventarioId codigo;

    @ManyToOne
    @MapsId("codInventario")
    @JoinColumn(name = "CODINVENTARIO", referencedColumnName = "CODIGO" )
    private InventarioData inventarioData;

    @ManyToOne
    @MapsId("codProduto")
    @JoinColumn(name = "CODPRODUTO", referencedColumnName = "CODIGO" )
    private VProduto produto;

    @JsonIgnore
    @ManyToOne
    @MapsId("codLoja")
    @JoinColumn(name = "CODLOJA", referencedColumnName = "CODLOJA_FISICA")
    private LojaFisica loja;

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


    public ItemInventarioId getCodigo() {
        return codigo;
    }

    public void setCodigo(ItemInventarioId codigo) {
        this.codigo = codigo;
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

    public LojaFisica getLoja() {
        return loja;
    }

    public void setLoja(LojaFisica loja) {
        this.loja = loja;
    }
}
