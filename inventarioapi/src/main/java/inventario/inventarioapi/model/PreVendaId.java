package inventario.inventarioapi.model;

import jakarta.persistence.Column;
import jakarta.persistence.Embeddable;

import java.io.Serializable;
import java.util.Objects;

@Embeddable
public class PreVendaId implements Serializable {
    @Column(name = "CODLOJA")
    private Long codLoja;

    @Column(name = "SEQUENCIA")
    private Long sequencia;

    public PreVendaId() {
    }

    public PreVendaId(Long codLoja, Long sequencia) {
        this.codLoja = codLoja;
        this.sequencia = sequencia;
    }

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
        if (o == null || getClass() != o.getClass()) return false;
        PreVendaId that = (PreVendaId) o;
        return Objects.equals(codLoja, that.codLoja) && Objects.equals(sequencia, that.sequencia);
    }

    @Override
    public int hashCode() {
        return Objects.hash(codLoja, sequencia);
    }

    @Override
    public String toString() {
        return "PreVendaId{" +
                "codLoja=" + codLoja +
                ", sequencia=" + sequencia +
                '}';
    }
}
