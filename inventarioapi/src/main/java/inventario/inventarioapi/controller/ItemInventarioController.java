package inventario.inventarioapi.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import inventario.inventarioapi.model.ItemInventario;
import inventario.inventarioapi.model.NovoInventario;
import inventario.inventarioapi.service.ItemInventarioService;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;


@RestController
@RequestMapping("/item-inventario")
public class ItemInventarioController {
    
    @Autowired 
    private ItemInventarioService itemInventarioService;

    @PostMapping("/salvar-item")
    public ResponseEntity<ItemInventario> adicionarItem(@RequestBody NovoInventario dados) {
        ItemInventario novoItem = itemInventarioService.adicionarItem(dados);
        return ResponseEntity.ok(novoItem);
    }
    

}
