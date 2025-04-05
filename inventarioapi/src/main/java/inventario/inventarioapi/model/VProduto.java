package inventario.inventarioapi.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

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
    private Long qt;

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



    public Long getQt() {
        return qt;
    }



    public void setQt(Long qt) {
        this.qt = qt;
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

}