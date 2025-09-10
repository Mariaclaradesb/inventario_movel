import 'package:flutter/material.dart';
import 'package:inventarioapp/mocks/item_pre_venda_service_mock.dart';
import 'package:inventarioapp/src/models/document_av_get.dart';
import 'package:inventarioapp/src/models/item_pre_venda.dart';
import 'package:inventarioapp/src/ui/widgets/app_bar.dart';
import 'package:inventarioapp/src/ui/widgets/drawer_widgets.dart';

class DocumentAVProductsScreen extends StatefulWidget {
  const DocumentAVProductsScreen({super.key});

  @override
  State<DocumentAVProductsScreen> createState() => _DocumentAVProductsScreenState();
}

class _DocumentAVProductsScreenState extends State<DocumentAVProductsScreen> {
  final itemService = ItemPreVendaServiceMock();
  late DocumentAvGet document;
  late Future<List<ItemPreVenda>> futureItems;

  void _reloadData() {
    setState(() {
      futureItems = itemService.getByPreVenda(document.codigoVenda!);
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    document = ModalRoute.of(context)!.settings.arguments as DocumentAvGet;
    futureItems = itemService.getByPreVenda(document.codigoVenda!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      drawer: CustomDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Seus Produtos',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: FutureBuilder<List<ItemPreVenda>>(
                future: futureItems,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.hasError) {
                    return Center(child: Text('Erro: ${snapshot.error}'));
                  }
                  if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Center(
                      child: Text(
                        'O Documento Auxiliar de Vendas Está Vazio',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 18, color: Colors.grey),
                      ),
                    );
                  }

                  final items = snapshot.data!;
                  return ListView.builder(
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      final item = items[index];
                      return Card(
                        child: ListTile(
                          title: Text(item.descricaoProduto),
                          subtitle: Text('Qtd: ${item.quantidade} | Vlr. Unit: R\$ ${item.valorUnitario.toStringAsFixed(2)}'),
                          trailing: Text('Total: R\$ ${item.valorTotal.toStringAsFixed(2)}', style: const TextStyle(fontWeight: FontWeight.bold)),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await Navigator.pushNamed(
            context,
            '/consultaProdutos',
            arguments: { 'document': document, 'origem': 'documentAVProductsScreen' },
          );

          if (result == true) {
            _reloadData(); // 5. Chame a função de recarregar aqui
            print("Item adicionado! Recarregando lista...");
          }
        },
        backgroundColor: const Color(0xFF00838F),
        child: const Icon(Icons.add),
      ),
    );
  }
}