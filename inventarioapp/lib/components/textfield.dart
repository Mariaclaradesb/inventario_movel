import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget{
    final controller;
    final String hintText;
    final bool obscureText;

    const MyTextField({
        super.key,
        required this.controller,
        required this.hintText,
        required this.obscureText,
    });

    @override
    Widget build(BuildContext context) {
        return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: TextField(
                controller: controller,
                obscureText: obscureText,
                decoration: InputDecoration(
                    enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                    ), // Linhas da Borda do Input
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade400),
                    ), // Linhas da Borda do Input com foco e mudança de cor
                    fillColor: Colors.grey.shade200,
                    filled: true,
                    hintText: hintText,
                    hintStyle: TextStyle(color: Colors.grey[500]),
                ), // Decoração do Input
            ), // Campo de Texto
        ); //Padding
    }
}