package inventario.inventarioapi.infra;

public class EntityNotFoundException extends Exception {
    public EntityNotFoundException(String msg) {
        super(msg);
    }
}
