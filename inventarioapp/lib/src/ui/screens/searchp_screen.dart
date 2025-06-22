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
  String? origem;
  InventarioData? inventory;

  var pQuantityStore = TextEditingController();
  var pQuantityStock = TextEditingController();

  final ItemInventarioService service = ItemInventarioService();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final args = ModalRoute.of(context)?.settings.arguments as Map?;

    if (args != null) {
      inventory = args['inventario'] as InventarioData;
      origem = args['origem'] as String;
    }
  }

  final SharedPrefsService _prefsService = SharedPrefsService();
  final ConsultapService _consultapService = ConsultapService();
  final TextEditingController _searchController = TextEditingController();
  List<VProduto> _produtos = <VProduto>[];
  bool _isLoading = false;

  void _buscarProdutos() async {
    setState(() => _isLoading = true);
    try {
      // Obtém o IP do banco de dados
      final databaseIp = await SharedPrefsService.obterIpServidor();
      if (databaseIp == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('IP do banco de dados não configurado')),
        );
        return; // Retorna caso o IP não esteja configurado
      }

      // Obtém a loja selecionada
      final int? codLoja = await SharedPrefsService.obterLojaSelecionada();
      if (codLoja == null) {
        LojaNaoSelecionada.mostrarErro(context);
        return; // Retorna caso a loja não esteja selecionada
      }
      print("Código da loja selecionada: $codLoja");

      // Log do termo de busca
      final termoBusca = _searchController.text;
      print("Termo de busca: $termoBusca");

      // Faz a requisição para buscar os produtos
      List<VProduto> produtos = await _consultapService.buscarProdutos(
        termoBusca,
        codLoja,
      );

      // Log da quantidade de produtos retornados
      print("Quantidade de produtos retornados: ${produtos.length}");

      setState(() => _produtos = produtos);
    } catch (e) {
      print("Erro ao buscar produtos: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Ocorreu um erro ao buscar os produtos')),
      );
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

                final int? codLoja =
                    await SharedPrefsService.obterLojaSelecionada();
                if (codLoja == null) {
                  LojaNaoSelecionada.mostrarErro(dialogContext);
                  return;
                }

                try {
                  await _consultapService.adicionarItemACotacao(
                    produto.codigo.codigo,
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
            style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Quantidade: ${produto.estAtual}",
                style: TextStyle(fontSize: 20.0),
              ),
              Text(
                "Preço: R\$${produto.pcoRemarFormatado}",
                style: TextStyle(fontSize: 20.0),
              ),
              Text(
                "Unidade: ${produto.unidade}",
                style: TextStyle(fontSize: 20.0),
              ),
              Text(
                "Marca: ${produto.marca?.nome ?? 'Sem Marca'}",
                style: TextStyle(fontSize: 20.0),
              ),
              if (origem == 'inventoryProductsScreen')
                TextField(
                  controller: pQuantityStock,
                  decoration: InputDecoration(
                    hintText: 'Quantidade no estoque',
                    hintStyle: TextStyle(color: Color(0xFF006989)),
                  ),
                ),
              if (origem == 'inventoryProductsScreen')
                TextField(
                  controller: pQuantityStore,
                  decoration: InputDecoration(
                    hintText: 'Quantidade na loja',
                    hintStyle: TextStyle(color: Color(0xFF006989)),
                  ),
                ),
            ],
          ),
          actions: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: Row(
                mainAxisAlignment:
                    MainAxisAlignment
                        .spaceBetween, // Alinha os itens à esquerda
                children: [
                  if (origem != 'inventoryProductsScreen')
                    // Botão comprar
                    TextButton(
                      onPressed:
                          () => _adicionarProdutoACotacao(context, produto),
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: const Color.fromARGB(255, 7, 79, 139),
                        padding: EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 5,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text(
                        "Comprar",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                  if (origem != 'inventoryProductsScreen') // Botão Etiqueta
                    TextButton(
                      onPressed:
                          () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder:
                                  (context) => PriceTagScreen(
                                    product: produto,
                                    priceTagService: locator<PriceTagService>(),
                                  ),
                            ),
                          ),
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: const Color.fromARGB(255, 7, 79, 139),
                        padding: EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 5,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text(
                        "Etiquetas",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                  if (origem == 'inventoryProductsScreen')
                    TextButton(
                      onPressed: () {
                        var quantityStore =
                            double.tryParse(pQuantityStore.text) ?? 0.0;
                        var quantityStock =
                            double.tryParse(pQuantityStock.text) ?? 0.0;

                        var vProdutoId = VProdutoId(
                          produto.codigo.codigo, // código do produto
                          produto.codigo.codLoja, // código da loja do produto
                        );

                        var item = ItemInventario(
                          inventory?.codigo,
                          vProdutoId,
                          quantityStock,
                          quantityStore,
                        );
                        service.saveInventoryItem(item);
                        Navigator.of(context).pop(true);
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: Color(0xFF006989),
                        foregroundColor: Colors.white,
                        padding: EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                      ),
                      child: Text('Adicionar'),
                    ),

                  // Botão Fechar (ícone)
                  IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: Icon(Icons.close),
                    tooltip: 'Fechar',
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
                  mainAxisSize:
                      MainAxisSize.min, // Evita que ocupe muito espaço
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
                        subtitle: Text(
                          "Qtd: ${produto.estAtual} - Preço: R\$${produto.pcoRemarFormatado}",
                        ),
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
    final barcode = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => BarcodeScannerScreen()),
    );

    _searchController.text = barcode;
    _buscarProdutos();
  }
}
