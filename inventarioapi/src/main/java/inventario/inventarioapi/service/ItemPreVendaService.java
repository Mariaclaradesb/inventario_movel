package inventario.inventarioapi.service;

import inventario.inventarioapi.infra.EntityNotFoundException;
import inventario.inventarioapi.model.Funcionario;
import inventario.inventarioapi.model.ItemPreVenda;
import inventario.inventarioapi.model.ItemPreVendaId;
import inventario.inventarioapi.model.dto.ItemPreVendaInsert;
import inventario.inventarioapi.repository.ItemPreVendaRepository;
import inventario.inventarioapi.repository.PreVendaRepository;
import inventario.inventarioapi.repository.ProdutoRepository;
import jakarta.transaction.Transactional;

import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ItemPreVendaService {
    private final ItemPreVendaRepository repository;
    private final VprodutosService vprodutoService;
    private final ProdutoRepository produtoRepository;
    private final PreVendaRepository preVendaRepository;

    public ItemPreVendaService(ItemPreVendaRepository repository, VprodutosService vprodutoService, ProdutoRepository produtoRepository, PreVendaRepository preVendaRepository) {
        this.repository = repository;
        this.vprodutoService = vprodutoService;
        this.produtoRepository = produtoRepository;
        this.preVendaRepository = preVendaRepository;
    }

    @Transactional
    public ItemPreVenda save(ItemPreVendaInsert item, Long codigoVenda) throws EntityNotFoundException {
        var vProduto = vprodutoService.findById(item.codProduto(), item.codLoja())
                .orElseThrow(() -> new EntityNotFoundException("Produto não encontrado!"));

        var produto = produtoRepository.findById(item.codProduto())
                .orElseThrow(() -> new EntityNotFoundException("Produto não encontrado!"));

        var preVenda = preVendaRepository.findById(codigoVenda)
                .orElseThrow(() -> new EntityNotFoundException("Venda não encontrada!"));

        var obj = new ItemPreVenda(vProduto, produto);

        var id = this.getId(item.codProduto(), codigoVenda);
        obj.setId(id);

        obj.setMenorUnidade(item.quantidade());

        var vendedor = new Funcionario();
        vendedor.setCodigo(item.codVendedor());
        obj.setVendedor(vendedor);

        obj.setPreVenda(preVenda);
        obj.setDavNumero(codigoVenda);

        return repository.save(obj);
    }


    private ItemPreVendaId getId(Long codProduto, Long codigoVenda) {
        var id = new ItemPreVendaId();
        id.setCodigoVenda(codigoVenda);
        id.setCodProduto(codProduto);

        var lastId = repository.getLastItemId(codProduto, codigoVenda);
        Long nextItemId = 0L;

        nextItemId = (lastId != null) ? lastId + 1 : 1L;

        id.setItemId(nextItemId);

        return id;
    }

    public List<ItemPreVenda> getByPreVenda(Long codigoVenda) {
        return repository.findAllById_CodigoVenda(codigoVenda);
    }

    @Transactional
    public ItemPreVenda update(Long codigoVenda, Long codProduto, Long itemId, Long quantidade) throws EntityNotFoundException {
        ItemPreVendaId id = new ItemPreVendaId();
        id.setCodigoVenda(codigoVenda);
        id.setCodProduto(codProduto);
        id.setItemId(itemId);

        repository.updateQuantity(id, quantidade);
        return repository.findById(id)
                .orElseThrow(() -> new EntityNotFoundException("Item não encontrado!"));
    }

    public void delete(Long itemId, Long codigoVenda, Long codProduto) {
        var id = new ItemPreVendaId();
        id.setCodigoVenda(codigoVenda);
        id.setItemId(itemId);
        id.setCodProduto(codProduto);

        repository.deleteById(id);
    }
}
