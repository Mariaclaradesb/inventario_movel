package inventario.inventarioapi.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "VPRODUTOS")
public class VProduto {
    @Id
    @Column(name = "CODIGO")
    private Long codigo;

    @Column(name = "NOME")
    private String nome;

    public VProduto() {
    }

    public VProduto(Long codigo, String nome) {
        this.nome = nome;
        this.codigo = codigo;
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
}