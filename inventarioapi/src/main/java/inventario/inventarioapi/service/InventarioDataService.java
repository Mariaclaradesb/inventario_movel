package inventario.inventarioapi.service;

import inventario.inventarioapi.model.InventarioData;
import inventario.inventarioapi.model.ItemInventario;
import inventario.inventarioapi.model.Empresa;
import inventario.inventarioapi.model.dto.NovoInventarioData;
import inventario.inventarioapi.repository.InventarioDataRepository;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

@Service
public class InventarioDataService {

    private final InventarioDataRepository repository;
    private final ItemInventarioService itemInventarioService;
    private final EmpresaService EmpresaService;

    public InventarioDataService(InventarioDataRepository repository, ItemInventarioService itemInventarioService, EmpresaService EmpresaService) {
        this.repository = repository;
        this.itemInventarioService = itemInventarioService;
        this.EmpresaService = EmpresaService;
    }

    public InventarioData create(Long storeId, NovoInventarioData newInventoryDate) {
        InventarioData object = createNewInventoryDate(storeId, newInventoryDate);
        return repository.save(object);
    }

    public List<InventarioData> findAllByStore(Long storeId) {
        return repository.findByLojaCodigo(storeId);
    }

    private InventarioData createNewInventoryDate(Long storeId, NovoInventarioData newInventoryDate) {
        Long id = repository.findNewId();
        Empresa store = EmpresaService.findById(storeId);
        LocalDateTime date = LocalDateTime.now();
        String hour = date.format(DateTimeFormatter.ofPattern("HH:mm:ss"));
        String name = newInventoryDate.nome();

        return new InventarioData(id, store, date, hour, name, 0);
    }

    public List<ItemInventario> findItensByInventory(Long storeId, Long inventoryId) {
        return itemInventarioService.findAllByInventory(storeId, inventoryId);
    }

}