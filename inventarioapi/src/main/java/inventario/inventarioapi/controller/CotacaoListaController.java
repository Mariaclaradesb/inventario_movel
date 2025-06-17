package inventario.inventarioapi.controller;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import inventario.inventarioapi.model.VProdutoId;
import inventario.inventarioapi.service.CotacaoListaService;

@RestController
@RequestMapping("/cotacao-lista")
public class CotacaoListaController {

    private final CotacaoListaService cotacaoListaService;

    public CotacaoListaController(CotacaoListaService cotacaoListaService) {
        this.cotacaoListaService = cotacaoListaService;
    }

    @PostMapping("/adicionar")
    public ResponseEntity<String> adicionarItem(
            @RequestParam Long codigo, // Vem de VProdutoId
            @RequestParam Long codLoja, // Vem de VProdutoId
            @RequestParam Long codCotacao,
            @RequestParam Double quantidade) {

        VProdutoId codigoProduto = new VProdutoId(codigo, codLoja);

        cotacaoListaService.adicionarItemAoCarrinho(codigoProduto, quantidade);
        return ResponseEntity.ok("Item adicionado ao carrinho com sucesso!");
    }

}