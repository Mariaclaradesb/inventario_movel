package inventario.inventarioapi.model;

public record ItemInventarioDTO(Long codInventario, Long codProduto, Long estAtual, Long estLoja) {
    public ItemInventarioDTO(ItemInventario object) {
        this(object.getCodigo().getCodInventario(), object.getProduto().getCodigo(), object.getEstAtual(), object.getEstLoja());
    }
}