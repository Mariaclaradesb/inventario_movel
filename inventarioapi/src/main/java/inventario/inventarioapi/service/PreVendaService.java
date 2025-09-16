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
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

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
        obj.setSequencia(novoNumeroSequencia);

        return repository.save(obj);
    }


    private PreVenda loadPreVenda(Funcionario vendedor, Empresa loja, PreVendaInsert preVenda) {
        var obj = new PreVenda();
        obj.setCodLoja(loja.getCodigo());

        String nomeCompleto = vendedor.getNome();
        if (nomeCompleto != null && !nomeCompleto.trim().isEmpty()) {
            String primeiroNome = nomeCompleto.trim().split("\\s+")[0];
            obj.setNomeUsuario(primeiroNome); // Usa o primeiro nome para evitar erro de tamanho no BD
        } else {
            obj.setNomeUsuario(""); // Garante que o campo não seja nulo
        }
        
        obj.setVendedor(vendedor);
        obj.setNomeCli(preVenda.nomeCliente());
        obj.setCpnj(loja.getCpnj());
        return obj;
    }

    public List<PreVenda> getAll(Long codLoja) {
        var dataInicial = LocalDateTime.of(2025, 9, 9, 0,0);
        return repository.getAllOrdered(codLoja, dataInicial);
    }

    public Optional<PreVenda> findById(Long id) {
        return repository.findById(id);
    }
}