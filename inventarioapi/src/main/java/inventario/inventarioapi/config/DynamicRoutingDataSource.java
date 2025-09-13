package inventario.inventarioapi.config;

import inventario.inventarioapi.model.dto.DbConnectionInfo;
import org.springframework.jdbc.datasource.lookup.AbstractRoutingDataSource;

import javax.sql.DataSource;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

public class DynamicRoutingDataSource extends AbstractRoutingDataSource {

    private final Map<Object, Object> dataSources = new ConcurrentHashMap<>();

    public DynamicRoutingDataSource() {
        super.setTargetDataSources(dataSources);
    }

    @Override
    protected Object determineCurrentLookupKey() {
        return TenantContext.getConnectionInfo();
    }

    @Override
    protected DataSource determineTargetDataSource() {
        DbConnectionInfo connectionInfo = (DbConnectionInfo) determineCurrentLookupKey();
        if (connectionInfo == null) {
            return null;
        }

        if (!dataSources.containsKey(connectionInfo)) {
            DataSource dataSource = DataSourceUtil.createDataSource(
                connectionInfo.ip(),
                connectionInfo.port(),
                connectionInfo.dbName(),
                connectionInfo.user(),
                connectionInfo.password()
            );
            dataSources.put(connectionInfo, dataSource);
            super.afterPropertiesSet(); 
        }
        return (DataSource) dataSources.get(connectionInfo);
    }
}