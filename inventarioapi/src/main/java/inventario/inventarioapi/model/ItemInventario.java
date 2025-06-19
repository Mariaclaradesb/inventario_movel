package inventario.inventarioapi.model;

import jakarta.persistence.*;

@Entity
@Table(name = "ITEM_INVENTARIO_DATA")
public class ItemInventario {

    @EmbeddedId
    private ItemInventarioId codigo;

    @ManyToOne
    @MapsId("codInventario")
    @JoinColumn(name = "CODINVENTARIO", referencedColumnName = "CODIGO")
    private InventarioData inventarioData;

    @ManyToOne
    @MapsId("codProduto")
    @JoinColumns({
        @JoinColumn(name = "CODPRODUTO", referencedColumnName = "CODIGO"),
        @JoinColumn(name = "CODLOJA", referencedColumnName = "CODLOJA")
    })
    private VProduto produto;


    @Column(name = "EST_ATUAL")
    private Long estAtual;

    @Column(name = "EST_LOJA")
    private Long estLoja;
    
    public ItemInventario(){}

    public ItemInventario(InventarioData inventarioData, VProduto vProduto, Long estAtual, Long estLoja, Empresa Empresa) {
        this.codigo = new ItemInventarioId(inventarioData, vProduto);
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

}
