package inventario.inventarioapi.service;

import inventario.inventarioapi.model.*;
import inventario.inventarioapi.repository.ProdutosRepository;
import org.springframework.stereotype.Service;

import inventario.inventarioapi.repository.CotacaoControRepository;
import inventario.inventarioapi.repository.CotacaoListaRepository;
import inventario.inventarioapi.repository.VprodutosRepository;

@Service
public class CotacaoListaService {

    private final CotacaoListaRepository cotacaoListaRepository;
    private final ProdutosRepository produtosRepository;
    private final CotacaoControRepository cotacaoControRepository;

    public CotacaoListaService(CotacaoListaRepository cotacaoListaRepository,
                               ProdutosRepository produtosRepository,
                               CotacaoControRepository cotacaoControRepository) {
        this.cotacaoListaRepository = cotacaoListaRepository;
        this.produtosRepository = produtosRepository;
        this.cotacaoControRepository = cotacaoControRepository;
    }

    public void adicionarItemAoCarrinho(Long codigoProduto, Double quantidade) {
        Produto produto = produtosRepository.findById(codigoProduto)
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
