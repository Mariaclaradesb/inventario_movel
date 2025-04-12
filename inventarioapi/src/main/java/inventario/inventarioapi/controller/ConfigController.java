package inventario.inventarioapi.controller;

import inventario.inventarioapi.config.DatabaseConfig;
import inventario.inventarioapi.config.DynamicDatabaseConfig;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.sql.DataSource;
import java.sql.Connection;

@RestController
@RequestMapping("/config")
public class ConfigController {

    @PostMapping("/ip")
    public ResponseEntity<String> setDatabaseIp(@RequestBody String ip) {
        if (ip == null || ip.trim().isEmpty()) {
            return ResponseEntity.badRequest().body("IP não pode ser vazio.");
        }

        if (!ip.matches("^[\\d.]+(:\\d+)?$")) {
            return ResponseEntity.badRequest().body("IP inválido: " + ip);
        }

        try {
            DynamicDatabaseConfig.setDbIp(ip);

            DataSource ds = new DatabaseConfig().dataSource();
            try (Connection conn = ds.getConnection()) {
                System.out.println("Conexão bem-sucedida com o IP: " + ip);
            }

            return ResponseEntity.ok("IP configurado com sucesso: " + ip);
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.status(500)
                    .body("Erro ao configurar IP: " + e.getMessage());
        }
    }

}
