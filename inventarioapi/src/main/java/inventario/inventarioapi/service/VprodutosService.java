package inventario.inventarioapi.service;

import inventario.inventarioapi.model.VProduto;
import inventario.inventarioapi.repository.VprodutosRepository; // Use o repositório novamente!
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class VprodutosService {

    @Autowired
    private VprodutosRepository vprodutosRepository; 

    public List<VProduto> buscarProdutos(String termo, Long codLoja) {
        return vprodutosRepository.buscarPorTodosOsCampos(termo, codLoja);
    }
}