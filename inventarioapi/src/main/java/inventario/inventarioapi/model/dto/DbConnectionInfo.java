package inventario.inventarioapi.model.dto;

public record DbConnectionInfo(String ip, String port, String dbName, String user, String password) {
}