package inventario.inventarioapi.model;

import jakarta.persistence.*;

@Entity
@Table(name = "SEQ_NVENDA2")
public class Sequencia {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "SEQUENCIA")
    private Long sequencia;

    public Long getSequencia() {
        return sequencia;
    }

    public void setSequencia(Long sequencia) {
        this.sequencia = sequencia;
    }
}
