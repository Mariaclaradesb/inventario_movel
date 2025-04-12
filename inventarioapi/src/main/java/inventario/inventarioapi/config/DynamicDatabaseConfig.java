package inventario.inventarioapi.config;

public class DynamicDatabaseConfig {
    private static String dbIp = "localhost"; // valor padrão

    public static String getDbIp() {
        return dbIp;
    }

    public static void setDbIp(String ip) {
        dbIp = ip;
    }
}
