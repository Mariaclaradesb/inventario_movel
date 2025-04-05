package inventario.inventarioapi.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "MARCAS")
public class Marcas {

    @Id
    @Column(name = "CODIGO")
    private Long codigo;

    @Column(name = "CODLOJA")
    private Long codloja;

    @Column(name = "NOME")
    private String nome;

    public Long getCodigo() {
        return codigo;
    }

    public void setCodigo(Long codigo) {
        this.codigo = codigo;
    }

    public Long getCodloja() {
        return codloja;
    }

    public void setCodloja(Long codloja) {
        this.codloja = codloja;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

}
