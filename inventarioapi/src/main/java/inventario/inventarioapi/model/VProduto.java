package inventario.inventarioapi.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

//VPRODUTOS: CODIGO, CODLOJACDASTRO, NOME, QT, ALTERNATI, CBARRA, CBARRA2, CBARRA3, ORIGINAL, EST_ATUAL, PCO_REMAR

@Entity
@Table(name = "VPRODUTOS")
public class VProduto {
    @Id
    @Column(name = "CODIGO")
    private Long codigo;

    @Column(name = "CODLOJACADASTRO")
    private Long codlojacadastro;

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



    public VProduto() {
    }



    public Long getCodigo() {
        return codigo;
    }



    public void setCodigo(Long codigo) {
        this.codigo = codigo;
    }



    public Long getCodlojacadastro() {
        return codlojacadastro;
    }



    public void setCodlojacadastro(Long codlojacadastro) {
        this.codlojacadastro = codlojacadastro;
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

}