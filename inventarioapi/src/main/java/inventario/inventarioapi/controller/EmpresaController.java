package inventario.inventarioapi.controller;

import inventario.inventarioapi.model.Empresa;
import inventario.inventarioapi.model.dto.EmpresaDTO;
import inventario.inventarioapi.repository.EmpresaRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/lojas")
public class EmpresaController {
    @Autowired
    private EmpresaRepository lojaRepository;

    @GetMapping
    public ResponseEntity<List<EmpresaDTO>> getLojas() {
        List<EmpresaDTO> codigosENomes = lojaRepository.findAllCodigosENomes();
        return ResponseEntity.ok(codigosENomes);
    }
}

