package inventario.inventarioapi.service;

import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import inventario.inventarioapi.model.ItemInventario;
import inventario.inventarioapi.model.dto.RelatorioDivergenciasDTO;
import inventario.inventarioapi.repository.ItemInventarioRepository;

@Service
public class RelatorioDivergenciasService {
    
    @Autowired
    private ItemInventarioRepository itemInventarioRepository;

    public List<RelatorioDivergenciasDTO> gerarRelatorio(Long codLoja, Long codInventario) {
        List<ItemInventario> itens = itemInventarioRepository.findByInventoryId(codLoja, codInventario);

        return itens.stream()
                .map(RelatorioDivergenciasDTO::new)
                .collect(Collectors.toList());
        
    }
}
