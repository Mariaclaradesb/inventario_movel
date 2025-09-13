import 'package:flutter/material.dart';
import 'package:inventarioapp/src/models/novo_inventario_data.dart';
import 'package:inventarioapp/src/services/inventario/inventario_data_service.dart';

Future<bool> showMenuAddInventory(BuildContext context) async {
  var inventoryNameController = TextEditingController();
  var service = InventarioDataService();

  final result = await showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        backgroundColor: Color(0xFF006989),
        title: Row(
          children: [
            Icon(Icons.add_circle_outline, color: Colors.white),
            SizedBox(width: 10),
            Text(
              'Novo Inventário',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ],
        ),
        content: TextField(
          controller: inventoryNameController,
          autofocus: true,
          decoration: InputDecoration(
            labelText: 'Nome do inventário',
            labelStyle: TextStyle(color: Colors.white70),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white54),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white, width: 2),
            ),
          ),
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(false);
            },
            child: Text('Cancelar', style: TextStyle(color: Colors.white)),
          ),
          ElevatedButton(
            onPressed: () async {
              String nomeInventario = inventoryNameController.text.trim();
              if (nomeInventario.isNotEmpty) {
                try {
                  var inventario = NovoInventarioData(nomeInventario);
                  await service.create(inventario);
                  Navigator.of(context).pop(true); // Sucesso
                } catch (e) {
                  Navigator.of(context).pop(false);
                  throw Exception(e);
                }
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFF013A63),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Text("Adicionar", style: TextStyle(color: Colors.white)),
          ),
        ],
      );
    },
  );
  return result ?? false;
}