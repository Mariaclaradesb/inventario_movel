package inventario.inventarioapi.controller;

import inventario.inventarioapi.model.ItemInventario;
import inventario.inventarioapi.model.NovoItemInventario;
import inventario.inventarioapi.service.ItemInventarioService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;


@RestController
@RequestMapping("/item-inventario")
public class ItemInventarioController {

    private final ItemInventarioService itemInventarioService;

    public ItemInventarioController(ItemInventarioService itemInventarioService) {
        this.itemInventarioService = itemInventarioService;
    }

    @PostMapping("/item/salvar")
    public ResponseEntity<ItemInventario> adicionarItem(@RequestBody NovoItemInventario dados) {
        ItemInventario novoItem = itemInventarioService.adicionarItem(dados);
        return ResponseEntity.ok(novoItem);
    }

}
