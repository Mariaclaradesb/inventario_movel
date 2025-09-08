import 'package:flutter/material.dart';

import 'package:inventarioapp/src/ui/screens/inventory_products_screen.dart';
import 'package:inventarioapp/src/ui/screens/inventory_list_screen.dart';
import 'package:inventarioapp/src/ui/screens/path_screen.dart';

import 'package:inventarioapp/src/ui/screens/settings_screen.dart';
import 'package:inventarioapp/src/config/injection_container.dart';
import 'package:inventarioapp/src/ui/screens/searchp_screen.dart';
import 'package:inventarioapp/src/ui/widgets/app_bar.dart';
import 'package:inventarioapp/src/ui/screens/login_page.dart';


void main() {
  setup(); //certo?
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/loginScreen',
      routes: {
        '/configuracoes': (context) => ConfiguracoesPage(),
        '/consultaProdutos': (context) => ConsultapPage(),
        '/appBar': (context) => MyAppBar(),
        '/loginScreen': (context) => LoginPage(),
        '/pathScreen': (context) => PathScreen(),
        '/inventoryListScreen': (context) => InventoryListScreen(),
        '/inventoryProductsScreen': (context) => InventoryProductsScreen(),
      },
    );
  }
}
