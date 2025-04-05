import 'package:flutter/material.dart';
import 'package:inventarioapp/src/models/vproduto.dart';
import 'package:inventarioapp/src/services/consultap_service.dart';
import 'package:inventarioapp/src/services/price_tag/price_tag_service.dart';
import 'package:inventarioapp/src/ui/pages/price_tag_screen.dart';

import '../../config/injection_container.dart';

class ConsultapPage extends StatefulWidget {
  @override
  _ConsultapPageState createState() => _ConsultapPageState();
}

class _ConsultapPageState extends State<ConsultapPage> {
  final ConsultapService _consultapService = ConsultapService();
  final TextEditingController _searchController = TextEditingController();
  List<dynamic> _produtos = [];
  bool _isLoading = false;

  void _buscarProdutos() async {
    setState(() => _isLoading = true);
    try {
      List<dynamic> produtos = await _consultapService.buscarProdutos(_searchController.text);
      setState(() => _produtos = produtos);
    } catch (e) {
      print("Erro: $e");
    } finally {
      setState(() => _isLoading = false);
    }
  }

void _mostrarDetalhesProduto(BuildContext context, Map<String, dynamic> produto) {
  VProduto product = VProduto.fromJson(produto);
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(
          produto['nome'],
          style: TextStyle(
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Quantidade: ${produto['qt']}",
              style: TextStyle(fontSize: 20.0),
            ),
            Text(
              "Preço: R\$${produto['pcoRemar']}",
              style: TextStyle(fontSize: 20.0),
            ),
          ],
        ),
        actions: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start, // Alinha os itens à esquerda
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 5), // Ajusta a distância entre o ícone e os botões
                  child: IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: Icon(Icons.shopping_cart),
                  ),
                ),
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  style: TextButton.styleFrom(
                    foregroundColor: const Color.fromARGB(255, 7, 79, 139), // Cor do texto // Cor de fundo do botão
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12), 
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10), // Borda arredondada
                    ),
                  ),
                  child: Text(
                    "Fechar",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                TextButton(
                  onPressed: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) =>
                          PriceTagScreen(product: product, priceTagService: locator<PriceTagService>(),)
                      ),
                  ),
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.white, // Cor do texto
                    backgroundColor: const Color.fromARGB(255, 7, 79, 139), // Cor de fundo do botão
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12), // Espaçamento interno
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10), // Borda arredondada
                    ),
                  ),
                  child: Text(
                    "Imprimir etiqueta", // IMPRIMIR ETIQUETA
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    },
  );
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Consulta de Produtos")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: "Digite o termo de busca",
                suffixIcon: Row(
                  mainAxisSize: MainAxisSize.min, // Evita que ocupe muito espaço
                  children: [
                    IconButton(
                      icon: Icon(Icons.search),
                      onPressed: _buscarProdutos,
                    ),
                    IconButton(
                      icon: Icon(Icons.barcode_reader),
                      onPressed: _buscarProdutos, // MUDAR PARA LEITURA DE CODIGO DE BARRAS
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16),
            _isLoading
                ? CircularProgressIndicator()
                : Expanded(
                    child: ListView.builder(
                      itemCount: _produtos.length,
                      itemBuilder: (context, index) {
                        final produto = _produtos[index];
                        return ListTile(
                          title: Text(produto['nome']),
                          subtitle: Text("Qtd: ${produto['qt']} - Preço: R\$${produto['pcoRemar']}"),
                          onTap: () => _mostrarDetalhesProduto(context, produto),
                        );
                      },
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
