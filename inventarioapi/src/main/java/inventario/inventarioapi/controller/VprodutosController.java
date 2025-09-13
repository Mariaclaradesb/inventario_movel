package inventario.inventarioapi.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import inventario.inventarioapi.model.VProduto;
import inventario.inventarioapi.service.VprodutosService;

@RestController
@RequestMapping("/produtos")
@CrossOrigin(origins = "*")
public class VprodutosController {

    @Autowired
    private VprodutosService vprodutosService;

    @GetMapping("/buscar")
    public List<VProduto> buscarProdutos(@RequestParam String termo, @RequestParam Long codLoja) {
        return vprodutosService.buscarProdutos(termo, codLoja);
    }
}

