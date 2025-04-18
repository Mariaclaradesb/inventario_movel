package inventario.inventarioapi.model.dto;

public record ConnectionData(String url, Long port, String user, String password) {

    public String getJdbcUrl() {
        return String.format("jdbc:sqlserver://%s:%d;databaseName=SCEPRO;encrypt=true;trustServerCertificate=true;sslProtocol=TLSv1.2;", this.url(), this.port());
    }

}
