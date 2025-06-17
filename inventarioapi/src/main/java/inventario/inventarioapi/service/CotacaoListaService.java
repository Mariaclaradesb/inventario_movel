package inventario.inventarioapi.service;

import org.springframework.stereotype.Service;

import inventario.inventarioapi.model.CotacaoContro;
import inventario.inventarioapi.model.CotacaoLista;
import inventario.inventarioapi.model.CotacaoListaId;
import inventario.inventarioapi.model.VProduto;
import inventario.inventarioapi.model.VProdutoId;
import inventario.inventarioapi.repository.CotacaoControRepository;
import inventario.inventarioapi.repository.CotacaoListaRepository;
import inventario.inventarioapi.repository.VprodutosRepository;

@Service
public class CotacaoListaService {

    private final CotacaoListaRepository cotacaoListaRepository;
    private final VprodutosRepository vprodutosRepository;
    private final CotacaoControRepository cotacaoControRepository;

    public CotacaoListaService(CotacaoListaRepository cotacaoListaRepository,
                               VprodutosRepository vprodutosRepository,
                               CotacaoControRepository cotacaoControRepository) {
        this.cotacaoListaRepository = cotacaoListaRepository;
        this.vprodutosRepository = vprodutosRepository;
        this.cotacaoControRepository = cotacaoControRepository;
    }

    public void adicionarItemAoCarrinho(VProdutoId codigoProduto, Double quantidade) {
        VProduto produto = vprodutosRepository.findById(codigoProduto)
            .orElseThrow(() -> new RuntimeException("Produto não encontrado"));

        CotacaoContro cotacao = cotacaoControRepository.findById(1L)
            .orElseThrow(() -> new RuntimeException("Cotação com código 1 não encontrada"));

        CotacaoListaId id = new CotacaoListaId();
        id.setCodCotacao(cotacao.getCodigo());
        id.setCodPro(produto.getCodigo());

        CotacaoLista item = new CotacaoLista();
        item.setCodigo(id);
        item.setProduto(produto);
        item.setCotacaoContro(cotacao); 
        item.setQuantidade(quantidade);

        cotacaoListaRepository.save(item);
    }
}
