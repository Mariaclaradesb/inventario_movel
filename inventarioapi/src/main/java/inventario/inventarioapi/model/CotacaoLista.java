package inventario.inventarioapi.model;

import jakarta.persistence.*;

@Entity
@Table(name = "COTACAOLISTA")
public class CotacaoLista {
    
    @EmbeddedId
    private CotacaoListaId codigo;

    @ManyToOne
    @MapsId("codPro")
    @JoinColumn(name = "CODIGOPRO", referencedColumnName = "CODIGO")
    private VProduto produto;

    @ManyToOne
    @MapsId("codCotacao")
    @JoinColumn(name = "CODCOTACAO", referencedColumnName = "CODIGO")
    private CotacaoContro cotacaoContro;

    @Column(name = "UNIDADE")
    private String unidade;

    @Column(name = "QTEEMBALAGEM")
    private Double qteEmbalagem;

    @Column(name = "DESCEMBALAGEM")
    private String descEmbalagem;

    @Column(name = "QUANTIDADE")
    private Double quantidade;

    @Column(name = "VALOR1")
    private Double valor1;

    @Column(name = "VALOR2")    
    private Double valor2;

    @Column(name = "VALOR3")
    private Double valor3;

    @Column(name = "VALOR4")
    private Double valor4;

    @Column(name = "VALOR5")
    private Double valor5;

    @Column(name = "VALOR6")
    private Double valor6;

    @Column(name = "VALOR7")
    private Double valor7;

    @Column(name = "VALOR8")
    private Double valor8;

    @Column(name = "VALOR9")
    private Double valor9;

    @Column(name = "VALOR10")
    private Double valor10;

    @Column(name = "VALOR11")
    private Double valor11;

    @Column(name = "VALOR12")
    private Double valor12;

    @Column(name = "VALOR13")
    private Double valor13;

    @Column(name = "VALOR14")
    private Double valor14;

    @Column(name = "VALOR15")
    private Double valor15;

    @Column(name = "VALOR16")
    private Double valor16;

    @Column(name = "VALOR17")
    private Double valor17;

    @Column(name = "VALOR18")
    private Double valor18;

    @Column(name = "VALOR19")
    private Double valor19;

    @Column(name = "VALOR20")
    private Double valor20;

    @Column(name = "VENCEDOR")
    private Double vencedor;

    @Column(name = "FECHMANUAL")
    private Double fechManual;

    @Column(name = "FORALIMITE")
    private Double foraLimite;

    @Column(name = "EMPATADO")
    private String empatado;


    public CotacaoLista() {
        this.codigo = new CotacaoListaId();
        this.unidade = "UN";
        this.qteEmbalagem = 1.0;
        this.descEmbalagem = "UN com 1";
        this.valor1 = 0.0;
        this.valor2 = 0.0;
        this.valor3 = 0.0;
        this.valor4 = 0.0;
        this.valor5 = 0.0;
        this.valor6 = 0.0;
        this.valor7 = 0.0;
        this.valor8 = 0.0;
        this.valor9 = 0.0;
        this.valor10 = 0.0;
        this.valor11 = 0.0;
        this.valor12 = 0.0;
        this.valor13 = 0.0;
        this.valor14 = 0.0;
        this.valor15 = 0.0;
        this.valor16 = 0.0;
        this.valor17 = 0.0;
        this.valor18 = 0.0;
        this.valor19 = 0.0;
        this.valor20 = 0.0;
        this.vencedor = 0.0;
        this.fechManual = 0.0;
        this.foraLimite = 0.0;
        this.empatado = null;

    }

    public CotacaoListaId getCodigo() {
        return codigo;
    }

    public void setCodigo(CotacaoListaId codigo) {
        this.codigo = codigo;
    }

    public VProduto getProduto() {
        return produto;
    }

    public void setProduto(VProduto produto) {
        this.produto = produto;
    }

    public CotacaoContro getCotacaoContro() {
        return cotacaoContro;
    }

    public void setCotacaoContro(CotacaoContro cotacaoContro) {
        this.cotacaoContro = cotacaoContro;
    }

    public String getUnidade() {
        return unidade;
    }

    public void setUnidade(String unidade) {
        this.unidade = unidade;
    }

    public Double getQteEmbalagem() {
        return qteEmbalagem;
    }

    public void setQteEmbalagem(Double qteEmbalagem) {
        this.qteEmbalagem = qteEmbalagem;
    }

    public String getDescEmbalagem() {
        return descEmbalagem;
    }

    public void setDescEmbalagem(String descEmbalagem) {
        this.descEmbalagem = descEmbalagem;
    }

    public Double getQuantidade() {
        return quantidade;
    }

    public void setQuantidade(Double quantidade) {
        this.quantidade = quantidade;
    }

    public Double getValor1() {
        return valor1;
    }

    public void setValor1(Double valor1) {
        this.valor1 = valor1;
    }

    public Double getValor2() {
        return valor2;
    }

    public void setValor2(Double valor2) {
        this.valor2 = valor2;
    }

    public Double getValor3() {
        return valor3;
    }

    public void setValor3(Double valor3) {
        this.valor3 = valor3;
    }

    public Double getValor4() {
        return valor4;
    }

    public void setValor4(Double valor4) {
        this.valor4 = valor4;
    }

    public Double getValor5() {
        return valor5;
    }

    public void setValor5(Double valor5) {
        this.valor5 = valor5;
    }

    public Double getValor6() {
        return valor6;
    }

    public void setValor6(Double valor6) {
        this.valor6 = valor6;
    }

    public Double getValor7() {
        return valor7;
    }

    public void setValor7(Double valor7) {
        this.valor7 = valor7;
    }

    public Double getValor8() {
        return valor8;
    }

    public void setValor8(Double valor8) {
        this.valor8 = valor8;
    }

    public Double getValor9() {
        return valor9;
    }

    public void setValor9(Double valor9) {
        this.valor9 = valor9;
    }

    public Double getValor10() {
        return valor10;
    }

    public void setValor10(Double valor10) {
        this.valor10 = valor10;
    }

    public Double getValor11() {
        return valor11;
    }

    public void setValor11(Double valor11) {
        this.valor11 = valor11;
    }

    public Double getValor12() {
        return valor12;
    }

    public void setValor12(Double valor12) {
        this.valor12 = valor12;
    }

    public Double getValor13() {
        return valor13;
    }

    public void setValor13(Double valor13) {
        this.valor13 = valor13;
    }

    public Double getValor14() {
        return valor14;
    }

    public void setValor14(Double valor14) {
        this.valor14 = valor14;
    }

    public Double getValor15() {
        return valor15;
    }

    public void setValor15(Double valor15) {
        this.valor15 = valor15;
    }

    public Double getValor16() {
        return valor16;
    }

    public void setValor16(Double valor16) {
        this.valor16 = valor16;
    }

    public Double getValor17() {
        return valor17;
    }

    public void setValor17(Double valor17) {
        this.valor17 = valor17;
    }

    public Double getValor18() {
        return valor18;
    }

    public void setValor18(Double valor18) {
        this.valor18 = valor18;
    }

    public Double getValor19() {
        return valor19;
    }

    public void setValor19(Double valor19) {
        this.valor19 = valor19;
    }

    public Double getValor20() {
        return valor20;
    }

    public void setValor20(Double valor20) {
        this.valor20 = valor20;
    }

    public Double getVencedor() {
        return vencedor;
    }

    public void setVencedor(Double vencedor) {
        this.vencedor = vencedor;
    }

    public Double getFechManual() {
        return fechManual;
    }

    public void setFechManual(Double fechManual) {
        this.fechManual = fechManual;
    }

    public Double getForaLimite() {
        return foraLimite;
    }

    public void setForaLimite(Double foraLimite) {
        this.foraLimite = foraLimite;
    }

    public String getEmpatado() {
        return empatado;
    }

    public void setEmpatado(String empatado) {
        this.empatado = empatado;
    }


    
}
