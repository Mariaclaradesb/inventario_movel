package inventario.inventarioapi.model.dto;

import inventario.inventarioapi.model.ItemInventario;
import inventario.inventarioapi.model.VProdutoId;

public record RelatorioDivergenciasDTO(Long codInventario, String dataInventario, String nomeInventario, VProdutoId codProduto, String cbarra, String nomeProduto, Long estLoja, Long estLojaProd, int divergencia) {
    public RelatorioDivergenciasDTO(ItemInventario object) {
        this(object.getCodigo().getCodInventario(),
             object.getInventarioData().getData().toString(),
             object.getInventarioData().getNome(),
             object.getProduto().getCodigo(),
             object.getProduto().getCbarra(),
             object.getProduto().getNome(),
             object.getEstLoja(),
             object.getProduto().getEstLoja(),
            (int) ((object.getEstLoja() != null ? object.getEstLoja() : 0L) -
       (object.getProduto().getEstLoja() != null ? object.getProduto().getEstLoja() : 0L))
);

    }
}
