import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:inventarioapp/src/models/document_av_get.dart';
import 'package:inventarioapp/src/models/document_av_insert.dart';
import 'package:inventarioapp/src/models/funcionario.dart';
import 'package:inventarioapp/src/services/dav/document_av_service.dart';
import 'package:inventarioapp/src/services/funcionario_service.dart';

Future<bool> showMenuAddDocumentAV(BuildContext context) async {
  // O serviço será usado dentro do DropdownSearch
  final funcionarioService = FuncionarioDataService();

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

              // --- CORREÇÕES AQUI ---
              DropdownSearch<FuncionarioData>( // 1. TIPO CORRIGIDO: O tipo é FuncionarioData
                // 2. USO DO ASYNCITEMS: Para buscar dados da API
                asyncItems: (String filter) => funcionarioService.findAll(),

                // Define como o nome do funcionário será exibido no dropdown
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
                  // Mostra um indicador de "carregando" enquanto busca os dados
                  loadingBuilder: (context, searchEntry) => const Center(child: CircularProgressIndicator()),
                  // Mostra uma mensagem se ocorrer um erro
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
          // --- BOTÕES DE AÇÃO ---
          ElevatedButton(
            onPressed: () => Navigator.of(context).pop(false),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFD32F2F), // Vermelho
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
            ),
            child: const Text("Cancelar", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          ),
          ElevatedButton(
            onPressed: () async {
              // Valida os campos antes de continuar
              if (formKey.currentState!.validate()) {

                var service = DocumentAVDataService();
                int codVendedor =  vendedorSelecionado?.codigo ?? 0;
                String nomeCliente = clienteController.text;
                if (clienteController.text.isNotEmpty){
                  await service.create(codVendedor, nomeCliente);
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