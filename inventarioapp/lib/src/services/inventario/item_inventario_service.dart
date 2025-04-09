import 'dart:convert';

import 'package:inventarioapp/src/models/item_inventario.dart';
import 'package:http/http.dart' as http;
import 'package:inventarioapp/src/services/shared_prefs_service.dart';

class ItemInventarioService {
  static const String baseUrl = "http://10.0.2.2:8080/item-inventario";

  Future<ItemInventario> saveInventoryItem(ItemInventario inventoryItem) async {
    final codLoja = await SharedPrefsService.obterLojaSelecionada();

    if (codLoja == null) {
      throw Exception("Loja não selecionada");
    }

    final uri = Uri.parse("$baseUrl/salvar?codLoja=$codLoja");

    final response = await http.post(uri,
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(inventoryItem.toJson()),
    );

    if (response.statusCode != 200) {
      throw Exception("Erro ao adicionar item ao inventário");
    }

    return ItemInventario.fromJson(json.decode(response.body));
  }

}