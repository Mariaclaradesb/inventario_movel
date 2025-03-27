package inventario.inventarioapi.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import inventario.inventarioapi.model.VProduto;
import inventario.inventarioapi.service.VprodutosService;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

@RestController
@RequestMapping("/produtos")
public class VprodutosController {
    
    @Autowired
    private VprodutosService vprodutosService;

    public VprodutosController(VprodutosService vprodutosService) {
        this.vprodutosService = vprodutosService;
    }

    // Endpoint para buscar um produto pelo ID
    // @GetMapping("/{codigo}")
    // public Map<String, Object> getProdutoById(@PathVariable Long codigo) {
    //     return vprodutosService.getProdutoById(codigo);
    // }

    // Endpoint para buscar todos os produtos
    @GetMapping
    public List<VProduto> getTodosProdutos() {
        return vprodutosService.getProdutoById();
    }

    
}
