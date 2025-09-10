package inventario.inventarioapi.controller;

import inventario.inventarioapi.infra.EntityNotFoundException;
import inventario.inventarioapi.model.ItemPreVenda;
import inventario.inventarioapi.model.dto.ItemPreVendaInsert;
import inventario.inventarioapi.service.ItemPreVendaService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/pre-vendas/{codigoVenda}/itens")
public class ItemPreVendaController {
    private final ItemPreVendaService service;

    public ItemPreVendaController(ItemPreVendaService service) {
        this.service = service;
    }

    @PostMapping
    public ResponseEntity<ItemPreVenda> insert(@PathVariable Long codigoVenda, @RequestBody ItemPreVendaInsert item) throws EntityNotFoundException {
        var obj = service.save(item, codigoVenda);
        return ResponseEntity.status(HttpStatus.CREATED)
                .body(obj);
    }

    @GetMapping
    public ResponseEntity<List<ItemPreVenda>> getByPreVenda(@PathVariable Long codigoVenda) {
        var list = service.getByPreVenda(codigoVenda);
        return ResponseEntity.ok(list);
    }

    @PutMapping
    public ResponseEntity<ItemPreVenda> update(@PathVariable Long codigoVenda, @RequestParam Long codProduto, @RequestParam Long itemId, @RequestParam Long quantidade) throws EntityNotFoundException {
        var obj = service.update(codigoVenda, codProduto, itemId, quantidade);
        return ResponseEntity.ok(obj);
    }

    @DeleteMapping
    public ResponseEntity<Void> delete(@RequestParam Long itemId, @RequestParam Long codigoVenda, @RequestParam Long codProduto) {
        service.delete(itemId, codigoVenda, codProduto);
        return ResponseEntity.noContent().build();
    }
}
