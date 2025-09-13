import 'package:flutter/material.dart';
import 'package:inventarioapp/mocks/document_av_service_mock.dart';
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

class _DocumentListScreenState extends State<DocumentListScreen>{
  //final DocumentAVDataService service = DocumentAVDataService();
  final DocumentAVDataServiceMock service = DocumentAVDataServiceMock();
  late Future<List<DocumentAvGet>> futureDocuments;

  @override
  void initState() {
    super.initState();
    futureDocuments = service.findAll();
  }

  Future<void> _reloadData() async{
    setState(() {
      futureDocuments = service.findAll();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      drawer: CustomDrawer(),
      body: FutureBuilder<List<DocumentAvGet>>(future: futureDocuments, builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting){
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Center(child: Text('Erro ao carregar documentos: ${snapshot.error}'));
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
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
              child: ListTile(
                leading: const Icon(Icons.description),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(document.nomeUsuario ?? 'Sem usuário'),
                    Text(document.vendedor?.nome ?? 'Sem vendedor'),
                  ],
                ),
                subtitle: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(document.emissao?.toLocal().toString().split(' ').first ?? ''),
                    Text(document.hora ?? ''),
                  ],
                ),
                trailing: const Icon(Icons.arrow_forward_ios, size: 14),
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                    ),
                    builder: (context) {
                      return Container(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: Text(
                                "Documento ${document.codigoVenda} + ${document.sequencia?.sequencia ?? ''}",
                                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                            ),
                            const SizedBox(height: 8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(document.emissao?.toLocal().toString().split(' ').first ?? ''),
                                Text(document.hora ?? ''),
                              ],
                            ),
                            const SizedBox(height: 12),
                            Text("Vendedor: ${document.vendedor?.nome ?? 'Não informado'}"),
                            Text("Cliente: ${document.nomeCli ?? 'Não informado'}"),
                            const SizedBox(height: 16),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: const Text("Cancelar"),
                                ),
                                ElevatedButton.icon(
                                  onPressed: () {
                                    Navigator.pop(context);
                                    Navigator.pushNamed(context, '/documentsProductsScreen', arguments: document,);
                                  },
                                  icon: const Icon(Icons.grid_view_rounded, size: 18),
                                  label: const Text("Ver Produtos"),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.teal,
                                    foregroundColor: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
            );
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await showMenuAddDocumentAV(context, service); //quando o back funcionar, tira o service
          if (result == true){
            _reloadData();
          }
      },
        backgroundColor: const Color(0xFF00838F),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
        child: const Icon(Icons.add, color: Colors.white,
        ),
      ),
    );
  }
}