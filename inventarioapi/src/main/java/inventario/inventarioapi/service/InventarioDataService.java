package inventario.inventarioapi.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import inventario.inventarioapi.repository.InventarioDataRepository;

@Service
public class InventarioDataService {
    @Autowired
    private InventarioDataRepository inventarioDataRepository;  
}
