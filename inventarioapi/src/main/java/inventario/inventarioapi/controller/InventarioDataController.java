package inventario.inventarioapi.controller;

import inventario.inventarioapi.model.InventarioData;
import inventario.inventarioapi.model.ItemInventarioDTO;
import inventario.inventarioapi.model.NovoInventarioData;
import inventario.inventarioapi.service.InventarioDataService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/inventarios")
public class InventarioDataController {

    private final InventarioDataService service;

    public InventarioDataController(InventarioDataService service) {
        this.service = service;
    }

    @PostMapping("/criar")
    ResponseEntity<InventarioData> create(@RequestParam Long codLoja, @RequestBody NovoInventarioData newInventoryDate) {
        var inventoryDate = service.create(codLoja, newInventoryDate);
        return ResponseEntity.status(HttpStatus.CREATED).body(inventoryDate);
    }

    @GetMapping("/buscar")
    ResponseEntity<List<InventarioData>> findAllByStore(@RequestParam Long codLoja) {
        var inventories = service.findAllByStore(codLoja);
        return ResponseEntity.ok(inventories);
    }

    @GetMapping("/buscar/{inventoryId}/itens")
    ResponseEntity<List<ItemInventarioDTO>> findItensByInventory(@RequestParam Long codLoja, @PathVariable Long inventoryId) {
        var items = service.findItensByInventory(codLoja, inventoryId)
                .stream()
                .map(ItemInventarioDTO::new)
                .toList();

        return ResponseEntity.ok(items);
    }

}
