package inventario.inventarioapi.controller;

import inventario.inventarioapi.model.PreVenda;
import inventario.inventarioapi.model.dto.PreVendaInsert;
import inventario.inventarioapi.service.PreVendaService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/pre-vendas")
public class PreVendaController {
    private final PreVendaService service;

    public PreVendaController(PreVendaService service) {
        this.service = service;
    }

    @GetMapping
    public ResponseEntity<List<PreVenda>> getAll(@RequestParam Long codLoja) {
        var list = service.getAll(codLoja);
        return ResponseEntity.ok(list);
    }

    @PostMapping
    public ResponseEntity<PreVenda> insert(@RequestBody PreVendaInsert preVenda) {
        var obj = service.save(preVenda);
        return ResponseEntity.status(HttpStatus.CREATED)
                .body(obj);
    }
}
