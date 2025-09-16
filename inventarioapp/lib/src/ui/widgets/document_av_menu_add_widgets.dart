import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:inventarioapp/src/models/funcionario.dart';
import 'package:inventarioapp/src/services/dav/document_av_service.dart';
import 'package:inventarioapp/src/services/funcionario_service.dart';

Future<bool> showMenuAddDocumentAV(
    BuildContext context, DocumentAVDataService documentService) async {
  final funcionarioService = FuncionarioDataService();
  final formKey = GlobalKey<FormState>();
  final clienteController = TextEditingController();
  FuncionarioData? vendedorSelecionado;

  final result = await showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return AlertDialog(
        backgroundColor: const Color(0xFF006989),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        title: const Row(
          children: [
            Icon(Icons.post_add, color: Colors.white),
            SizedBox(width: 10),
            Text(
              'Novo Documento',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ],
        ),
        content: Form(
          key: formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              DropdownSearch<FuncionarioData>(
                asyncItems: (String filter) => funcionarioService.findAll(),
                itemAsString: (FuncionarioData f) =>
                    f.nome ?? 'Nome não disponível',
                popupProps: PopupProps.menu(
                  showSearchBox: true,
                  searchFieldProps: const TextFieldProps(
                    decoration: InputDecoration(
                      hintText: "Pesquisar vendedor...",
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                  menuProps: MenuProps(
                    backgroundColor: Colors.white.withOpacity(0.95),
                  ),
                  loadingBuilder: (context, searchEntry) =>
                      const Center(child: CircularProgressIndicator()),
                  errorBuilder: (context, searchEntry, exception) =>
                      const Center(child: Text('Erro ao carregar vendedores!')),
                ),
                dropdownDecoratorProps: DropDownDecoratorProps(
                  dropdownSearchDecoration: InputDecoration(
                    labelText: "Vendedor",
                    labelStyle: const TextStyle(color: Colors.white70),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white54),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 2),
                    ),
                  ),
                ),
                onChanged: (FuncionarioData? funcionario) {
                  vendedorSelecionado = funcionario;
                },
                validator: (FuncionarioData? item) {
                  if (item == null) return "Selecione um vendedor";
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: clienteController,
                autofocus: true,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  labelText: "Nome do Cliente",
                  labelStyle: const TextStyle(color: Colors.white70),
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white54),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white, width: 2),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Campo obrigatório";
                  }
                  return null;
                },
              )
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('Cancelar', style: TextStyle(color: Colors.white)),
          ),
          ElevatedButton(
            onPressed: () async {
              if (formKey.currentState!.validate()) {
                try {
                  await documentService.create(
                      vendedorSelecionado!.codigo, clienteController.text);
                  Navigator.of(context).pop(true);
                } catch (e) {
                  Navigator.of(context).pop(false);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                        content: Text('Erro: $e'), backgroundColor: Colors.red),
                  );
                }
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF013A63),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child:
                const Text("Adicionar", style: TextStyle(color: Colors.white)),
          ),
        ],
      );
    },
  );
  return result ?? false;
}