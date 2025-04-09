import 'package:flutter/material.dart';
import 'package:inventarioapp/src/models/vproduto.dart';
import 'package:inventarioapp/src/services/searchp_service.dart';
import 'package:inventarioapp/src/services/price_tag/price_tag_service.dart';
import 'package:inventarioapp/src/ui/screens/price_tag_screen.dart';

import '../../config/injection_container.dart';
import 'package:inventarioapp/src/services/shared_prefs_service.dart';
import 'package:inventarioapp/src/ui/widgets/app_bar.dart';
import 'package:inventarioapp/src/ui/widgets/loja_nao_selecionada.dart';

import 'barcode_scanner_screen.dart';


class ConsultapPage extends StatefulWidget {
  @override
  _ConsultapPageState createState() => _ConsultapPageState();
}

class _ConsultapPageState extends State<ConsultapPage> {
  final ConsultapService _consultapService = ConsultapService();
  final TextEditingController _searchController = TextEditingController();
  List<VProduto> _produtos = <VProduto>[];
  bool _isLoading = false;

  void _buscarProdutos() async {
    setState(() => _isLoading = true);
    try {
      final codLoja =  await SharedPrefsService.obterLojaSelecionada(); // Obtém a loja selecionada
      if (codLoja == null) {
        LojaNaoSelecionada.mostrarErro(context);
        return;
      }

      List<VProduto> produtos = await _consultapService.buscarProdutos(_searchController.text);
      setState(() => _produtos = produtos);
    } catch (e) {
      print("Erro: $e");
    } finally {
      setState(() => _isLoading = false);
    }
  }

void _adicionarProdutoACotacao(BuildContext context, VProduto produto) {
  final TextEditingController _quantidadeController = TextEditingController();

  showDialog(
    context: context,
    builder: (BuildContext dialogContext) {
      return AlertDialog(
        title: Text("Definir quantidade"),
        content: TextField(
          controller: _quantidadeController,
          keyboardType: TextInputType.numberWithOptions(decimal: true),
          decoration: InputDecoration(labelText: "Quantidade"),
  
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(),
            child: Text("Cancelar"),
          ),
          ElevatedButton(
            onPressed: () async {
              final quantidade = double.tryParse(_quantidadeController.text);
              print("Quantidade digitada: ${_quantidadeController.text}");
              print("Quantidade convertida: $quantidade");

              if (quantidade == null || quantidade <= 0) {
                ScaffoldMessenger.of(dialogContext).showSnackBar(
                  SnackBar(content: Text("Digite uma quantidade válida")),
                );
                return;
              }

              final codLoja = await SharedPrefsService.obterLojaSelecionada();
              if (codLoja == null) {
                LojaNaoSelecionada.mostrarErro(dialogContext);
                return;
              }

              try {
                await _consultapService.adicionarItemACotacao(
                  produto.codigo,
                  quantidade,
                );
                Navigator.of(dialogContext).pop(); // fecha o diálogo
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Produto adicionado à cotação!")),
                );
              } catch (e) {
                Navigator.of(dialogContext).pop();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Erro ao adicionar: $e")),
                );
              }
            },
            child: Text("Adicionar"),
          ),
        ],
      );
    },
  );
}


void _mostrarDetalhesProduto(BuildContext context, VProduto produto) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(
          produto.nome,
          style: TextStyle(
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Estoque: ${produto.estAtual}", style: TextStyle(fontSize: 20.0)),
            Text("Preço: R\$${produto.pcoRemar}", style: TextStyle(fontSize: 20.0)),
            Text("Unidade: ${produto.unidade}", style: TextStyle(fontSize: 20.0)),
            Text("Marca: ${produto.marca?.nome ?? 'Sem Marca'}", style: TextStyle(fontSize: 20.0)),
          ],
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Botão Comprar
              TextButton(
                onPressed: () => _adicionarProdutoACotacao(context, produto),
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: const Color.fromARGB(255, 7, 79, 139),
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  "Comprar",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),

              // Botão Etiqueta
              TextButton(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PriceTagScreen(
                      product: produto,
                      priceTagService: locator<PriceTagService>(),
                    ),
                  ),
                ),
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: const Color.fromARGB(255, 7, 79, 139),
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  "Etiquetas",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),

              // Botão Fechar (ícone)
              IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: Icon(Icons.close),
                tooltip: 'Fechar',
              ),
            ],
          ),
        ],
      );
    },
  );
}




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      drawer: CustomDrawer(),
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
                      onPressed: _readBarcode,
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
                          title: Text(produto.nome),
                          subtitle: Text("Qtd: ${produto.estAtual} - Preço: R\$${produto.pcoRemar}"),
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

  void _readBarcode() async {
    final barcode = await Navigator.push(context,
        MaterialPageRoute(builder: (context) => BarcodeScannerScreen())
    );

    _searchController.text = barcode;
    _buscarProdutos();
  }

}
