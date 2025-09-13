import 'package:flutter/material.dart';
import 'package:inventarioapp/src/models/inventario_data.dart';
import 'package:inventarioapp/src/services/inventario/inventario_data_service.dart';
import 'package:inventarioapp/src/ui/widgets/app_bar.dart';
import 'package:inventarioapp/src/ui/widgets/drawer_widgets.dart';
import 'package:inventarioapp/src/ui/widgets/inventory_card.dart';
import 'package:inventarioapp/src/ui/widgets/inventory_menu_add_widgets.dart';

class InventoryListScreen extends StatefulWidget {
  const InventoryListScreen({super.key});

  @override
  State<InventoryListScreen> createState() => _InventoryListScreenState();
}

class _InventoryListScreenState extends State<InventoryListScreen> {
  final InventarioDataService service = InventarioDataService();
  late Future<List<InventarioData>> futureInventaries;

  @override
  void initState(){
    super.initState();
    futureInventaries = service.findAll();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      drawer: CustomDrawer(),
      body: FutureBuilder<List<InventarioData>>(
        future: futureInventaries,
        builder: (context, response) {
          if (response.connectionState == ConnectionState.waiting) return const Center(child: CircularProgressIndicator());
          if (response.hasError) return Center(child: Text('Erro ao carregar inventários'));
          if (!response.hasData || response.data!.isEmpty)  return Center(child: Text('Nenhum inventário encontrado'));

          final inventarios = response.data!; //adicionar verificação depois
          return ListView.builder(
            itemCount: inventarios.length,
            itemBuilder: (context, index) {
              return InventoryCard(
                inventario: inventarios[index],
                index: index,
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          try {
            final result = await showMenuAddInventory(context);
            if (result == true && mounted) { // Adicionado 'mounted' check
              setState(() {
                futureInventaries = service.findAll();
              });
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Inventário criado com sucesso!'),
                  backgroundColor: Colors.green,
                ),
              );
            }
          } catch (e) {
            if (mounted) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Erro ao criar inventário: ${e.toString().replaceAll("Exception: ", "")}'),
                  backgroundColor: Colors.red,
                ),
              );
            }
          }
        },
        backgroundColor: const Color(0xFF006989),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}