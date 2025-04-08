package inventario.inventarioapi.service;

import inventario.inventarioapi.model.InventarioData;
import inventario.inventarioapi.model.LojaFisica;
import inventario.inventarioapi.model.NovoInventarioData;
import inventario.inventarioapi.repository.InventarioDataRepository;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

@Service
public class InventarioDataService {

    private final InventarioDataRepository repository;
    private final LojaFisicaService lojaFisicaService;

    public InventarioDataService(InventarioDataRepository repository, LojaFisicaService lojaFisicaService) {
        this.repository = repository;
        this.lojaFisicaService = lojaFisicaService;
    }

    public InventarioData create(Long storeId, NovoInventarioData newInventoryDate) {
        InventarioData object = createNewInventoryDate(storeId, newInventoryDate);
        return repository.save(object);
    }

    private InventarioData createNewInventoryDate(Long storeId, NovoInventarioData newInventoryDate) {
        Long id = repository.findNewId();
        LojaFisica store = lojaFisicaService.findById(storeId);
        LocalDateTime date = LocalDateTime.now();
        String hour = date.format(DateTimeFormatter.ofPattern("HH:mm:ss"));
        String name = newInventoryDate.nome();

        return new InventarioData(id, store, date, hour, name, 0);
    }

}
