import 'package:flutter/material.dart';
import 'package:inventarioapp/src/models/inventario_data.dart';
import 'package:inventarioapp/src/models/item_inventario.dart';
import 'package:inventarioapp/src/services/inventario/item_inventario_service.dart';
import 'package:inventarioapp/src/services/inventory_report.dart';
import 'package:inventarioapp/src/ui/helper/relatorio_pdf.dart';
import 'package:inventarioapp/src/ui/widgets/app_bar.dart';

class InventoryProductsScreen extends StatefulWidget {
  const InventoryProductsScreen({super.key});

  @override
  State<InventoryProductsScreen> createState() =>
      _InventoryProductsScreenState();
}

class _InventoryProductsScreenState extends State<InventoryProductsScreen> {
  late InventarioData inventario;
  final ItemInventarioService service = ItemInventarioService();
  late Future<List<ItemInventario>> futureItens;
  final ReelatorioService relatorioService = ReelatorioService();

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    inventario = ModalRoute.of(context)!.settings.arguments as InventarioData;
    futureItens = service.buscarItensDoInventario(inventario.codigo!);
  }

  Future<void> _refreshItens() async {
    setState(() {
      futureItens = service.buscarItensDoInventario(inventario.codigo!);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF006989),
        iconTheme: const IconThemeData(
          color: Colors.white,
        ), // botão de voltar branco
        title: const Text(
          'Itens do Inventário',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          TextButton.icon(
            onPressed: () async {
              try {
                final dados = await relatorioService.buscarDivergencias(
                  inventario.loja!.codigo,
                  inventario.codigo!,
                );
                await gerarRelatorioPDF(
                  context,
                  dados,
                  inventario.loja!.codigo,
                  inventario.codigo!,
                );
              } catch (e) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Erro ao gerar relatório: $e')),
                );
              }
            },
            icon: const Icon(
              Icons.picture_as_pdf,
              color: Colors.white,
              size: 24,
            ),
            label: const Text(
              'Relatório',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            style: TextButton.styleFrom(
              backgroundColor: Color(0xFF005577),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),
          const SizedBox(width: 10),
        ],
      ),

      body: FutureBuilder<List<ItemInventario>>(
        future: futureItens,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Erro ao carregar itens'));
          }

          final itens = snapshot.data ?? [];

          if (itens.isEmpty) {
            return Center(child: Text('Nenhum item adicionado.'));
          }

          return RefreshIndicator(
            onRefresh: _refreshItens,
            child: ListView.builder(
              itemCount: itens.length,
              itemBuilder: (context, index) {
                final item = itens[index];
                return Column(
                  children: [
                    ListTile(
                      title: Text(item.nomeProduto ?? 'Produto sem nome'),
                      subtitle: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Contada: ${item.estLoja?.toStringAsFixed(2) ?? "0.00"}',
                          ),
                          Text(
                            'Estoque: ${item.estLojaProd?.toStringAsFixed(2) ?? "0.00"}',
                          ),
                        ],
                      ),
                    ),
                    Divider(thickness: 1, height: 1),
                  ],
                );
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await Navigator.pushNamed(
            context,
            '/consultaProdutos',
            arguments: {
              'inventario': inventario,
              'origem': 'inventoryProductsScreen',
            },
          );
          if (result == true) {
            _refreshItens(); // Atualiza lista ao voltar
          }
        },
        backgroundColor: Color(0xFF006989),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
        child: Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
