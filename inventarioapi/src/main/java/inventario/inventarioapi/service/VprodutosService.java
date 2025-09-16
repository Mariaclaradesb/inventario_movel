package inventario.inventarioapi.service;

import java.util.List;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import inventario.inventarioapi.model.VProduto;
import inventario.inventarioapi.model.VProdutoId;
import inventario.inventarioapi.repository.VprodutosRepository;

@Service
public class VprodutosService {

    @Autowired
    private VprodutosRepository repository;

    public List<VProduto> buscarProdutos(String termo, Long codLoja) {

        if (termo == null || termo.trim().isEmpty()) {
            throw new IllegalArgumentException("O campo de pesquisa não pode estar vazio.");
        }

        if (termo.matches("\\d+")) {
            Long codigoTermo;
            try {
                codigoTermo = Long.parseLong(termo);
            } catch (NumberFormatException e) {

                codigoTermo = -1L;
            }
            return repository.buscarPorCamposNumericos(codigoTermo, termo, codLoja);
        } else {
            return repository.buscarPorCamposDeTexto(termo, codLoja);
        }
    }

    public Optional<VProduto> findById(Long codProduto, Long codLoja) {
        var id = new VProdutoId();
        id.setCodigo(codProduto);
        id.setCodLoja(codLoja);
        return repository.findById(id);
    }
}