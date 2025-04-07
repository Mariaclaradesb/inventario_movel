package inventario.inventarioapi.model;

import jakarta.persistence.*;

//VPRODUTOS: CODIGO, CODLOJACDASTRO, NOME, QT, ALTERNATI, CBARRA, CBARRA2, CBARRA3, ORIGINAL, EST_ATUAL, PCO_REMAR

@Entity
@Table(name = "VPRODUTOS")
public class VProduto {
    @Id
    @Column(name = "CODIGO")
    private Long codigo;

    @ManyToOne
    @JoinColumn(name = "CODLOJACADASTRO") 
    private LojaFisica loja;

    @Column(name = "NOME")
    private String nome;

    @Column(name = "EST_ATUAL")
    private Double estAtual;

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
    private String pcoRemar;

    @Column(name = "UNIDADE")
    private String unidade;

    @Column(name = "PCO_COMPRA")
    private String pcoCompra;

    @Column(name = "C_AQUIS")
    private String cAquis;


    @Column(name = "PCO_LIQ")
    private String pcoLiq;

    @Column(name = "PCO_VENDA")
    private String pcoVenda;

    @Column(name = "PCO_02")
    private String pco02;

    @Column(name = "PCO_03")
    private String pco03;

    @Column(name = "PCO_04")    
    private String pco04;

    @Column(name = "PCO_AVENDA")
    private String pcoAVenda;

    @Column(name = "PCO_AREMAR")
    private String pcoARemar;

    @Column(name = "EST_DEPOSITO")
    private Double estDeposito;

    @Column(name = "EST_LOJA")
    private Double estLoja;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "MARCA", referencedColumnName = "CODIGO", nullable = false) 
    private Marcas marca;

    public VProduto() {
    }



    public Long getCodigo() {
        return codigo;
    }



    public void setCodigo(Long codigo) {
        this.codigo = codigo;
    }


    public String getNome() {
        return nome;
    }



    public void setNome(String nome) {
        this.nome = nome;
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



    public String getPcoRemar() {
        return pcoRemar;
    }



    public void setPcoRemar(String pcoRemar) {
        this.pcoRemar = pcoRemar;
    }



    public String getUnidade() {
        return unidade;
    }



    public void setUnidade(String unidade) {
        this.unidade = unidade;
    }



    public Marcas getMarca() {
        return marca;
    }



    public void setMarca(Marcas marca) {
        this.marca = marca;
    }



    public LojaFisica getLoja() {
        return loja;
    }

    public void setLoja(LojaFisica loja) {
        this.loja = loja;
    }



    public double getEstAtual() {
        return estAtual;
    }



    public void setEstAtual(double estAtual) {
        this.estAtual = estAtual;
    }



    public String getPcoCompra() {
        return pcoCompra;
    }



    public void setPcoCompra(String pcoCompra) {
        this.pcoCompra = pcoCompra;
    }



    public String getcAquis() {
        return cAquis;
    }



    public void setcAquis(String cAquis) {
        this.cAquis = cAquis;
    }



    public String getPcoLiq() {
        return pcoLiq;
    }



    public void setPcoLiq(String pcoLiq) {
        this.pcoLiq = pcoLiq;
    }



    public String getPcoVenda() {
        return pcoVenda;
    }



    public void setPcoVenda(String pcoVenda) {
        this.pcoVenda = pcoVenda;
    }



    public String getPco02() {
        return pco02;
    }



    public void setPco02(String pco02) {
        this.pco02 = pco02;
    }



    public String getPco03() {
        return pco03;
    }



    public void setPco03(String pco03) {
        this.pco03 = pco03;
    }



    public String getPco04() {
        return pco04;
    }



    public void setPco04(String pco04) {
        this.pco04 = pco04;
    }



    public String getPcoAVenda() {
        return pcoAVenda;
    }



    public void setPcoAVenda(String pcoAVenda) {
        this.pcoAVenda = pcoAVenda;
    }



    public String getPcoARemar() {
        return pcoARemar;
    }



    public void setPcoARemar(String pcoARemar) {
        this.pcoARemar = pcoARemar;
    }



    public double getEstDeposito() {
        return estDeposito;
    }



    public void setEstDeposito(double estDeposito) {
        this.estDeposito = estDeposito;
    }



    public double getEstLoja() {
        return estLoja;
    }



    public void setEstLoja(double estLoja) {
        this.estLoja = estLoja;
    }

    
}