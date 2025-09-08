import 'package:flutter/material.dart';
import 'package:inventarioapp/src/models/inventario_data.dart';
import 'package:inventarioapp/src/models/item_inventario.dart';
import 'package:inventarioapp/src/models/vproduto.dart';
import 'package:inventarioapp/src/models/vproduto_id.dart';
import 'package:inventarioapp/src/services/searchp_service.dart';
import 'package:inventarioapp/src/services/inventario/item_inventario_service.dart';
import 'package:inventarioapp/src/services/price_tag/price_tag_service.dart';
import 'package:inventarioapp/src/services/shared_prefs_service.dart';
import 'package:inventarioapp/src/ui/screens/price_tag_screen.dart';
import 'package:inventarioapp/src/ui/widgets/app_bar.dart';
import 'package:inventarioapp/src/ui/widgets/drawer_widgets.dart';
import 'package:inventarioapp/src/ui/widgets/loja_nao_selecionada.dart';

import '../../config/injection_container.dart';
import 'barcode_scanner_screen.dart';

class ConsultapPage extends StatefulWidget {
  @override
  _ConsultapPageState createState() => _ConsultapPageState();
}

class _ConsultapPageState extends State<ConsultapPage> {
  // --- State Variables ---
  String? origem;
  InventarioData? inventory;
  bool _isLoading = false;
  List<VProduto> _produtos = [];

  // --- Services and Controllers ---
  final ItemInventarioService _itemInventarioService = ItemInventarioService();
  final ConsultapService _consultapService = ConsultapService();
  final TextEditingController _searchController = TextEditingController();
  final TextEditingController _pQuantityStockController = TextEditingController();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Captura os argumentos passados de outra tela
    final args = ModalRoute.of(context)?.settings.arguments as Map?;
    if (args != null) {
      inventory = args['inventario'] as InventarioData?;
      origem = args['origem'] as String?;
    }
  }

  Future<void> _buscarProdutos() async {
    // Validação inicial
    final int? codLoja = await SharedPrefsService.obterLojaSelecionada();
    if (codLoja == null) {
      LojaNaoSelecionada.mostrarErro(context);
      return;
    }
    if (_searchController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Por favor, digite um termo para a busca.')),
      );
      return;
    }

    setState(() => _isLoading = true);
    try {
      final termoBusca = _searchController.text;
      final produtosEncontrados = await _consultapService.buscarProdutos(termoBusca, codLoja);
      setState(() => _produtos = produtosEncontrados);
    } catch (e) {
      print("Erro ao buscar produtos: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Ocorreu um erro ao buscar os produtos: $e')),
      );
    } finally {
      setState(() => _isLoading = false);
    }
  }

  void _adicionarProdutoACotacao(BuildContext context, VProduto produto) {
    final TextEditingController quantidadeController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: Text("Definir quantidade"),
          content: TextField(
            controller: quantidadeController,
            keyboardType: TextInputType.numberWithOptions(decimal: true),
            decoration: InputDecoration(labelText: "Quantidade"),
            autofocus: true,
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(dialogContext).pop(),
              child: Text("Cancelar"),
            ),
            ElevatedButton(
              onPressed: () async {
                final quantidade = double.tryParse(quantidadeController.text);
                if (quantidade == null || quantidade <= 0) {
                  // Opcional: mostrar erro dentro do dialog
                  return;
                }
                Navigator.of(dialogContext).pop(); // Fecha o dialog primeiro
                try {
                  await _consultapService.adicionarItemACotacao(
                    produto.codigo.codigo,
                    quantidade,
                  );
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Produto adicionado à cotação!"), backgroundColor: Colors.green),
                  );
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Erro ao adicionar: $e"), backgroundColor: Colors.red),
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
    // Limpa o controller de quantidade antes de abrir o dialog
    _pQuantityStockController.clear();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(produto.nome, style: TextStyle(fontWeight: FontWeight.bold)),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Preço: R\$${produto.pcoRemarFormatado}"),
                Text("Unidade: ${produto.unidade ?? 'N/A'}"),
                Text("Marca: ${produto.marca?.nome ?? 'Sem Marca'}"),
                Text("Estoque Atual: ${produto.estAtual ?? 0}"),
                if (origem == 'inventoryProductsScreen') ...[
                  SizedBox(height: 16),
                  TextField(
                    controller: _pQuantityStockController,
                    autofocus: true,
                    keyboardType: TextInputType.numberWithOptions(decimal: true),
                    decoration: InputDecoration(
                      labelText: 'Quantidade contada',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ]
              ],
            ),
          ),
          actions: [
            if (origem == 'inventoryProductsScreen')
              ElevatedButton(
                onPressed: () async {
                  final quantityStock = double.tryParse(_pQuantityStockController.text);
                  if (quantityStock == null) {
                    // Opcional: mostrar erro
                    return;
                  }

                  final item = ItemInventario(
                    inventory?.codigo,
                    produto.codigo,
                    quantityStock,
                    (produto.estLoja ?? 0).toDouble(), // Estoque real do produto
                    produto.nome,
                  );

                  Navigator.of(context).pop(); // Fecha o dialog
                  try {
                    await _itemInventarioService.saveInventoryItem(item);
                    // Retorna 'true' para a tela anterior para indicar que deve recarregar a lista
                    Navigator.of(context).pop(true);
                  } catch (e) {
                     ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Erro ao salvar item: $e"), backgroundColor: Colors.red),
                    );
                  }
                },
                child: Text('Adicionar ao Inventário'),
              )
            else ...[ // Se não for da tela de inventário, mostra os outros botões
              TextButton(
                onPressed: () => _adicionarProdutoACotacao(context, produto),
                child: Text("Comprar"),
              ),
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
                child: Text("Etiquetas"),
              ),
            ],
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text("Fechar", style: TextStyle(color: Colors.red)),
            ),
          ],
        );
      },
    );
  }
  
  void _readBarcode() async {
    // Navega para a tela de scanner e aguarda o resultado
    final barcode = await Navigator.push<String>(
      context,
      MaterialPageRoute(builder: (context) => BarcodeScannerScreen()),
    );

    // Se um código foi retornado, atualiza o campo de busca e pesquisa
    if (barcode != null && barcode.isNotEmpty) {
      _searchController.text = barcode;
      _buscarProdutos();
    }
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
                labelText: "Busque por nome, código ou EAN",
                border: OutlineInputBorder(),
                suffixIcon: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Icon(Icons.search),
                      onPressed: _buscarProdutos,
                      tooltip: 'Buscar',
                    ),
                    IconButton(
                      icon: Icon(Icons.qr_code_scanner_outlined),
                      onPressed: _readBarcode,
                      tooltip: 'Escanear Código',
                    ),
                  ],
                ),
              ),
              onSubmitted: (_) => _buscarProdutos(),
            ),
            SizedBox(height: 16),
            if (_isLoading)
              Expanded(child: Center(child: CircularProgressIndicator()))
            else if (_produtos.isEmpty)
              Expanded(child: Center(child: Text("Nenhum produto encontrado.")))
            else
              Expanded(
                child: ListView.builder(
                  itemCount: _produtos.length,
                  itemBuilder: (context, index) {
                    final produto = _produtos[index];
                    return Card(
                      child: ListTile(
                        title: Text(produto.nome, style: TextStyle(fontWeight: FontWeight.bold)),
                        subtitle: Text(
                          "Estoque: ${produto.estAtual ?? 0} | Preço: R\$${produto.pcoRemarFormatado}",
                        ),
                        onTap: () => _mostrarDetalhesProduto(context, produto),
                      ),
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