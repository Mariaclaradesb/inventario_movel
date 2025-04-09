package inventario.inventarioapi.controller;

import inventario.inventarioapi.model.ItemInventario;
import inventario.inventarioapi.model.ItemInventarioDTO;
import inventario.inventarioapi.service.ItemInventarioService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;


@RestController
@RequestMapping("/item-inventario")
public class ItemInventarioController {

    private final ItemInventarioService itemInventarioService;

    public ItemInventarioController(ItemInventarioService itemInventarioService) {
        this.itemInventarioService = itemInventarioService;
    }

    @PostMapping("/salvar")
    public ResponseEntity<ItemInventarioDTO> adicionarItem(@RequestBody ItemInventarioDTO dados) {
        ItemInventario novoItem = itemInventarioService.adicionarItem(dados);
        var dto = new ItemInventarioDTO(novoItem);
        return ResponseEntity.ok(dto);
    }

}
