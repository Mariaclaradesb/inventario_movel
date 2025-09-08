package inventario.inventarioapi.service;

import inventario.inventarioapi.model.Empresa;
import inventario.inventarioapi.repository.EmpresaRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class EmpresaService {

    @Autowired
    private EmpresaRepository lojaRepository;

    public List<Empresa> listarTodas() {
        return lojaRepository.findAll();
    }

    public Empresa findById(Long id) {
        return lojaRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Loja não encontrada"));
    }

}
