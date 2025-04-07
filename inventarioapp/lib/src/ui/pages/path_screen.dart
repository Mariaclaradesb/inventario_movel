import 'package:flutter/material.dart';
import 'package:inventarioapp/src/ui/widgets/app_bar.dart';
import 'package:inventarioapp/src/ui/widgets/drawer_widgets.dart';

class PathScreen extends StatelessWidget {
  const PathScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFDAE3E7),
      appBar: MyAppBar(),
      drawer: CustomDrawer(),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "/inventoryScreen");
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(360, 60),
                    backgroundColor: Color(0xFF013A63),
                  ),
                  child: Text(
                    "INVENTÁRIO",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      "/consultaProdutos",
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(360, 60),
                    backgroundColor: Color(0xFF013A63),
                  ),
                  child: Text(
                    "CONSULTAR PRODUTOS",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
