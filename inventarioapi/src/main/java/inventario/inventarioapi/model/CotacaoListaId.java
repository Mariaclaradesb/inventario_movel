package inventario.inventarioapi.model;

import java.io.Serializable;

import jakarta.persistence.*;

@Embeddable
public class CotacaoListaId implements Serializable{

    private VProdutoId codPro;
    private Long codCotacao;
    
    public VProdutoId getCodPro() {
        return codPro;
    }
    public void setCodPro(VProdutoId codPro) {
        this.codPro = codPro;
    }
    public Long getCodCotacao() {
        return codCotacao;
    }
    public void setCodCotacao(Long codCotacao) {
        this.codCotacao = codCotacao;
    }
    
    
}
