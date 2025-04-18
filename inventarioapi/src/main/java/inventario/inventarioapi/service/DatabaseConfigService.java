package inventario.inventarioapi.service;

import inventario.inventarioapi.model.dto.ConnectionData;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.SpringApplication;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Service;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

@Service
public class DatabaseConfigService {

    @Value("${properties-file-path}")
    private String propertiesFilePath;


    private final ApplicationContext context;

    public DatabaseConfigService(ApplicationContext context) {
        this.context = context;
    }

    public String configDatabase(ConnectionData connectionData) {
        try {
            var props = getProperties(connectionData);

            String message = testConnection(connectionData.getJdbcUrl(), connectionData.user(), connectionData.password());

            saveDatabaseProperties(props);

            return message;
        } catch (Exception e) {
            throw new RuntimeException("Falha na conexão com o banco de dados: " + e.getMessage());
        }
    }

    public void restartServer() {
        Thread thread = new Thread(() -> {
            try {
                Thread.sleep(2000);
                SpringApplication.exit(context, () -> 0);
            } catch (InterruptedException e) {
                throw new RuntimeException("Erro ao reiniciar a aplicação!");
            }
        });
        thread.setDaemon(false);
        thread.start();
    }

    private String testConnection(String url, String user, String password) {
        try (Connection con = DriverManager.getConnection(url, user, password)) {
            return "Conexão bem sucedida!\nO servidor será reiniciado!";
        } catch (SQLException e) {
            throw new RuntimeException("Falha na conexão com o banco de dados: " + e.getMessage());
        }
    }

    private void saveDatabaseProperties(Properties props) {
        try (FileOutputStream output = new FileOutputStream(propertiesFilePath)) {
            props.store(output, null);
        } catch (IOException e) {
            throw new RuntimeException("Erro ao salvar configuração: " + e.getMessage());
        }
    }

    private Properties getProperties(ConnectionData connectionData) throws IOException {
        Properties props = new Properties();

        try (FileInputStream input = new FileInputStream(propertiesFilePath)) {
            props.load(input);
        }

        props.setProperty("spring.datasource.url", connectionData.getJdbcUrl());
        props.setProperty("spring.datasource.username", connectionData.user());
        props.setProperty("spring.datasource.password", connectionData.password());
        props.setProperty("spring.datasource.driver-class-name", "com.microsoft.sqlserver.jdbc.SQLServerDriver");
        props.setProperty("spring.jpa.properties.hibernate.dialect", "org.hibernate.dialect.SQLServerDialect");

        return props;
    }

}
