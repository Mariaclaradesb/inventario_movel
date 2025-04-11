import 'package:flutter/material.dart';
import 'package:inventarioapp/src/ui/widgets/app_bar.dart';
import 'package:inventarioapp/src/ui/widgets/drawer_widgets.dart';

class TelaInicialPage extends StatelessWidget {
  const TelaInicialPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      drawer: CustomDrawer(),
      body: Center(child: Text("Página Inicial")),
    );
  }
}


