import 'package:flutter/material.dart';
import 'package:inventarioapp/src/ui/pages/configuracoes_page.dart';
import 'package:inventarioapp/src/ui/pages/consultap_page.dart';
import 'package:inventarioapp/src/ui/pages/inventory_list_screen.dart';
import 'package:inventarioapp/src/ui/pages/path_screen.dart';
import 'package:inventarioapp/src/ui/pages/tela_inicial_page.dart';
import 'package:inventarioapp/src/ui/pages/login_page.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/inventoryListScreen',
      routes: {
        '/telaInicial': (context) => TelaInicialPage(),
        '/configuracoes': (context) => ConfiguracoesPage(),
        '/consultaProdutos': (context) => ConsultapPage(),
        '/loginScreen': (context) => LoginPage(),
        '/pathScreen': (context) => PathScreen(),
        '/inventoryListScreen': (context) => InventoryListScreen(),
      },
    );
  }
}
