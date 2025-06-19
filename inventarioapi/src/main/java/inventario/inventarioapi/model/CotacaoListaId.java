package inventario.inventarioapi.model;

import java.io.Serializable;

import jakarta.persistence.*;

@Embeddable
public class CotacaoListaId implements Serializable{
    @Column(name = "CODIGOPRO")
    private Long codProduto;

    @Column(name = "CODCOTACAO")
    private Long codCotacao;
    
    public Long getCodProduto() {
        return codProduto;
    }

    public void setCodProduto(Long codProduto) {
        this.codProduto = codProduto;
    }

    public Long getCodCotacao() {
        return codCotacao;
    }

    public void setCodCotacao(Long codCotacao) {
        this.codCotacao = codCotacao;
    }
    
    
}
