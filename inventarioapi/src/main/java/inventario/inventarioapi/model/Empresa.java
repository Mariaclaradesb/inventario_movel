package inventario.inventarioapi.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "EMPRESA")
public class Empresa {
    
    @Id
    @Column(name = "CODIGO")
    private Long codigo;

    @Column(name = "NOME")
    private String nome;

    public Long getCodigo() {
        return codigo;
    }

    public String getNome() {
        return nome;
    }

}
