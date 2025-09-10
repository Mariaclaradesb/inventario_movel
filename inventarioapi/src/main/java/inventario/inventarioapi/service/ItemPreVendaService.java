package inventario.inventarioapi.service;

import inventario.inventarioapi.infra.EntityNotFoundException;
import inventario.inventarioapi.model.Funcionario;
import inventario.inventarioapi.model.ItemPreVenda;
import inventario.inventarioapi.model.ItemPreVendaId;
import inventario.inventarioapi.model.dto.ItemPreVendaInsert;
import inventario.inventarioapi.repository.ItemPreVendaRepository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ItemPreVendaService {
    private final ItemPreVendaRepository repository;
    private final VprodutosService vprodutoService;

    public ItemPreVendaService(ItemPreVendaRepository repository, VprodutosService vprodutoService) {
        this.repository = repository;
        this.vprodutoService = vprodutoService;
    }

    public ItemPreVenda save(ItemPreVendaInsert item, Long codigoVenda) throws EntityNotFoundException {
        var produto = vprodutoService.findById(item.codProduto(), item.codLoja())
                .orElseThrow(() -> new EntityNotFoundException("Produto não encontrado!"));

        var obj = new ItemPreVenda(produto);

        var id = this.getId(item.codProduto(), codigoVenda);
        obj.setId(id);

        obj.setMenorUnidade(item.quantidade());

        var vendedor = new Funcionario();
        vendedor.setCodigo(item.codVendedor());
        obj.setVendedor(vendedor);

        obj.setDavNumero(codigoVenda);

        return repository.save(obj);
    }


    private ItemPreVendaId getId(Long codProduto, Long codigoVenda) {
        var id = new ItemPreVendaId();
        id.setCodigoVenda(codigoVenda);
        id.setCodProduto(codProduto);

        var nextItemId = repository.getLastItemId(codProduto, codigoVenda) + 1;
        id.setItemId(nextItemId);

        return id;
    }

    public List<ItemPreVenda> getByPreVenda(Long codigoVenda) {
        return repository.findAllById_CodigoVenda(codigoVenda);
    }

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
