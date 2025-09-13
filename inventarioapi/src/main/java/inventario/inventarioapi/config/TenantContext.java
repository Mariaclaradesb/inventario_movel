package inventario.inventarioapi.config;

import inventario.inventarioapi.model.dto.DbConnectionInfo; // Criaremos este DTO a seguir

public final class TenantContext {

    private static final ThreadLocal<DbConnectionInfo> CONTEXT = new ThreadLocal<>();

    public static void setConnectionInfo(DbConnectionInfo connectionInfo) {
        CONTEXT.set(connectionInfo);
    }

    public static DbConnectionInfo getConnectionInfo() {
        return CONTEXT.get();
    }

    public static void clear() {
        CONTEXT.remove();
    }
}