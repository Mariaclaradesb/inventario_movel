package inventario.inventarioapi.service;

import inventario.inventarioapi.model.LojaFisica;
import inventario.inventarioapi.repository.LojaFisicaRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class LojaFisicaService {

    @Autowired
    private LojaFisicaRepository lojaRepository;

    public List<LojaFisica> listarTodas() {
        return lojaRepository.findAll();
    }
}
