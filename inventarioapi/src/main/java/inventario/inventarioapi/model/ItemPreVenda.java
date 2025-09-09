package inventario.inventarioapi.model;

import jakarta.persistence.*;

import java.math.BigDecimal;
import java.time.Instant;

@Entity
@Table(name = "NVENDI2")
public class ItemPreVenda {
    @EmbeddedId
    private ItemPreVendaId id;

    @ManyToOne
    @MapsId("preVendaId"


    )
    @JoinColumn(name = "NUMVENDA")
    private PreVenda preVenda;

    @ManyToOne
    @MapsId("codProduto")
    @JoinColumn(name = "CODPRODUTO")
    private VProduto vProduto;

    @Column(name = "QUANTIDADE")
    private Long quantidade;

    @Column(name = "UNITARIO1")
    private Long unitario1;

    @Column(name = "UNITARIO2")
    private Long unitario2;

    @Column(name = "NVTOTAL")
    private Long nvTotal;

    @Column(name = "VALOR_ORIGINAL")
    private Long valorOriginal;

    @Column(name = "DATA")
    private Instant data;

    @Column(name = "MU_UNIDADE")
    private Long muUnidade;

    @Column(name = "MU_QTE_MENORUN")
    private Long menorUnidade;

    @Column(name = "CODIGO_PRO_SER")
    private String codigoBarra;

    @ManyToOne
    @JoinColumn(name = "CODVENDEDOR")
    private Funcionario vendedor;

    @Column(name = "DESCRICAO")
    private String descricao;

    @Column(name = "UNIDADE")
    private Long unidade;

    @Column(name = "DAV_NUMERO")
    private Long davNumero;

    @Column(name = "PCO_COMPRA")
    private BigDecimal pcoCompra;

    @Column(name = "C_AQUIS")
    private BigDecimal cAquis;

    @Column(name = "PCO_LIQ")
    private BigDecimal pcoLiq;

    @Column(name = "PCO_REMAR")
    private BigDecimal pcoRemar;

    @Column(name = "PCO_02")
    private BigDecimal pco02;

    @Column(name = "PCO_03")
    private BigDecimal pco03;

    @Column(name = "PCO_04")
    private BigDecimal pco04;

    @Column(name = "LUCRO_BRUTO")
    private BigDecimal lucroBruto;

    @Column(name = "LUCRO_REAL")
    private BigDecimal lucroReal;

    public PreVenda getPreVenda() {
        return preVenda;
    }

    public void setPreVenda(PreVenda preVenda) {
        this.preVenda = preVenda;
    }

    public VProduto getvProduto() {
        return vProduto;
    }

    public void setvProduto(VProduto vProduto) {
        this.vProduto = vProduto;
    }

    public Long getQuantidade() {
        return quantidade;
    }

    public void setQuantidade(Long quantidade) {
        this.quantidade = quantidade;
    }

    public Long getUnitario1() {
        return unitario1;
    }

    public void setUnitario1(Long unitario1) {
        this.unitario1 = unitario1;
    }

    public Long getUnitario2() {
        return unitario2;
    }

    public void setUnitario2(Long unitario2) {
        this.unitario2 = unitario2;
    }

    public Long getNvTotal() {
        return nvTotal;
    }

    public void setNvTotal(Long nvTotal) {
        this.nvTotal = nvTotal;
    }

    public Long getValorOriginal() {
        return valorOriginal;
    }

    public void setValorOriginal(Long valorOriginal) {
        this.valorOriginal = valorOriginal;
    }

    public Instant getData() {
        return data;
    }

    public void setData(Instant data) {
        this.data = data;
    }

    public Long getMuUnidade() {
        return muUnidade;
    }

    public void setMuUnidade(Long muUnidade) {
        this.muUnidade = muUnidade;
    }

    public Long getMenorUnidade() {
        return menorUnidade;
    }

    public void setMenorUnidade(Long menorUnidade) {
        this.menorUnidade = menorUnidade;
    }

    public String getCodigoBarra() {
        return codigoBarra;
    }

    public void setCodigoBarra(String codigoBarra) {
        this.codigoBarra = codigoBarra;
    }

    public Funcionario getVendedor() {
        return vendedor;
    }

    public void setVendedor(Funcionario vendedor) {
        this.vendedor = vendedor;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public Long getUnidade() {
        return unidade;
    }

    public void setUnidade(Long unidade) {
        this.unidade = unidade;
    }

    public Long getDavNumero() {
        return davNumero;
    }

    public void setDavNumero(Long davNumero) {
        this.davNumero = davNumero;
    }

    public BigDecimal getPcoCompra() {
        return pcoCompra;
    }

    public void setPcoCompra(BigDecimal pcoCompra) {
        this.pcoCompra = pcoCompra;
    }

    public BigDecimal getcAquis() {
        return cAquis;
    }

    public void setcAquis(BigDecimal cAquis) {
        this.cAquis = cAquis;
    }

    public BigDecimal getPcoLiq() {
        return pcoLiq;
    }

    public void setPcoLiq(BigDecimal pcoLiq) {
        this.pcoLiq = pcoLiq;
    }

    public BigDecimal getPcoRemar() {
        return pcoRemar;
    }

    public void setPcoRemar(BigDecimal pcoRemar) {
        this.pcoRemar = pcoRemar;
    }

    public BigDecimal getPco02() {
        return pco02;
    }

    public void setPco02(BigDecimal pco02) {
        this.pco02 = pco02;
    }

    public BigDecimal getPco03() {
        return pco03;
    }

    public void setPco03(BigDecimal pco03) {
        this.pco03 = pco03;
    }

    public BigDecimal getPco04() {
        return pco04;
    }

    public void setPco04(BigDecimal pco04) {
        this.pco04 = pco04;
    }

    public BigDecimal getLucroBruto() {
        return lucroBruto;
    }

    public void setLucroBruto(BigDecimal lucroBruto) {
        this.lucroBruto = lucroBruto;
    }

    public BigDecimal getLucroReal() {
        return lucroReal;
    }

    public void setLucroReal(BigDecimal lucroReal) {
        this.lucroReal = lucroReal;
    }
}
