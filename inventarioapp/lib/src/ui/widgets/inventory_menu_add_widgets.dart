import 'package:flutter/material.dart';

void showMenuAddInventory(BuildContext context) {
  var inventoryNameController = TextEditingController();

  showDialog(
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
                  Navigator.of(context).pop();
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
                    Navigator.of(context).pop();
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
}
