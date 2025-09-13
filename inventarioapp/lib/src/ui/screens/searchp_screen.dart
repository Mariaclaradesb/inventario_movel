
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inventarioapp/mocks/consultap_service_mock.dart';
import 'package:inventarioapp/mocks/item_pre_venda_service_mock.dart';
import 'package:inventarioapp/src/config/injection_container.dart';
import 'package:inventarioapp/src/models/ItemPreVendaInsert.dart';
import 'package:inventarioapp/src/models/document_av_get.dart';
import 'package:inventarioapp/src/models/inventario_data.dart';
import 'package:inventarioapp/src/models/item_document_av_create.dart';
import 'package:inventarioapp/src/models/item_inventario.dart';
import 'package:inventarioapp/src/models/vproduto.dart';
import 'package:inventarioapp/src/services/dav/item_document_av_service.dart';
import 'package:inventarioapp/src/services/inventario/item_inventario_service.dart';
import 'package:inventarioapp/src/services/price_tag/price_tag_service.dart';
import 'package:inventarioapp/src/services/searchp_service.dart';
import 'package:inventarioapp/src/services/shared_prefs_service.dart';
import 'package:inventarioapp/src/ui/screens/barcode_scanner_screen.dart';
import 'package:inventarioapp/src/ui/screens/price_tag_screen.dart';
import 'package:inventarioapp/src/ui/widgets/app_bar.dart';
import 'package:inventarioapp/src/ui/widgets/drawer_widgets.dart';
import 'package:inventarioapp/src/ui/widgets/loja_nao_selecionada.dart';

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
  DocumentAvGet? document;

  // --- Services and Controllers ---
  final ItemInventarioService _itemInventarioService = ItemInventarioService();
  final ConsultapService _consultapService = ConsultapService();
  final TextEditingController _searchController = TextEditingController();
  final TextEditingController _pQuantityStockController = TextEditingController();
  final consultapServiceMock = ConsultapServiceMock();
  final itemPreVendaService = ItemPreVendaServiceMock();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Captura os argumentos passados de outra tela
    final args = ModalRoute.of(context)?.settings.arguments as Map?;
    if (args != null) {
      inventory = args['inventario'] as InventarioData?;
      document = args['document'] as DocumentAvGet?;
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
      final produtosEncontrados =
          await _consultapService.buscarProdutos(termoBusca, codLoja);
      setState(() => _produtos = produtosEncontrados);

      if (produtosEncontrados.isEmpty && mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Nenhum produto encontrado para o termo informado.')),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Erro ao buscar produtos: ${e.toString().replaceAll("Exception: ", "")}')),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  void _adicionarProdutoACotacao(BuildContext context, VProduto produto) {
    final TextEditingController quantidadeController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          backgroundColor: Color(0xFF006989),
          title: Row(
            children: [
              Icon(Icons.shopping_cart_checkout, color: Colors.white),
              SizedBox(width: 10),
              Text("Definir Quantidade", style: TextStyle(color: Colors.white)),
            ],
          ),
          content: TextField(
            controller: quantidadeController,
            keyboardType: TextInputType.numberWithOptions(decimal: true),
            style: TextStyle(color: Colors.white),
            autofocus: true,
            decoration: InputDecoration(
              labelText: "Quantidade",
              labelStyle: TextStyle(color: Colors.white70),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white54),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white, width: 2),
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(dialogContext).pop(),
              child: Text("Cancelar", style: TextStyle(color: Colors.white)),
            ),
            ElevatedButton(
              onPressed: () async {
                final quantidade = double.tryParse(quantidadeController.text);
                if (quantidade == null || quantidade <= 0) {
                  return;
                }
                Navigator.of(dialogContext).pop();
                try {
                  await _consultapService.adicionarItemACotacao(
                    produto.codigo.codigo,
                    quantidade,
                  );
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                        content: Text("Produto adicionado à cotação!"),
                        backgroundColor: Colors.green),
                  );
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                        content: Text("Erro ao adicionar: $e"),
                        backgroundColor: Colors.red),
                  );
                }
              },
              style: ElevatedButton.styleFrom(backgroundColor: Color(0xFF013A63)),
              child: Text("Adicionar", style: TextStyle(color: Colors.white)),
            ),
          ],
        );
      },
    );
  }


  void _showAddItemModal(BuildContext context, VProduto produto, DocumentAvGet documento) {
    final quantidadeController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          backgroundColor: const Color(0xFF00838F),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          contentPadding: const EdgeInsets.fromLTRB(24, 20, 24, 0),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildInfoRow("Nome Produto:", produto.nome),
              const SizedBox(height: 16),
              _buildInputRow("Quantidade:", "Digite a quantidade", quantidadeController),
              const SizedBox(height: 16),
              _buildInfoRow("Preço Unitário:", "R\$ ${produto.pcoRemarFormatado}"),
            ],
          ),
          actions: [
            Center(
              child: ElevatedButton(
                onPressed: () async {
                  final quantidade = double.tryParse(quantidadeController.text);
                  if (quantidade == null || quantidade <= 0) {
                    // ... (mostrar erro de quantidade inválida)
                    return;
                  }
                  try {
                    // Crie o objeto de inserção
                    final item = ItemPreVendaInsert(
                      codProduto: produto.codigo.codigo,
                      quantidade: quantidade,
                    );

                    // Chame o método 'insert' do nosso mock
                    await itemPreVendaService.insert(documento.codigoVenda!, item, produto);

                    // Fecha o dialog
                    Navigator.of(dialogContext).pop();
                    // Fecha a tela de busca e retorna 'true' para a tela anterior
                    if (mounted) Navigator.of(context).pop(true);

                  } catch (e) {
                    // ... (tratamento de erro)
                  }
                },
                // ... (estilo do botão)
                child: const Text("Adicionar Item"),
              ),
            ),
            const SizedBox(height: 10),
          ],
        );
      },
    );
  }



  Widget _buildInfoRow(String label, String value) {
    return Row(
      children: [
        Text(label, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
        const SizedBox(width: 10),
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(value, style: const TextStyle(color: Colors.black)),
          ),
        ),
      ],
    );
  }

  Widget _buildInputRow(String label, String hint, TextEditingController controller) {
    return Row(
      children: [
        Text(label, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
        const SizedBox(width: 10),
        Expanded(
          child: TextField(
            controller: controller,
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            autofocus: true,
            decoration: InputDecoration(
              hintText: hint,
              filled: true,
              fillColor: Colors.white,
              contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),
      ],
    );
  }

  void _mostrarDetalhesProduto(BuildContext context, VProduto produto) {

    _pQuantityStockController.clear();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          backgroundColor: Colors.white,
          titlePadding: EdgeInsets.zero,
          title: Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: const Color(0xFF006989),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
            ),
            child: Row(
              children: [
                Icon(Icons.info_outline, color: Colors.white),
                SizedBox(width: 10),
                Expanded(
                  child: Text(produto.nome,
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                      overflow: TextOverflow.ellipsis),
                ),
              ],
            ),
          ),
          content: SingleChildScrollView(
            child: Theme(
              data: ThemeData.light(), // Aplica tema claro para o conteúdo
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Código: ${produto.codigo?.codigo ?? 'N/A'}"),
                  Text("Preço: R\$${produto.pcoRemarFormatado}"),
                  Text("Unidade: ${produto.unidade ?? 'N/A'}"),
                  Text("Marca: ${produto.marca?.nome ?? 'Sem Marca'}"),
                  Text("Estoque Atual: ${produto.estAtual ?? 0}"),
                  if (origem == 'inventoryProductsScreen') ...[
                    SizedBox(height: 16),
                    TextField(
                      controller: _pQuantityStockController,
                      autofocus: true,
                      style: TextStyle(color: Colors.black), // Texto em preto
                      keyboardType:
                          TextInputType.numberWithOptions(decimal: true),
                      decoration: InputDecoration(
                        labelText: 'Quantidade contada',
                        labelStyle: TextStyle(color: Colors.grey[700]), // Label mais escuro
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey[400]!)),
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Color(0xFF006989), width: 2)),
                      ),
                    ),
                  ]
                ],
              ),
            ),
          ),
          actions: [
            // Row para alinhar os botões
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween, // Distribui o espaço
              children: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text("Fechar",
                      style: TextStyle(color: Color(0xFF006989))), // Azul da paleta
                ),
                if (origem == 'inventoryProductsScreen')
                  ElevatedButton(
                    onPressed: () async {
                      final quantityStock = double.tryParse(_pQuantityStockController.text);
                      if (quantityStock == null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Por favor, insira uma quantidade válida.'),
                            backgroundColor: Colors.orange,
                          ),
                        );
                        return;
                      }
                      final item = ItemInventario(inventory?.codigo, produto.codigo, quantityStock, (produto.estLoja ?? 0).toDouble(), produto.nome);

                      try {
                        await _itemInventarioService.saveInventoryItem(item);
                        Navigator.of(context).pop(); // Fecha o dialog
                        if (mounted) {
                          Navigator.of(context).pop(true); // Volta para a tela anterior
                        }
                      } catch (e) {
                        Navigator.of(context).pop(); // Fecha o dialog
                        if (mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("Erro ao salvar: ${e.toString().replaceAll("Exception: ", "")}"),
                              backgroundColor: Colors.red,
                            ),
                          );
                        }
                      }
                    },
                    style: ElevatedButton.styleFrom(backgroundColor: Color(0xFF013A63)),
                    child: Text('Adicionar', style: TextStyle(color: Colors.white)),
                  )
                else ...[
                  // Botões para "Comprar" e "Etiquetas"
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                        _adicionarProdutoACotacao(context, produto);
                      },
                      style: ElevatedButton.styleFrom(backgroundColor: Color(0xFF013A63)),
                      child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text("Comprar", style: TextStyle(color: Colors.white)),
                    ),
                  ),
                ),
                  SizedBox(width: 8),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PriceTagScreen(
                            product: produto,
                            priceTagService: locator<PriceTagService>(),
                          ),
                        ),
                      ),
                      style: ElevatedButton.styleFrom(backgroundColor: Color(0xFF013A63)),
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text("Etiquetas", style: TextStyle(color: Colors.white)),
                      ),
                    ),
                  ),
                ],
              ],
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
                labelText: "Busque por nome ou código de barras",
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
                        onTap: () {
                          if (origem == 'documentAVProductsScreen'){
                            _showAddItemModal(context, produto, document!);
                          } else {
                            _mostrarDetalhesProduto(context, produto);
                          }
                        },
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
