import 'package:flutter/material.dart';
import 'package:inventarioapp/src/services/ip_service.dart';
import 'package:inventarioapp/src/services/shared_prefs_service.dart';
import 'package:inventarioapp/src/services/store_service.dart';
import 'package:inventarioapp/src/ui/widgets/app_bar.dart';
import 'package:inventarioapp/src/ui/widgets/drawer_widgets.dart';
import 'package:inventarioapp/src/models/connection_data.dart';

class ConfiguracoesPage extends StatefulWidget {
  @override
  _ConfiguracoesPageState createState() => _ConfiguracoesPageState();
}

class _ConfiguracoesPageState extends State<ConfiguracoesPage> {
  int? lojaSelecionada;
  List<int> _lojas = [];
  bool _isLoading = true;

  // Controllers
  final TextEditingController _ipController = TextEditingController();
  final TextEditingController _portaController = TextEditingController();
  final TextEditingController _usuarioController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();

  final IpService _ipService = IpService();

  // Tela protegida por senha
  final String senhaCorreta = 'root';

@override
void initState() {
  super.initState();
  WidgetsBinding.instance.addPostFrameCallback((_) {
    _verificarSenha();
  });
}


Future<void> _verificarSenha() async {
  await showDialog(
    context: context,
    barrierDismissible: false,
    builder: (_) {
      final TextEditingController _senhaDialogController = TextEditingController();
      return AlertDialog(
        title: Text('Autenticação'),
        content: TextField(
          controller: _senhaDialogController,
          obscureText: true,
          decoration: InputDecoration(
            labelText: 'Senha de administrador',
          ),
        ),
        actions: [
          TextButton(
            child: Text('Cancelar'),
            onPressed: () {
              Navigator.of(context).pop();
              setState(() {
                _isLoading = false;
              });
            },
          ),
          TextButton(
            child: Text('Entrar'),
            onPressed: () {
              if (_senhaDialogController.text == senhaCorreta) {
                Navigator.of(context).pop();
                _carregarDados(); // aqui carrega os dados
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Senha incorreta!'),
                    backgroundColor: Colors.red,
                  ),
                );
              }
            },
          ),
        ],
      );
    },
  );
}


  Future<void> _carregarDados() async {
    await _carregarLojaSelecionada();
    await _carregarLojas();

    final ip = await SharedPrefsService.obterIpServidor();
    if (ip != null) {
      final partes = ip.split(":");
      _ipController.text = partes[0];
      if (partes.length > 1) _portaController.text = partes[1];
    }
  }

  Future<void> _carregarLojaSelecionada() async {
    int? lojaSalva = await SharedPrefsService.obterLojaSelecionada();
    if (lojaSalva != null) {
      setState(() {
        lojaSelecionada = lojaSalva;
      });
    }
  }

  Future<void> _carregarLojas() async {
    try {
      List<int> lojas = await getLojas();
      setState(() {
        _lojas = lojas;
        _isLoading = false;
      });
    } catch (e) {
      print("Erro ao carregar lojas: $e");
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> _salvarConfiguracoes() async {
    final ip = _ipController.text.trim();
    final porta = _portaController.text.trim();
    final user = _usuarioController.text.trim();
    final senha = _senhaController.text.trim();

    if (ip.isEmpty || porta.isEmpty || user.isEmpty || senha.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Preencha todos os campos'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    final portaInt = int.tryParse(porta);
    if (portaInt == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Porta inválida'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    await SharedPrefsService.salvarIpServidor("$ip:$porta");

    final connectionData = ConnectionData(
      url: ip,
      port: portaInt,
      user: user,
      password: senha,
    );

    try {
      await _ipService.enviarDadosConexao(connectionData);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Configuração salva com sucesso!'),
          backgroundColor: Colors.green,
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Erro ao conectar: ${e.toString()}'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      drawer: CustomDrawer(),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Configurações do Banco de Dados:",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  SizedBox(height: 10),
                  _buildTextField(_ipController, "IP do Servidor", "192.168.0.1"),
                  SizedBox(height: 10),
                  _buildTextField(_portaController, "Porta", "1433"),
                  SizedBox(height: 10),
                  _buildTextField(_usuarioController, "Usuário", "sa"),
                  SizedBox(height: 10),
                  _buildTextField(_senhaController, "Senha", "senha", isPassword: true),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _salvarConfiguracoes,
                    child: Text("Salvar"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                    ),
                  ),
                  SizedBox(height: 30),
                  Text("Selecione a loja:",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  SizedBox(height: 8),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 2),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 6,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<int>(
                        value: lojaSelecionada,
                        hint: Text("Selecione uma loja"),
                        isExpanded: true,
                        items: _lojas.map((int lojaId) {
                          return DropdownMenuItem<int>(
                            value: lojaId,
                            child: Text("Loja $lojaId"),
                          );
                        }).toList(),
                        onChanged: (int? newValue) async {
                          setState(() {
                            lojaSelecionada = newValue;
                          });
                          if (newValue != null) {
                            await SharedPrefsService.salvarLojaSelecionada(newValue);
                          }
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String label,
      String hint, {bool isPassword = false}) {
    return TextFormField(
      controller: controller,
      obscureText: isPassword,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
  }
}
