package inventario.inventarioapi.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import inventario.inventarioapi.model.VProduto;
import inventario.inventarioapi.repository.VprodutosRepository;

@Service
public class VprodutosService {
    
    @Autowired
    private VprodutosRepository vprodutosRepository;

    public List<VProduto> getProdutoById() {
        return vprodutosRepository.findAll();
    }
}
