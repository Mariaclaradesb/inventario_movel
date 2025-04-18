package inventario.inventarioapi.controller;

import inventario.inventarioapi.model.dto.ConnectionData;
import inventario.inventarioapi.service.DatabaseConfigService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/database")
public class DatabaseConfigController {

    private final DatabaseConfigService service;

    public DatabaseConfigController(DatabaseConfigService service) {
        this.service = service;
    }

    @PostMapping("/config")
    public ResponseEntity<String> configDatabase(@RequestBody ConnectionData connectionData) {
        String message = service.configDatabase(connectionData);
        service.restartServer();
        return ResponseEntity.ok(message);
    }

}
