import 'package:flutter/material.dart';
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
  bool _isLoading = true; // Indicador de carregamento

  @override
  void initState() {
    super.initState();
    _carregarDados();
  }

  Future<void> _carregarDados() async {
    await _carregarLojaSelecionada();
    await _carregarLojas();
  }

  Future<void> _carregarLojaSelecionada() async {
    int? lojaSalva = await SharedPrefsService.obterLojaSelecionada();
    print("Loja selecionada recuperada: $lojaSalva");
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
        _isLoading = false; // Finaliza o carregamento
      });
    } catch (e) {
      print("Erro ao carregar lojas: $e");
      setState(() {
        _isLoading = false; // Mesmo em erro, finaliza o carregamento
      });
    }
  }

@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: MyAppBar(),
    drawer: CustomDrawer(),
    body: Padding(
      padding: EdgeInsets.all(16.0),
      child: _isLoading
          ? Center(child: CircularProgressIndicator()) 
          : _lojas.isEmpty
              ? Center(child: Text('Nenhuma loja encontrada'))
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                        color: Colors.white, // Cor de fundo
                        borderRadius: BorderRadius.circular(8), // Borda arredondada
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26, // Cor da sombra
                            blurRadius: 6, // Intensidade do desfoque
                            offset: Offset(0, 3), // Direção da sombra
                          ),
                        ],
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 2),
                      child: DropdownButtonHideUnderline( // Esconde a linha padrão do Dropdown
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
                            print("Nova loja selecionada: $newValue");
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

}