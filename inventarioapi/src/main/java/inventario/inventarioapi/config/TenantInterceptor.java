package inventario.inventarioapi.config;

import inventario.inventarioapi.model.dto.DbConnectionInfo;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

@Component
public class TenantInterceptor implements HandlerInterceptor {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) {
        String dbIp = request.getHeader("X-DB-IP");
        String dbPort = request.getHeader("X-DB-Port");
        String dbName = request.getHeader("X-DB-Name");
        String dbUser = request.getHeader("X-DB-User");
        String dbPassword = request.getHeader("X-DB-Password");

        if (dbIp != null && dbPort != null && dbUser != null && dbPassword != null) {
            DbConnectionInfo connectionInfo = new DbConnectionInfo(dbIp, dbPort, dbName, dbUser, dbPassword);
            TenantContext.setConnectionInfo(connectionInfo);
        }
        return true;
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) {
        TenantContext.clear();
    }
}