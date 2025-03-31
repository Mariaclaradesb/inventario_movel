package inventario.inventarioapi.service;

import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import inventario.inventarioapi.model.VProduto;
import inventario.inventarioapi.repository.VprodutosRepository;

@Service
public class VprodutosService {

    @Autowired
    private VprodutosRepository vprodutosRepository;

    public List<VProduto> buscarProdutos(String termo) {
        if (termo == null || termo.trim().isEmpty()) {
            throw new IllegalArgumentException("O campo de pesquisa não pode estar vazio.");
        }
        if (termo.matches("\\d+")) { // Verifica se é um número
            Optional<VProduto> produtoPorCodigo = vprodutosRepository.findById(Long.parseLong(termo));
            if (produtoPorCodigo.isPresent()) {
                return List.of(produtoPorCodigo.get()); // Retorna o produto exato encontrado
            }
        }
        return vprodutosRepository.buscarPorTodosOsCampos(termo);
    }
}