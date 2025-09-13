package inventario.inventarioapi.model;

import java.io.Serializable;

import jakarta.persistence.Column;
import jakarta.persistence.Embeddable;

@Embeddable
public class SequenciaId implements Serializable {

    @Column(name = "SEQUENCIA")
    private Long sequencia;

    @Column(name = "CODLOJA")
    private Long codLoja;

    public Long getCodLoja() {
        return codLoja;
    }

    public void setCodLoja(Long codLoja) {
        this.codLoja = codLoja;
    }

    public Long getSequencia() {
        return sequencia;
    }

    public void setSequencia(Long sequencia) {
        this.sequencia = sequencia;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof SequenciaId)) return false;

        SequenciaId that = (SequenciaId) o;

        if (!sequencia.equals(that.sequencia)) return false;
        return codLoja.equals(that.codLoja);
    }

    @Override
    public int hashCode() {
        int result = sequencia.hashCode();
        result = 31 * result + codLoja.hashCode();
        return result;
    }
}
