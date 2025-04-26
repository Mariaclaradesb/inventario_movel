
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:inventarioapp/src/constants/api_constants.dart';
import 'package:inventarioapp/src/models/inventario_data.dart';
import 'package:inventarioapp/src/models/item_inventario.dart';
import 'package:inventarioapp/src/models/novo_inventario_data.dart';
import 'package:inventarioapp/src/services/api_url_provider.dart';
import 'package:inventarioapp/src/services/shared_prefs_service.dart';


class InventarioDataService {

  Future<InventarioData> create(NovoInventarioData newInventoryDate) async {
    final codLoja = await SharedPrefsService.obterLojaSelecionada();

    if (codLoja == null) {
      throw Exception("Loja não selecionada");
    }

    String baseUrl = await ApiUrlProvider.getConfiguredUrl();

    final uri = Uri.parse("$baseUrl/inventarios/criar?codLoja=$codLoja");

    final response = await http.post(uri,
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(newInventoryDate.toJson()),
    );

    if (response.statusCode != 201) {
      throw Exception("Erro ao criar inventário");
    }

    return InventarioData.fromJson(json.decode(response.body));
  }

  Future<List<InventarioData>> findAll() async {
    final codLoja = await SharedPrefsService.obterLojaSelecionada();

    if (codLoja == null) {
      throw Exception("Loja não selecionada");
    }

    String baseUrl = await ApiUrlProvider.getConfiguredUrl();

    final uri = Uri.parse("$baseUrl/inventarios/buscar?codLoja=$codLoja");

    final response = await http.get(uri);

    Iterable list = json.decode(response.body);
    List<InventarioData> inventories = List<InventarioData>.from(list.map((i) => InventarioData.fromJson(i)));
    return inventories;
  }

  Future<List<ItemInventario>> findItemsByInventory(int inventoryId) async {
    final codLoja = await SharedPrefsService.obterLojaSelecionada();

    if (codLoja == null) {
      throw Exception("Loja não selecionada");
    }

    String baseUrl = await ApiUrlProvider.getConfiguredUrl();

    final uri = Uri.parse("$baseUrl/inventarios/buscar/$inventoryId/itens?codLoja=$codLoja");

    final response = await http.get(uri);

    Iterable list = json.decode(response.body);
    List<ItemInventario> items = List<ItemInventario>.from(list.map((i) => ItemInventario.fromJson(i)));
    return items;
  }

}
