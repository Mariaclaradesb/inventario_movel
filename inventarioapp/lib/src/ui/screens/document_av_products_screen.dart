import 'package:flutter/material.dart';
import 'package:inventarioapp/src/models/document_av_get.dart';
import 'package:inventarioapp/src/models/empresa.dart';
import 'package:inventarioapp/src/models/item_document_av.dart';
import 'package:inventarioapp/src/models/item_pre_venda.dart';
import 'package:inventarioapp/src/services/dav/document_av_service.dart';
import 'package:inventarioapp/src/services/dav/item_document_av_service.dart';
import 'package:inventarioapp/src/services/shared_prefs_service.dart';
import 'package:inventarioapp/src/ui/helper/dav_relatorio_pdf.dart';
import 'package:inventarioapp/src/ui/widgets/drawer_widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DocumentAVProductsScreen extends StatefulWidget {
  const DocumentAVProductsScreen({super.key});

  @override
  State<DocumentAVProductsScreen> createState() =>
      _DocumentAVProductsScreenState();
}

class _DocumentAVProductsScreenState extends State<DocumentAVProductsScreen> {
  final itemService = ItemDocumentAvService();
  final documentService = DocumentAVDataService(); 
  late DocumentAvGet document;
  late Future<List<ItemDocumentAv>> futureItems;

  Future<void> _reloadData() async {
    try {
      final updatedDocument = await documentService.findById(document.codigoVenda);
      final updatedItems = itemService.findAll(document.codigoVenda);
      final idLoja = await SharedPrefsService.obterLojaSelecionada() as int;
      final nomeLoja = await SharedPrefsService.obterNomeLojaSelecionada();
      updatedDocument.loja = Empresa(idLoja, nomeLoja);
      if(mounted) {
        setState(() {
          document = updatedDocument; 
          futureItems = updatedItems; 
        });
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erro ao recarregar dados: $e')),
      );
    }
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
          IconButton(
            onPressed: () async {
              try {
                final items = await futureItems;
                final reportItems = items
                    .map((item) => ItemPreVenda(
                          codProduto: item.codProduto ?? 0,
                          descricaoProduto: item.descricao ?? 'N/A',
                          quantidade: item.quantidade?.toDouble() ?? 0.0,
                          valorUnitario: item.pcoRemar ?? 0.0,
                          valorTotal:
                              (item.quantidade ?? 0) * (item.pcoRemar ?? 0.0),
                        ))
                    .toList();
                await gerarRelatorioDavPdf(context, document, reportItems);
              } catch (e) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Erro ao gerar relatório: $e')),
                );
              }
            },
            icon: const Icon(Icons.picture_as_pdf, color: Colors.white),
            tooltip: 'Gerar Relatório',
          ),
          const SizedBox(width: 10),
        ],
      ),
      drawer: CustomDrawer(),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(8, 16, 8, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                'Itens do DAV: ${document.codigoVenda}',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.grey.shade700),
              ),
            ),
            
            // --- TOTAL DO DOCUMENTO MOVIDO PARA CÁ (DEPOIS DO TÍTULO) ---
            Container(
              margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'TOTAL DO DOCUMENTO:',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54,
                    ),
                  ),
                  Text(
                    'R\$ ${(document.totalVenda ?? 0.0).toStringAsFixed(2)}',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF013A63),
                    ),
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 8),
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
                        'Nenhum produto adicionado.',
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
                      final total = (item.quantidade ?? 0) *
                          (item.pcoRemar ?? 0.0);
                      return Card(
                        elevation: 2,
                        margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        child: ListTile(
                          contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                          title: Text(item.descricao ?? 'Produto sem nome', style: const TextStyle(fontWeight: FontWeight.bold)),
                          subtitle: Text(
                              'Qtd: ${item.quantidade} | Vlr. Unit: R\$ ${item.pcoRemar?.toStringAsFixed(2) ?? "0.00"}'),
                          trailing: Text('R\$ ${total.toStringAsFixed(2)}',
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15)),
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
            arguments: {
              'document': document,
              'origem': 'documentAVProductsScreen'
            },
          );

          if (result == true && mounted) {
            _reloadData();
          }
        },
        backgroundColor: const Color(0xFF00838F),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}