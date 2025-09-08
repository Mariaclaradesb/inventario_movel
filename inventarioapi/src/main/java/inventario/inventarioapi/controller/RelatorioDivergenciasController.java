package inventario.inventarioapi.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import inventario.inventarioapi.model.dto.RelatorioDivergenciasDTO;
import inventario.inventarioapi.service.RelatorioDivergenciasService;

@RestController
@RequestMapping("/relatorio")
public class RelatorioDivergenciasController {
    
    @Autowired
    private RelatorioDivergenciasService relatorioDivergenciasService;

    @GetMapping("/divergencia/{codLoja}/{codInventario}")
    public List<RelatorioDivergenciasDTO> listarDivergencias(@PathVariable Long codLoja, @PathVariable Long codInventario) {
        return relatorioDivergenciasService.gerarRelatorio(codLoja, codInventario);
    }
}
