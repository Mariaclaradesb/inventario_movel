import 'package:flutter/material.dart';
import 'package:inventarioapp/src/ui/pages/configuracoes_page.dart';
import 'package:inventarioapp/src/ui/pages/consultap_page.dart';
import 'package:inventarioapp/src/ui/pages/tela_inicial_page.dart';
import 'package:inventarioapp/src/ui/widgets/app_bar.dart';
import 'package:inventarioapp/src/ui/pages/login_page.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/login',
      routes: {
        '/telaInicial': (context) => TelaInicialPage(),
        '/configuracoes': (context) => ConfiguracoesPage(),
        '/appBar': (context) => MyAppBar(),
        '/consultaProdutos': (context) => ConsultapPage(),
        '/login': (context) => LoginPage()
      },
    );
  }
}


