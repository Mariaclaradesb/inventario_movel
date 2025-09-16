import 'package:flutter/material.dart';
import 'package:inventarioapp/src/models/document_av_get.dart';
import 'package:inventarioapp/src/services/dav/document_av_service.dart';
import 'package:inventarioapp/src/ui/widgets/app_bar.dart';
import 'package:inventarioapp/src/ui/widgets/document_av_menu_add_widgets.dart';
import 'package:inventarioapp/src/ui/widgets/drawer_widgets.dart';

class DocumentListScreen extends StatefulWidget {
  const DocumentListScreen({super.key});

  @override
  State<DocumentListScreen> createState() => _DocumentListScreenState();
}

class _DocumentListScreenState extends State<DocumentListScreen> {
  final DocumentAVDataService service = DocumentAVDataService();
  late Future<List<DocumentAvGet>> futureDocuments;

  @override
  void initState() {
    super.initState();
    futureDocuments = service.findAll();
  }

  Future<void> _reloadData() async {
    setState(() {
      futureDocuments = service.findAll();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      drawer: CustomDrawer(),
      body: FutureBuilder<List<DocumentAvGet>>(
          future: futureDocuments,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return Center(
                  child: Text('Erro ao carregar documentos: ${snapshot.error}'));
            }
            if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(child: Text('Nenhum documento encontrado'));
            }

            final documents = snapshot.data;
            return ListView.builder(
              itemCount: documents!.length,
              itemBuilder: (context, index) {
                final document = documents[index];
                return Card(
                  elevation: 2,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 16),
                    leading: CircleAvatar(
                      backgroundColor: const Color(0xFF00838F),
                      child:
                          const Icon(Icons.description, color: Colors.white),
                    ),
                    title: Text(
                      document.nomeCli ?? 'Cliente não informado',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 4),
                        Text(
                            "Vendedor: ${document.vendedor?.nome ?? 'N/A'}"),
                        const SizedBox(height: 4),
                        // --- ALTERAÇÃO REALIZADA AQUI ---
                        Text(
                            "DAV: ${document.codigoVenda}/${document.sequencia?.sequencia ?? ''}"),
                        const SizedBox(height: 2),
                        Text(
                            "Emissão: ${document.emissao?.toLocal().toString().split(' ').first ?? ''} ${document.hora ?? ''}"),
                      ],
                    ),
                    trailing: const Icon(Icons.arrow_forward_ios,
                        size: 16, color: Colors.grey),
                    onTap: () {
                      Navigator.pushNamed(context, '/documentsProductsScreen',
                          arguments: document);
                    },
                  ),
                );
              },
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await showMenuAddDocumentAV(context, service);
          if (result == true) {
            _reloadData();
          }
        },
        backgroundColor: const Color(0xFF00838F),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}