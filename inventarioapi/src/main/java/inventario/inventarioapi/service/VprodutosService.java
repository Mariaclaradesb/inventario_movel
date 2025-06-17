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
    private VprodutosRepository vprodutosRepository;

    public List<VProduto> buscarProdutos(String termo, Long codLoja) {
    
        if (termo == null || termo.trim().isEmpty()) {
            throw new IllegalArgumentException("O campo de pesquisa não pode estar vazio.");
        }
        if (termo.matches("\\d+")) { 
            Long codigo = Long.parseLong(termo);
            VProdutoId id = new VProdutoId(codigo, codLoja);
            
            Optional<VProduto> produtoPorCodigo = vprodutosRepository.findById(id);
            if (produtoPorCodigo.isPresent()) {
                return List.of(produtoPorCodigo.get()); 
            }
        }
        return vprodutosRepository.buscarPorTodosOsCampos(termo, codLoja);
    }
    
}