package inventario.inventarioapi.model.dto;

import inventario.inventarioapi.model.ItemInventario;

public record ItemInventarioDTO(Long codInventario, Long codProduto, Long estAtual, Long estLoja) {
    public ItemInventarioDTO(ItemInventario object) {
        this(object.getCodigo().getCodInventario(), object.getProduto().getCodigo(), object.getEstAtual(), object.getEstLoja());
    }
}