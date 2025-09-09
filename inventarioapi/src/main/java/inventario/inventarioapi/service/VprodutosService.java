package inventario.inventarioapi.service;

import java.util.ArrayList;
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
            Long codigo = Long.parseLong(termo);
            VProdutoId id = new VProdutoId(codigo, codLoja);

            // Busca por código exato
            Optional<VProduto> produtoPorCodigo = repository.findById(id);
            if (produtoPorCodigo.isPresent()) {
                // Busca os demais produtos normalmente
                List<VProduto> produtos = repository.buscarPorTodosOsCampos(termo, codLoja);

                // Remove o produto com código exato da lista para evitar duplicidade
                produtos.removeIf(p -> p.getCodigo().getCodigo().equals(codigo));

                // Cria uma nova lista, colocando o produto exato primeiro
                List<VProduto> resultado = new ArrayList<>();
                resultado.add(produtoPorCodigo.get());
                resultado.addAll(produtos);
                return resultado;
            }
        }

        // Se não for número ou não encontrou código exato, retorna lista normal
        return repository.buscarPorTodosOsCampos(termo, codLoja);
    }

    public Optional<VProduto> findById(Long codProduto, Long codLoja) {
        var id = new VProdutoId();
        id.setCodigo(codProduto);
        id.setCodLoja(codLoja);
        return repository.findById(id);
    }
}
