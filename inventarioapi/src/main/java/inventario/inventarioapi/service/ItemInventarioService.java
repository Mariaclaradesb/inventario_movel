package inventario.inventarioapi.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import inventario.inventarioapi.model.InventarioData;
import inventario.inventarioapi.model.ItemInventario;
import inventario.inventarioapi.model.VProduto;
import inventario.inventarioapi.repository.InventarioDataRepository;
import inventario.inventarioapi.repository.ItemInventarioRepository;
import inventario.inventarioapi.repository.VprodutosRepository;

@Service
public class ItemInventarioService {

    @Autowired
    private ItemInventarioRepository itemInventarioRepository;  

    @Autowired
    private InventarioDataRepository inventarioDataRepository;

    @Autowired
    private VprodutosRepository vprodutosRepository;

    public ItemInventario adicionarItem(Long codInventario, Long codProduto, double estAtual, double estLoja) {
        InventarioData inventarioData = inventarioDataRepository.findById(codInventario)
        .orElseThrow(() -> new RuntimeException("Inventário não encontrado"));

        VProduto vproduto = vprodutosRepository.findById(codProduto)
        .orElseThrow(() -> new RuntimeException("Produto não encontrado"));

        ItemInventario item = new ItemInventario(inventarioData, vproduto, estAtual, estLoja);
        
        return itemInventarioRepository.save(item);
    }

    
    
}
