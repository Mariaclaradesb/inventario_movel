import 'package:flutter/material.dart';
import 'package:inventarioapp/src/ui/screens/settings_screen.dart';
import 'package:inventarioapp/src/config/injection_container.dart';
import 'package:inventarioapp/src/ui/screens/searchp_screen.dart';
import 'package:inventarioapp/src/ui/screens/inicial_screen.dart';
import 'package:inventarioapp/src/ui/widgets/app_bar.dart';


void main() {
  setup();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/telaInicial',
      routes: {
        '/telaInicial': (context) => TelaInicialPage(),
        '/configuracoes': (context) => ConfiguracoesPage(),
        '/appBar': (context) => MyAppBar(),
        '/consultaProdutos': (context) => ConsultapPage()
      },
    );
  }
}
