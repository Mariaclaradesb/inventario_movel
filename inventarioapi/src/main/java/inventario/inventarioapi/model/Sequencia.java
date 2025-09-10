package inventario.inventarioapi.model;

import jakarta.persistence.*;

@Entity
@Table(name = "SEQ_NVENDA2")
public class Sequencia {

    @EmbeddedId
    private SequenciaId id;


    public Sequencia(Long sequencia, Long codLoja) {
        this.id = new SequenciaId();
        this.id.setSequencia(sequencia);
        this.id.setCodLoja(codLoja);
    }

    public Sequencia() { }

    public SequenciaId getId() { return id; }
    public void setId(SequenciaId id) { this.id = id; }
}
