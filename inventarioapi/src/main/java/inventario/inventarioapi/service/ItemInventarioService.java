package inventario.inventarioapi.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import inventario.inventarioapi.model.InventarioData;
import inventario.inventarioapi.model.ItemInventario;
import inventario.inventarioapi.model.ItemInventarioDTO;
import inventario.inventarioapi.model.VProduto;
import inventario.inventarioapi.repository.InventarioDataRepository;
import inventario.inventarioapi.repository.ItemInventarioRepository;
import inventario.inventarioapi.repository.VprodutosRepository;

import java.util.List;

@Service
public class ItemInventarioService {

    @Autowired
    private ItemInventarioRepository itemInventarioRepository;  

    @Autowired
    private InventarioDataRepository inventarioDataRepository;

    @Autowired
    private VprodutosRepository vprodutosRepository;

    public ItemInventario adicionarItem(ItemInventarioDTO dados) {
        InventarioData inventarioData = inventarioDataRepository.findById(dados.codInventario())
        .orElseThrow(() -> new RuntimeException("Inventário não encontrado"));

        VProduto vproduto = vprodutosRepository.findById(dados.codProduto())
        .orElseThrow(() -> new RuntimeException("Produto não encontrado"));

        ItemInventario item = new ItemInventario(inventarioData, vproduto, dados.estAtual(), dados.estLoja());
        
        return itemInventarioRepository.save(item);
    }

    public List<ItemInventario> findAllByInventory(Long storeId, Long inventoryId) {
        return findAllByInventory(storeId, inventoryId);
    }
}
