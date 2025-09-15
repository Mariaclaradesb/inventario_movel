import 'package:flutter/material.dart';
import 'package:inventarioapp/src/models/document_av_get.dart';
import 'package:inventarioapp/src/models/item_document_av.dart';
import 'package:inventarioapp/src/models/item_pre_venda.dart';
import 'package:inventarioapp/src/services/dav/item_document_av_service.dart';
import 'package:inventarioapp/src/ui/helper/dav_relatorio_pdf.dart';
import 'package:inventarioapp/src/ui/widgets/drawer_widgets.dart';

class DocumentAVProductsScreen extends StatefulWidget {
  const DocumentAVProductsScreen({super.key});

  @override
  State<DocumentAVProductsScreen> createState() =>
      _DocumentAVProductsScreenState();
}

class _DocumentAVProductsScreenState extends State<DocumentAVProductsScreen> {
  final itemService = ItemDocumentAvService();
  late DocumentAvGet document;
  late Future<List<ItemDocumentAv>> futureItems;

  void _reloadData() {
    setState(() {
      futureItems = itemService.findAll(document.codigoVenda!);
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    document = ModalRoute.of(context)!.settings.arguments as DocumentAvGet;
    futureItems = itemService.findAll(document.codigoVenda!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF00838F),
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text('Produtos do DAV',
            style: TextStyle(color: Colors.white)),
        actions: [
          TextButton.icon(
            onPressed: () async {
              try {
                final items = await futureItems;
                // Convert the list of ItemDocumentAv to a list of ItemPreVenda for the report
                final reportItems = items.map((item) => ItemPreVenda(
                  codProduto: item.codProduto ?? 0,
                  descricaoProduto: item.descricao ?? 'N/A',
                  quantidade: item.quantidade?.toDouble() ?? 0.0,
                  valorUnitario: item.pcoRemar ?? 0.0,
                  valorTotal: (item.quantidade ?? 0) * (item.pcoRemar ?? 0.0),
                )).toList();
                await gerarRelatorioDavPdf(context, document, reportItems);
              } catch (e) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Erro ao gerar relatório: $e')),
                );
              }
            },
            icon: const Icon(Icons.picture_as_pdf, color: Colors.white),
            label:
                const Text('Relatório', style: TextStyle(color: Colors.white)),
            style: TextButton.styleFrom(
              backgroundColor: Colors.teal,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
          const SizedBox(width: 10),
        ],
      ),
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
              child: FutureBuilder<List<ItemDocumentAv>>(
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
                      final total = (item.quantidade ?? 0) * (item.pcoRemar ?? 0.0);
                      return Card(
                        child: ListTile(
                          title: Text(item.descricao ?? 'Produto sem nome'),
                          subtitle: Text(
                              'Qtd: ${item.quantidade} | Vlr. Unit: R\$ ${item.pcoRemar?.toStringAsFixed(2) ?? "0.00"}'),
                          trailing: Text(
                              'Total: R\$ ${total.toStringAsFixed(2)}',
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold)),
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
            arguments: {'document': document, 'origem': 'documentAVProductsScreen'},
          );

          if (result == true) {
            _reloadData();
            print("Item adicionado! Recarregando lista...");
          }
        },
        backgroundColor: const Color(0xFF00838F),
        child: const Icon(Icons.add),
      ),
    );
  }
}