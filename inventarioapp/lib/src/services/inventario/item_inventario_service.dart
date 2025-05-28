import 'dart:convert';

import 'package:inventarioapp/src/constants/api_constants.dart';
import 'package:inventarioapp/src/models/item_inventario.dart';
import 'package:http/http.dart' as http;
import 'package:inventarioapp/src/services/api_url_provider.dart';
import 'package:inventarioapp/src/services/shared_prefs_service.dart';

class ItemInventarioService {

  Future<ItemInventario> saveInventoryItem(ItemInventario inventoryItem) async {
    final codLoja = await SharedPrefsService.obterLojaSelecionada();

    if (codLoja == null) {
      throw Exception("Loja não selecionada");
    }

    String baseUrl = await ApiUrlProvider.getConfiguredUrl();


    final uri = Uri.parse("$baseUrl/item-inventario/salvar?codLoja=$codLoja");

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

  Future<List<ItemInventario>> buscarItensDoInventario(int codInventario) async {
  final codLoja = await SharedPrefsService.obterLojaSelecionada();

  String baseUrl = await ApiUrlProvider.getConfiguredUrl();

  if (codLoja == null) {
    throw Exception("Loja não selecionada");
  }

  final uri = Uri.parse('$baseUrl/item-inventario/listar?storeId=$codLoja&inventoryId=$codInventario');

  final response = await http.get(uri);

  if (response.statusCode != 200) {
    throw Exception('Erro ao buscar itens do inventário');
  }

  final List<dynamic> jsonList = jsonDecode(response.body);
  return jsonList.map((json) => ItemInventario.fromJson(json)).toList();
}


}