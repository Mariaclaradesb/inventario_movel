package inventario.inventarioapi.service;

import inventario.inventarioapi.model.CotacaoContro;
import inventario.inventarioapi.model.CotacaoLista;
import inventario.inventarioapi.model.CotacaoListaId;
import inventario.inventarioapi.model.Produto;
import inventario.inventarioapi.repository.CotacaoControRepository;
import inventario.inventarioapi.repository.CotacaoListaRepository;
import inventario.inventarioapi.repository.ProdutoRepository;
import org.springframework.stereotype.Service;

@Service
public class CotacaoListaService {

    private final CotacaoListaRepository cotacaoListaRepository;
    private final ProdutoRepository produtoRepository;
    private final CotacaoControRepository cotacaoControRepository;

    public CotacaoListaService(CotacaoListaRepository cotacaoListaRepository,
                               ProdutoRepository produtoRepository,
                               CotacaoControRepository cotacaoControRepository) {
        this.cotacaoListaRepository = cotacaoListaRepository;
        this.produtoRepository = produtoRepository;
        this.cotacaoControRepository = cotacaoControRepository;
    }

    public void adicionarItemAoCarrinho(Long codigoProduto, Double quantidade) {
        Produto produto = produtoRepository.findById(codigoProduto)
            .orElseThrow(() -> new RuntimeException("Produto não encontrado"));

        CotacaoContro cotacao = cotacaoControRepository.findById(1L)
            .orElseThrow(() -> new RuntimeException("Cotação com código 1 não encontrada"));

        CotacaoListaId id = new CotacaoListaId();
        id.setCodCotacao(cotacao.getCodigo());
        id.setCodProduto(codigoProduto);

        CotacaoLista item = new CotacaoLista();
        item.setCodigo(id);
        item.setProduto(produto);
        item.setCotacaoContro(cotacao);
        item.setQuantidade(quantidade);

        cotacaoListaRepository.save(item);
    }
}
