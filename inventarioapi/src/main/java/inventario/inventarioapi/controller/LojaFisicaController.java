package inventario.inventarioapi.controller;

import inventario.inventarioapi.repository.LojaFisicaRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/lojas")
public class LojaFisicaController {

    @Autowired
    private LojaFisicaRepository lojaRepository;

    @GetMapping
    public ResponseEntity<List<Long>> getLojas() {
        List<Long> codigosLojas = lojaRepository.findAllCodigos(); // Chama o método do repository para pegar apenas os códigos
        return ResponseEntity.ok(codigosLojas); // Retorna a lista de códigos
    }
}

