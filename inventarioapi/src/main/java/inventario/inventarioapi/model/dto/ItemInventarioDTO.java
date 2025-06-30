package inventario.inventarioapi.model.dto;

import inventario.inventarioapi.model.ItemInventario;
import inventario.inventarioapi.model.VProdutoId;

public record ItemInventarioDTO(Long codInventario, VProdutoId codProduto, Long estLoja, Long estLojaProd, String nomeProduto) {
    public ItemInventarioDTO(ItemInventario object) {
        this(object.getCodigo().getCodInventario(), object.getProduto().getCodigo(), object.getEstLoja(), object.getProduto().getEstLoja(), object.getProduto().getNome());
    }

}