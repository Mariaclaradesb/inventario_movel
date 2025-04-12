import 'package:flutter/material.dart';
import 'package:inventarioapp/src/services/ip_service.dart';
import 'package:inventarioapp/src/services/shared_prefs_service.dart';
import 'package:inventarioapp/src/services/store_service.dart';
import 'package:inventarioapp/src/ui/widgets/app_bar.dart';
import 'package:inventarioapp/src/ui/widgets/drawer_widgets.dart';

class ConfiguracoesPage extends StatefulWidget {
  @override
  _ConfiguracoesPageState createState() => _ConfiguracoesPageState();
}

class _ConfiguracoesPageState extends State<ConfiguracoesPage> {
  int? lojaSelecionada;
  List<int> _lojas = [];
  bool _isLoading = true;
  TextEditingController _ipController = TextEditingController();
  final IpService _ipService = IpService();

  @override
  void initState() {
    super.initState();
    _carregarDados();
  }

  Future<void> _carregarDados() async {
    await _carregarLojaSelecionada();
    await _carregarLojas();
    String? ipSalvo = await SharedPrefsService.obterIpServidor();
    if (ipSalvo != null) {
      _ipController.text = ipSalvo;
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

  Future<void> _salvarIp() async {
    String ip = _ipController.text.trim();
    if (ip.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Por favor, insira o IP do servidor.'),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 2),
        ),
      );
      return;
    }

    // Validação de formato do IP
    if (!RegExp(r'^\d{1,3}(\.\d{1,3}){3}(:\d+)?$').hasMatch(ip)) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Formato de IP inválido. Ex: 192.168.0.100:8080'),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 2),
        ),
      );
      return;
    }

    await SharedPrefsService.salvarIpServidor(ip);
    await _ipService.enviarIpParaBack(ip);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('IP configurado com sucesso!'),
        backgroundColor: Colors.green,
        duration: Duration(seconds: 2),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      drawer: CustomDrawer(),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child:
            _isLoading
                ? Center(child: CircularProgressIndicator())
                : _lojas.isEmpty
                ? Center(child: Text('Nenhuma loja encontrada'))
                : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Endereço IP do Servidor:",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    TextFormField(
                      controller: _ipController,
                      decoration: InputDecoration(
                        hintText: 'Ex: 192.168.0.100:8080',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      keyboardType: TextInputType.text,
                    ),
                    SizedBox(height: 8),
                    ElevatedButton(
                      onPressed: _salvarIp,
                      child: Text("Salvar IP"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        foregroundColor: Colors.white,
                        padding: EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 12,
                        ),
                        textStyle: TextStyle(fontSize: 16),
                      ),
                    ),
                    SizedBox(height: 24),
                    Text(
                      "Selecione a loja:",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Container(
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
                      padding: EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 2,
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<int>(
                          value: lojaSelecionada,
                          hint: Text("Selecione uma loja"),
                          isExpanded: true,
                          items:
                              _lojas.map((int lojaId) {
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
                              await SharedPrefsService.salvarLojaSelecionada(
                                newValue,
                              );
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
}
