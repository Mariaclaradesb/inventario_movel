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

    @ManyToOne
    @MapsId("codLoja")
    @JoinColumn(name = "CODLOJA", referencedColumnName = "CODIGO")
    private Empresa loja;

    @Column(name = "EST_ATUAL")
    private Long estAtual;

    @Column(name = "EST_LOJA")
    private Long estLoja;
    
    public ItemInventario(){}

    public ItemInventario(InventarioData inventarioData, VProduto vProduto, Long estAtual, Long estLoja, Empresa Empresa) {
        this.codigo = new ItemInventarioId(inventarioData, vProduto, Empresa.getCodigo());
        this.loja = Empresa;
        this.inventarioData = inventarioData;
        this.produto = vProduto;
        this.estAtual = estAtual;
        this.estLoja = estLoja;
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

    public Long getEstAtual() {
        return estAtual;
    }

    public void setEstAtual(Long estAtual) {
        this.estAtual = estAtual;
    }

    public Long getEstLoja() {
        return estLoja;
    }

    public void setEstLoja(Long estLoja) {
        this.estLoja = estLoja;
    }

    public Empresa getLoja() {
        return loja;
    }

    public void setLoja(Empresa loja) {
        this.loja = loja;
    }
}
