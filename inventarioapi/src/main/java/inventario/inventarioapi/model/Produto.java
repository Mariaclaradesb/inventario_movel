package inventario.inventarioapi.model;

import jakarta.persistence.*;

import java.io.Serializable;
import java.util.Objects;

@Entity
@Table(name = "PRODUTOS")
public class Produto implements Serializable {
    @Id
    @Column(name = "CODIGO", insertable = false, updatable = false)
    private Long codigo;

    @Column(name = "NOME", insertable = false, updatable = false)
    private String nome;

    @ManyToOne
    @JoinColumn(name = "MARCA")
    private Marca marca;

    @Column(name = "UNIDADE")
    private String unidade;

    @Column(name = "CBARRA")
    private String cbarra;

    @Column(name = "CBARRA2")
    private String cbarra2;

    @Column(name = "CBARRA3")
    private String cbarra3;

    @Column(name = "ORIGINAL")
    private String original;

    public Produto() {
    }

    public Produto(Long codigo, String nome, Marca marca, String unidade, String cbarra, String cbarra2, String cbarra3, String original) {
        this.codigo = codigo;
        this.nome = nome;
        this.marca = marca;
        this.unidade = unidade;
        this.cbarra = cbarra;
        this.cbarra2 = cbarra2;
        this.cbarra3 = cbarra3;
        this.original = original;
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

    public Marca getMarca() {
        return marca;
    }

    public void setMarca(Marca marca) {
        this.marca = marca;
    }

    public String getUnidade() {
        return unidade;
    }

    public void setUnidade(String unidade) {
        this.unidade = unidade;
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

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Produto produto = (Produto) o;
        return Objects.equals(codigo, produto.codigo);
    }

    @Override
    public int hashCode() {
        return Objects.hashCode(codigo);
    }
}
