
import 'package:flutter/material.dart';
import 'package:inventarioapp/src/services/data_base_service.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Container(
              height: 90,
              alignment: Alignment.topLeft,
              color: Color(0xFF006989),
              padding: EdgeInsets.only(top:50, left: 15),
              child: Column(
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.person,
                        color: Colors.white,
                        size: 30, // Tamanho do ícone
                      ),
                      SizedBox(width: 10), // Espaçamento entre o ícone e o texto
                      Text(
                        "ADMIN",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("Início"),
              onTap: () {
                Navigator.pushReplacementNamed(context, "/pathScreen");
              },
            ),
            ListTile(
                leading: Icon(Icons.settings),
                title: Text("Configurações"),
                onTap: () {
                  Navigator.pushReplacementNamed(context, "/configuracoes");
                }
            ),
            ListTile(
              leading: Icon(Icons.storage), // Ícone opcional
              title: FutureBuilder<String>(
                future: getDatabaseName(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Text("Carregando...");
                  } else if (snapshot.hasError) {
                    return Text("Erro: ${snapshot.error}");
                  } else {
                    return Text("Banco: ${snapshot.data}");
                  }
                },
              ),
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text("Sair"),
              onTap: (){
                Navigator.pushReplacementNamed(context, "/loginScreen");
              },
            )
          ],
        )
    );
  }
}