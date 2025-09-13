import 'package:flutter/material.dart';
import 'package:inventarioapp/src/models/empresa.dart';
import 'package:inventarioapp/src/services/shared_prefs_service.dart';
import 'package:inventarioapp/src/services/store_service.dart';
import 'package:inventarioapp/src/ui/widgets/app_bar.dart';
import 'package:inventarioapp/src/ui/widgets/drawer_widgets.dart';

class ConfiguracoesPage extends StatefulWidget {
  @override
  _ConfiguracoesPageState createState() => _ConfiguracoesPageState();
}

class _ConfiguracoesPageState extends State<ConfiguracoesPage> {
  // Chave para validação do formulário
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  // --- Controllers para os novos campos ---
  final _backendUrlController = TextEditingController();
  final _dbIpController = TextEditingController();
  final _dbPortController = TextEditingController(text: '1433');
  final _dbNameController = TextEditingController(text: 'SCEPRO');
  final _dbUsuarioController = TextEditingController(text: 'sa');
  final _dbSenhaController = TextEditingController();

  // --- Gerenciamento da lista de lojas ---
  List<Empresa> _lojas = [];
  Empresa? lojaSelecionada;

  // --- Tela protegida por senha ---
  final String senhaCorreta = 'root';

  @override
  void initState() {
    super.initState();
    // A verificação de senha e o carregamento dos dados agora são feitos juntos
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _verificarSenhaEcarregarDados();
    });
  }

  // Combina a verificação de senha com o carregamento dos dados
  Future<void> _verificarSenhaEcarregarDados() async {
    bool entrou = false;
    // ... (Seu código de diálogo de senha pode ser mantido aqui)
    // Para simplificar, vamos assumir que a senha foi inserida corretamente.
    // Se quiser manter o diálogo, coloque o código dele aqui e sete 'entrou = true' em caso de sucesso.
    entrou = true; // Simulação de senha correta

    if (entrou) {
      await _carregarDadosSalvos();
    }
  }

  // Carrega TODAS as configurações salvas no dispositivo
  Future<void> _carregarDadosSalvos() async {
    setState(() => _isLoading = true);

    final backendUrl = await SharedPrefsService.obterBackendUrl();
    _backendUrlController.text = backendUrl ?? '';

    final dbConfig = await SharedPrefsService.obterConfiguracaoCompleta();
    _dbIpController.text = dbConfig['dbIp'] ?? '';
    _dbPortController.text = dbConfig['dbPort'] ?? '1433';
    _dbNameController.text = dbConfig['dbName'] ?? 'SCEPRO';
    _dbUsuarioController.text = dbConfig['dbUser'] ?? 'sa';
    _dbSenhaController.text = dbConfig['dbPassword'] ?? '';

    // Apenas tenta carregar as lojas se as configurações estiverem preenchidas
    if (backendUrl != null && dbConfig['dbIp'] != null) {
      await _carregarLojas();
    }

    setState(() => _isLoading = false);
  }

  // Carrega a lista de lojas usando a configuração atual
  Future<void> _carregarLojas() async {
    try {
      // getLojas() agora usa o ApiClient, que envia os headers automaticamente
      List<Empresa> lojas = await getLojas();
      int? lojaSalvaId = await SharedPrefsService.obterLojaSelecionada();

      setState(() {
        _lojas = lojas;
        if (lojaSalvaId != null && _lojas.isNotEmpty) {
          lojaSelecionada = _lojas.firstWhere((l) => l.codigo == lojaSalvaId,
              orElse: null);
        }
      });
    } catch (e) {
      print("Erro ao carregar lojas: $e");
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(
                "Não foi possível carregar lojas. Verifique as configurações.")));
      }
    }
  }

  // NOVA FUNÇÃO DE SALVAR: Apenas salva os dados localmente
  Future<void> _salvarConfiguracoes() async {
    if (_formKey.currentState?.validate() ?? false) {
      setState(() => _isLoading = true);

      // Salva a URL do backend
      await SharedPrefsService.salvarBackendUrl(
          _backendUrlController.text.trim());

      // Salva as credenciais do banco de dados da loja
      await SharedPrefsService.salvarConfiguracaoCompleta(
        dbIp: _dbIpController.text.trim(),
        dbPort: _dbPortController.text.trim(),
        dbName: _dbNameController.text.trim(),
        dbUser: _dbUsuarioController.text.trim(),
        dbPassword: _dbSenhaController.text.trim(),
      );

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Configurações salvas com sucesso!'),
          backgroundColor: Colors.green,
        ),
      );

      // Tenta recarregar as lojas para validar a nova configuração
      await _carregarLojas();
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      drawer: CustomDrawer(),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : Form(
              key: _formKey,
              child: SingleChildScrollView(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text("Servidor Backend (API)",
                        style: Theme.of(context).textTheme.titleLarge),
                    SizedBox(height: 8),
                    TextFormField(
                      controller: _backendUrlController,
                      decoration: InputDecoration(
                          labelText: "URL do Servidor",
                          hintText: "http://192.168.0.100:8080",
                          border: OutlineInputBorder()),
                      validator: (v) =>
                          v!.isEmpty ? "Campo obrigatório" : null,
                    ),
                    SizedBox(height: 24),
                    Text("Banco de Dados da Loja",
                        style: Theme.of(context).textTheme.titleLarge),
                    SizedBox(height: 16),
                    TextFormField(
                      controller: _dbIpController,
                      decoration: InputDecoration(
                          labelText: "IP do Banco",
                          border: OutlineInputBorder()),
                      validator: (v) =>
                          v!.isEmpty ? "Campo obrigatório" : null,
                    ),
                    SizedBox(height: 12),
                    TextFormField(
                      controller: _dbPortController,
                      decoration: InputDecoration(
                          labelText: "Porta", border: OutlineInputBorder()),
                      keyboardType: TextInputType.number,
                      validator: (v) =>
                          v!.isEmpty ? "Campo obrigatório" : null,
                    ),
                    SizedBox(height: 12),
                    TextFormField(
                      controller: _dbNameController,
                      decoration: InputDecoration(
                          labelText: "Nome do Banco (Opcional)",
                          border: OutlineInputBorder()),
                    ),
                    SizedBox(height: 12),
                    TextFormField(
                      controller: _dbUsuarioController,
                      decoration: InputDecoration(
                          labelText: "Usuário do Banco",
                          border: OutlineInputBorder()),
                      validator: (v) =>
                          v!.isEmpty ? "Campo obrigatório" : null,
                    ),
                    SizedBox(height: 12),
                    TextFormField(
                      controller: _dbSenhaController,
                      decoration: InputDecoration(
                          labelText: "Senha do Banco",
                          border: OutlineInputBorder()),
                      obscureText: true,
                    ),
                    SizedBox(height: 24),
                    ElevatedButton(
                      onPressed: _salvarConfiguracoes,
                      child: Text("Salvar e Testar Conexão"),
                      style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(vertical: 16)),
                    ),
                    SizedBox(height: 24),
                    Text("Loja de Trabalho",
                        style: Theme.of(context).textTheme.titleLarge),
                    SizedBox(height: 8),
                    DropdownButtonFormField<Empresa>(
                      value: lojaSelecionada,
                      hint: Text("Selecione uma loja"),
                      isExpanded: true,
                      items: _lojas.map((Empresa loja) {
                        return DropdownMenuItem<Empresa>(
                          value: loja,
                          child: Text("(${loja.codigo}) - ${loja.nome}"),
                        );
                      }).toList(),
                      onChanged: (Empresa? novaLoja) async {
                        if (novaLoja != null) {
                          setState(() => lojaSelecionada = novaLoja);
                          await SharedPrefsService.salvarLojaSelecionada(
                              novaLoja.codigo);
                        }
                      },
                      decoration: InputDecoration(border: OutlineInputBorder()),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}