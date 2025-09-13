package inventario.inventarioapi.model;

import java.io.Serializable;

import com.fasterxml.jackson.annotation.JsonCreator;
import com.fasterxml.jackson.annotation.JsonProperty;

import jakarta.persistence.Column;
import jakarta.persistence.Embeddable;

@Embeddable
public class VProdutoId implements Serializable {
    
    @Column(name="CODIGO")
    private Long codigo;

    private Long codLoja;

    public VProdutoId() {
    }

    @JsonCreator
    public VProdutoId(
        @JsonProperty Long codigo, 
        @JsonProperty Long codLoja
        ) {
        this.codigo = codigo;
        this.codLoja = codLoja;
    }

    public Long getCodigo() {
        return codigo;
    }

    public void setCodigo(Long codigo) {
        this.codigo = codigo;
    }

    public Long getCodLoja() {
        return codLoja;
    }

    public void setCodLoja(Long codLoja) {
        this.codLoja = codLoja;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof VProdutoId)) return false;

        VProdutoId that = (VProdutoId) o;

        if (!codigo.equals(that.codigo)) return false;
        return codLoja.equals(that.codLoja);
    }

    @Override
    public int hashCode() {
        int result = codigo.hashCode();
        result = 31 * result + codLoja.hashCode();
        return result;
    }
    
}
