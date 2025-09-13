import 'package:flutter/material.dart';

class LojaNaoSelecionada {
  static void mostrarErro(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          backgroundColor: Color(0xFFa11a1a), // Cor de fundo para erro
          title: Row(
            children: [
              Icon(Icons.error_outline, color: Colors.white),
              SizedBox(width: 10),
              Text("Atenção", style: TextStyle(color: Colors.white)),
            ],
          ),
          content: Text(
            "Nenhuma loja foi selecionada. Por favor, escolha uma loja na tela de Configurações antes de continuar.",
            style: TextStyle(color: Colors.white),
          ),
          actions: [
            ElevatedButton(
              onPressed: () => Navigator.of(context).pop(),
              style: ElevatedButton.styleFrom(backgroundColor: Color(0xFF6b0f0f)),
              child: Text("OK", style: TextStyle(color: Colors.white)),
            ),
          ],
        );
      },
    );
  }
}