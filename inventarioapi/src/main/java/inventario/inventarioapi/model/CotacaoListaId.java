package inventario.inventarioapi.model;

import java.io.Serializable;

import jakarta.persistence.*;

@Embeddable
public class CotacaoListaId implements Serializable{

    private Long codPro;
    private Long codCotacao;
    
    public Long getCodPro() {
        return codPro;
    }
    public void setCodPro(Long codPro) {
        this.codPro = codPro;
    }
    public Long getCodCotacao() {
        return codCotacao;
    }
    public void setCodCotacao(Long codCotacao) {
        this.codCotacao = codCotacao;
    }
    
    
}
