package inventario.inventarioapi.controller;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/test")
public class DatabaseTestController {

    private final JdbcTemplate jdbcTemplate;

    public DatabaseTestController(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    @GetMapping("/db")
    public String testDatabaseConnection() {
        try {
            jdbcTemplate.queryForObject("SELECT TOP 1 nome FROM PRODUTOS", String.class);
            return "Conexão com o banco de dados foi bem-sucedida!";
        } catch (Exception e) {
            return "Erro ao conectar ao banco de dados: " + e.getMessage();
        }
    }
}
