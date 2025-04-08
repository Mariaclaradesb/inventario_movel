package inventario.inventarioapi.controller;

import inventario.inventarioapi.model.InventarioData;
import inventario.inventarioapi.model.NovoInventarioData;
import inventario.inventarioapi.service.InventarioDataService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/inventario-data")
public class InventarioDataController {

    private final InventarioDataService service;

    public InventarioDataController(InventarioDataService service) {
        this.service = service;
    }

    @PostMapping("/criar")
    ResponseEntity<InventarioData> create(@RequestParam Long codLoja, NovoInventarioData newInventoryDate) {
        var inventoryDate = service.create(codLoja, newInventoryDate);
        return ResponseEntity.status(HttpStatus.CREATED).body(inventoryDate);
    }

    @GetMapping("/buscar")
    ResponseEntity<List<InventarioData>> findAllByStore(@RequestParam Long codLoja) {
        var inventories = service.findAllByStore(codLoja);
        return ResponseEntity.ok(inventories);
    }

}
