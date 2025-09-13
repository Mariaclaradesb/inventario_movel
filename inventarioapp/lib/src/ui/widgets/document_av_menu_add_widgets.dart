import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:inventarioapp/mocks/document_av_service_mock.dart';
import 'package:inventarioapp/mocks/funcionario_service_mock.dart';

import 'package:inventarioapp/src/models/funcionario.dart';
import 'package:inventarioapp/src/services/dav/document_av_service.dart';
import 'package:inventarioapp/src/services/funcionario_service.dart';

Future<bool> showMenuAddDocumentAV(BuildContext context, DocumentAVDataServiceMock documentService) async {
  //final funcionarioService = FuncionarioDataService();
  final funcionarioService = FuncionarioDataServiceMock();

  final formKey = GlobalKey<FormState>();
  final clienteController = TextEditingController();
  FuncionarioData? vendedorSelecionado;

  final result = await showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return AlertDialog(
        backgroundColor: const Color(0xFF00838F), // Usei a cor do dialog anterior, que combina mais
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        contentPadding: const EdgeInsets.all(24),
        title: const Text(
          'Novo Documento',
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
        content: Form(
          key: formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Vendedor:", style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),

              DropdownSearch<FuncionarioData>(
                asyncItems: (String filter) => funcionarioService.findAllFuncionarios(),

                itemAsString: (FuncionarioData f) => f.nome ?? 'Nome não disponível',

                popupProps: PopupProps.menu(
                  showSearchBox: true,
                  searchFieldProps: TextFieldProps(
                    decoration: InputDecoration(
                      hintText: "Pesquisar funcionário...",
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.9),
                    ),
                  ),
                  menuProps: MenuProps(
                    backgroundColor: Colors.white.withOpacity(0.9),
                  ),
                  loadingBuilder: (context, searchEntry) => const Center(child: CircularProgressIndicator()),
                  errorBuilder: (context, searchEntry, exception) => const Center(child: Text('Erro ao carregar dados!')),
                ),

                dropdownDecoratorProps: DropDownDecoratorProps(
                  dropdownSearchDecoration: InputDecoration(
                    hintText: "Selecione o funcionário",
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                onChanged: (FuncionarioData? funcionario) {
                  vendedorSelecionado = funcionario;
                },
                validator: (FuncionarioData? item) {
                  if (item == null) return "Campo obrigatório";
                  return null;
                },
              ),
              const SizedBox(height: 20),

              const Text("Cliente", style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),),
              const SizedBox(height: 8),
              TextFormField(
                controller: clienteController,
                decoration: InputDecoration(
                  hintText: "Digite o nome do cliente",
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty){
                    return "Campo obrigatório";
                  }
                  return null;
                },
              )
            ],
          ),
        ),
        actionsPadding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
        actionsAlignment: MainAxisAlignment.spaceBetween,
        actions: [
          ElevatedButton(
            onPressed: () => Navigator.of(context).pop(false),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFD32F2F),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
            ),
            child: const Text("Cancelar", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          ),
          ElevatedButton(
            onPressed: () async {
              if (formKey.currentState!.validate()) {

                //var service = DocumentAVDataService();
                int codVendedor =  vendedorSelecionado?.codigo ?? 0;
                String nomeCliente = clienteController.text;
                if (clienteController.text.isNotEmpty && vendedorSelecionado != null){
                  //await service.create(codVendedor, nomeCliente);
                  await documentService.create(vendedorSelecionado!, nomeCliente);
                  Navigator.of(context).pop(true);
                }
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF0D47A1),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
            ),
            child: const Text("Adicionar", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          ),
        ],
      );
    },
  );
  return result ?? false;
}