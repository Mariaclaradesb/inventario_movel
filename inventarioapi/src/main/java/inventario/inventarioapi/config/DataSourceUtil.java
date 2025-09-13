package inventario.inventarioapi.config;

import org.springframework.jdbc.datasource.DriverManagerDataSource;
import javax.sql.DataSource;

public class DataSourceUtil {

    public static DataSource createDataSource(String ip, String port, String dbName, String user, String password) {
        String databaseName = (dbName == null || dbName.trim().isEmpty()) ? "SCEPRO" : dbName;

        String url = String.format(
            "jdbc:sqlserver://%s:%s;databaseName=%s;encrypt=true;trustServerCertificate=true;",
            ip, port, databaseName
        );

        DriverManagerDataSource dataSource = new DriverManagerDataSource();
        dataSource.setDriverClassName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        dataSource.setUrl(url);
        dataSource.setUsername(user);
        dataSource.setPassword(password);
        return dataSource;
    }
}