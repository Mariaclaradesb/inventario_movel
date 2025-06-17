package inventario.inventarioapi.model;

import jakarta.persistence.*;

import java.math.BigDecimal;

//VPRODUTOS: CODIGO, CODLOJACDASTRO, NOME, QT, ALTERNATI, CBARRA, CBARRA2, CBARRA3, ORIGINAL, EST_ATUAL, PCO_REMAR

@Entity
@Table(name = "VPRODUTOS")
public class VProduto {
    @EmbeddedId
    private VProdutoId codigo;

    @Column(name = "NOME")
    private String nome;

    @Column(name = "EST_ATUAL")
    private Long estAtual;

    @Column(name = "ALTERNATI")
    private String alternati;

    @Column(name = "CBARRA")
    private String cbarra;

    @Column(name = "CBARRA2")
    private String cbarra2;

    @Column(name = "CBARRA3")
    private String cbarra3;

    @Column(name = "ORIGINAL")
    private String original;

    @Column(name = "PCO_REMAR")
    private BigDecimal pcoRemar;

    @Column(name = "UNIDADE")
    private String unidade;

    @Column(name = "PCO_COMPRA")
    private BigDecimal pcoCompra;

    @Column(name = "C_AQUIS")
    private BigDecimal cAquis;


    @Column(name = "PCO_LIQ")
    private BigDecimal pcoLiq;

    @Column(name = "PCO_VENDA")
    private BigDecimal pcoVenda;

    @Column(name = "PCO_02")
    private BigDecimal pco02;

    @Column(name = "PCO_03")
    private BigDecimal pco03;

    @Column(name = "PCO_04")
    private BigDecimal pco04;

    @Column(name = "PCO_AVENDA")
    private BigDecimal pcoAVenda;

    @Column(name = "PCO_AREMAR")
    private BigDecimal pcoARemar;

    @Column(name = "EST_DEPOSITO")
    private Long estDeposito;

    @Column(name = "EST_LOJA")
    private Long estLoja;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "MARCA", referencedColumnName = "CODIGO", nullable = false) 
    private Marcas marca;

    public VProduto() {
    }

    public VProdutoId getCodigo() {
        return codigo;
    }

    public void setCodigo(VProdutoId codigo) {
        this.codigo = codigo;
    }
    
    // public Empresa getLoja() {
    //     return loja;
    // }

    // public void setLoja(Empresa loja) {
    //     this.loja = loja;
    // }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public Long getEstAtual() {
        return estAtual;
    }

    public void setEstAtual(Long estAtual) {
        this.estAtual = estAtual;
    }

    public String getAlternati() {
        return alternati;
    }

    public void setAlternati(String alternati) {
        this.alternati = alternati;
    }

    public String getCbarra() {
        return cbarra;
    }

    public void setCbarra(String cbarra) {
        this.cbarra = cbarra;
    }

    public String getCbarra2() {
        return cbarra2;
    }

    public void setCbarra2(String cbarra2) {
        this.cbarra2 = cbarra2;
    }

    public String getCbarra3() {
        return cbarra3;
    }

    public void setCbarra3(String cbarra3) {
        this.cbarra3 = cbarra3;
    }

    public String getOriginal() {
        return original;
    }

    public void setOriginal(String original) {
        this.original = original;
    }

    public BigDecimal getPcoRemar() {
        return pcoRemar;
    }

    public void setPcoRemar(BigDecimal pcoRemar) {
        this.pcoRemar = pcoRemar;
    }

    public String getUnidade() {
        return unidade;
    }

    public void setUnidade(String unidade) {
        this.unidade = unidade;
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

    public BigDecimal getPcoVenda() {
        return pcoVenda;
    }

    public void setPcoVenda(BigDecimal pcoVenda) {
        this.pcoVenda = pcoVenda;
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

    public BigDecimal getPcoAVenda() {
        return pcoAVenda;
    }

    public void setPcoAVenda(BigDecimal pcoAVenda) {
        this.pcoAVenda = pcoAVenda;
    }

    public BigDecimal getPcoARemar() {
        return pcoARemar;
    }

    public void setPcoARemar(BigDecimal pcoARemar) {
        this.pcoARemar = pcoARemar;
    }

    public Long getEstDeposito() {
        return estDeposito;
    }

    public void setEstDeposito(Long estDeposito) {
        this.estDeposito = estDeposito;
    }

    public Long getEstLoja() {
        return estLoja;
    }

    public void setEstLoja(Long estLoja) {
        this.estLoja = estLoja;
    }

    public Marcas getMarca() {
        return marca;
    }

    public void setMarca(Marcas marca) {
        this.marca = marca;
    }
}