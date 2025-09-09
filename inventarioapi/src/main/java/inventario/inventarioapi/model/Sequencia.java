package inventario.inventarioapi.model;

import jakarta.persistence.*;

@Entity
@Table(name = "SEQ_NVENDA2")
public class Sequencia {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "SEQUENCIA")
    private Long sequencia;

    @Column(name = "CODLOJA")
    private Long codLoja;

    public Sequencia(Long sequencia, Long codLoja) {
        this.sequencia = sequencia;
        this.codLoja = codLoja;
    }

    public Sequencia() {
    }

    public Long getSequencia() {
        return sequencia;
    }

    public void setSequencia(Long sequencia) {
        this.sequencia = sequencia;
    }

    public Long getCodLoja() {
        return codLoja;
    }

    public void setCodLoja(Long codLoja) {
        this.codLoja = codLoja;
    }
}
