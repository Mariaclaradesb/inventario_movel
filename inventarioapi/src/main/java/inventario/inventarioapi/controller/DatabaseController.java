package inventario.inventarioapi.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.SQLException;

@RestController
@RequestMapping("/api")
public class DatabaseController {

    @Autowired
    private DataSource dataSource;

    @GetMapping("/database-name")
    public ResponseEntity<String> getDatabaseName() throws SQLException {
        try (Connection conn = dataSource.getConnection()) {
            String dbName = conn.getCatalog();
            return ResponseEntity.ok(dbName);
        }
    }
}
