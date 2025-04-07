import 'package:flutter/material.dart';
import 'package:inventarioapp/src/ui/widgets/app_bar.dart';
import 'package:inventarioapp/src/ui/widgets/drawer_widgets.dart';
import 'package:inventarioapp/src/ui/widgets/inventory_menu_add_widgets.dart';

class InventoryScreen extends StatelessWidget {
  const InventoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      drawer: CustomDrawer(),
      body: ListView(children: [

      ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showMenuAddInventory(context);
        },
        backgroundColor: Color(0xFF006989),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
        child: Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}


