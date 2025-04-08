import 'package:flutter/material.dart';
import 'package:inventarioapp/src/models/inventario_data.dart';
import 'package:inventarioapp/src/models/novo_inventario_data.dart';
import 'package:inventarioapp/src/services/inventario/inventario_data_service.dart';

Future<bool> showMenuAddInventory(BuildContext context) async {
  var inventoryNameController = TextEditingController();
  var service = InventarioDataService();

  final result = await showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        backgroundColor: Color(0xFF006989),
        title: Text(
          'Novo Inventário',
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
        content: TextField(
          controller: inventoryNameController,
          decoration: InputDecoration(
            hintText: 'Digite o nome do inventário',
            hintStyle: TextStyle(color: Colors.white),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFF013A63), width: 2),
            ),
          ),
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFB00020),
                ),
                child: Text('Cancelar', style: TextStyle(color: Colors.white)),
              ),
              ElevatedButton(
                onPressed: () {
                  String nomeInventario = inventoryNameController.text.trim();
                  if (nomeInventario.isNotEmpty) {
                    //salvar o inventario no back e redirecionar
                    var inventario = NovoInventarioData(nomeInventario);
                    service.create(inventario);
                    Navigator.of(context).pop(true);
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF013A63),
                ),
                child: Text("Adicionar", style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ],
      );
    },
  );
  return result ?? false;
}
