import 'package:flutter/material.dart';

class LojaNaoSelecionada {
  static void mostrarErro(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Erro"),
          content: Text("Nenhuma loja foi selecionada. Escolha uma loja antes de continuar."),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text("OK"),
            ),
          ],
        );
      },
    );
  }
}