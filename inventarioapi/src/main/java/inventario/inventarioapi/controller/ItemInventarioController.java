package inventario.inventarioapi.controller;

import inventario.inventarioapi.model.ItemInventario;
import inventario.inventarioapi.model.dto.ItemInventarioDTO;
import inventario.inventarioapi.service.ItemInventarioService;

import java.util.List;
import java.util.stream.Collectors;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/item-inventario")
public class ItemInventarioController {

    private final ItemInventarioService itemInventarioService;

    public ItemInventarioController(ItemInventarioService itemInventarioService) {
        this.itemInventarioService = itemInventarioService;
    }

    @GetMapping("/listar")
    public ResponseEntity<List<ItemInventarioDTO>> listarItens(@RequestParam Long storeId, @RequestParam Long inventoryId) {
        List<ItemInventario> itens = itemInventarioService.findAllByInventory(storeId, inventoryId);  // Chama o método no serviço
        List<ItemInventarioDTO> dtos = itens.stream()
            .map(ItemInventarioDTO::new) 
            .collect(Collectors.toList());
        return ResponseEntity.ok(dtos);  
    }
    

    @PostMapping("/salvar")
    public ResponseEntity<ItemInventarioDTO> adicionarItem(@RequestBody ItemInventarioDTO dados) {
        ItemInventario novoItem = itemInventarioService.adicionarItem(dados);
        var dto = new ItemInventarioDTO(novoItem);
        return ResponseEntity.ok(dto);
    }

}
