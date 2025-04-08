import 'package:flutter/material.dart';
import 'package:inventarioapp/src/models/inventario_data.dart';
import 'package:inventarioapp/src/ui/widgets/app_bar.dart';

class InventoryProductsScreen extends StatefulWidget {
  const InventoryProductsScreen({super.key});

  @override
  State<InventoryProductsScreen> createState() =>
      _InventoryProductsScreenState();
}

class _InventoryProductsScreenState extends State<InventoryProductsScreen> {
  // late InventarioData inventario;

  @override
  void initState() {
    super.initState();
    // futureItens = service.
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // inventario = ModalRoute.of(context)!.settings.arguments as InventarioData;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      body: Container(),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await Navigator.pushNamed(
            context,
            '/consultaProdutos',
            arguments: {
              // 'inventario': inventario,
              'origem': 'inventoryProcutsScreen',
            },
          );
          if(result == true){
            setState(() {

            });
          }
        },
        backgroundColor: Color(0xFF006989),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
        child: Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
