package inventario.inventarioapi.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import inventario.inventarioapi.model.VProduto;
import inventario.inventarioapi.service.VprodutosService;

import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

@RestController
@RequestMapping("/produtos")
@CrossOrigin(origins = "*")  // Permite requisições de qualquer origem (para testes)
public class VprodutosController {

    @Autowired
    private VprodutosService vprodutosService;

    @GetMapping("/buscar")
    public List<VProduto> buscarProdutos(@RequestParam(required = false) String termo)
    {
        return vprodutosService.buscarProdutos(termo);
    }
}
