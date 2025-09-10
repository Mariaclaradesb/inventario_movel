package inventario.inventarioapi.service;

import inventario.inventarioapi.model.Empresa;
import inventario.inventarioapi.model.Funcionario;
import inventario.inventarioapi.model.PreVenda;
import inventario.inventarioapi.model.Sequencia;
import inventario.inventarioapi.model.dto.PreVendaInsert;
import inventario.inventarioapi.repository.FuncionarioRepository;
import inventario.inventarioapi.repository.PreVendaRepository;
import inventario.inventarioapi.repository.SequenciaRepository;
import jakarta.transaction.Transactional;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PreVendaService {

    private final PreVendaRepository repository;
    private final EmpresaService empresaService;
    private final FuncionarioRepository funcionarioRepository;
    private final SequenciaRepository sequenciaRepository;

    public PreVendaService(PreVendaRepository repository, EmpresaService empresaService, FuncionarioRepository funcionarioRepository, SequenciaRepository sequenciaRepository) {
        this.repository = repository;
        this.empresaService = empresaService;
        this.funcionarioRepository = funcionarioRepository;
        this.sequenciaRepository = sequenciaRepository;
    }

    @Transactional
    public PreVenda save(PreVendaInsert preVenda) {
        var vendedor = funcionarioRepository.findById(preVenda.codVendedor()).get();
        var loja = empresaService.findById(preVenda.codLoja());
        if (loja == null || vendedor == null)
            return null;
        var obj = loadPreVenda(vendedor, loja, preVenda);

        Long novoNumeroSequencia = 1L; 
        Long ultimaSequencia = sequenciaRepository.findLastSequencia();
        if (ultimaSequencia != null) {
            novoNumeroSequencia = ultimaSequencia + 1;
        }
        sequenciaRepository.save(new Sequencia(novoNumeroSequencia, loja.getCodigo()));

        obj.setCodigoVenda(novoNumeroSequencia, loja.getCodigo());

        return repository.save(obj);
    }


    private PreVenda loadPreVenda(Funcionario vendedor, Empresa loja, PreVendaInsert preVenda) {
        var obj = new PreVenda();
        obj.setNomeUsuario(vendedor.getNome());
        obj.setLoja(loja);
        obj.setVendedor(vendedor);
        obj.setNomeCli(preVenda.nomeCliente());
        obj.setCpnj(loja.getCpnj());
        return obj;
    }

    public List<PreVenda> getAll(Long codLoja) {
        return repository.getAllOrdered(codLoja);
    }
}
