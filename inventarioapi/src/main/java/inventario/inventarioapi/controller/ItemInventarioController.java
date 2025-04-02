package inventario.inventarioapi.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import inventario.inventarioapi.model.ItemInventario;
import inventario.inventarioapi.service.ItemInventarioService;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;


@RestController
@RequestMapping("/item-inventario")
public class ItemInventarioController {
    
    @Autowired 
    private ItemInventarioService itemInventarioService;

    @PostMapping("/salvar-item")
    public ResponseEntity<ItemInventario> adicionarItem(@RequestBody Map<String, Object> dados) {
        try {
            Long codInventario = Long.valueOf(dados.get("codInventario").toString());
            Long codProduto = Long.valueOf(dados.get("codProduto").toString());
            double estAtual = Integer.parseInt(dados.get("estAtual").toString());
            double estLoja = Integer.parseInt(dados.get("estLoja").toString());

            ItemInventario novoItem = itemInventarioService.adicionarItem(codInventario, codProduto, estAtual, estLoja);
            return ResponseEntity.ok(novoItem);
        } catch (Exception e) {
            return ResponseEntity.badRequest().body(null);
        }
    }
    

}
