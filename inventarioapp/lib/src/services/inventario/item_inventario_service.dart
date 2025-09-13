import 'dart:convert';
import 'package:inventarioapp/src/models/item_inventario.dart';
import 'package:inventarioapp/src/services/api_url_provider.dart';
import 'package:inventarioapp/src/services/http_client.dart'; // Importa o ApiClient
import 'package:inventarioapp/src/services/shared_prefs_service.dart';

class ItemInventarioService {
  final ApiClient _apiClient = ApiClient(); // Usa o ApiClient

  Future<ItemInventario> saveInventoryItem(ItemInventario inventoryItem) async {
    String baseUrl = await ApiUrlProvider.getConfiguredUrl();
    final uri = Uri.parse("$baseUrl/item-inventario/salvar");

    final response = await _apiClient.post(uri, body: inventoryItem.toJson());

    if (response.statusCode != 200) {
      throw Exception("Erro ao adicionar item ao inventário: ${response.body}");
    }
    return ItemInventario.fromJson(json.decode(utf8.decode(response.bodyBytes)));
  }

  Future<List<ItemInventario>> buscarItensDoInventario(int codInventario) async {
    final int? codLoja = await SharedPrefsService.obterLojaSelecionada();
    if (codLoja == null) {
      throw Exception("Loja não selecionada");
    }

    String baseUrl = await ApiUrlProvider.getConfiguredUrl();
    final uri = Uri.parse('$baseUrl/inventarios/buscar/$codInventario/itens?codLoja=$codLoja');

    final response = await _apiClient.get(uri);

    if (response.statusCode != 200) {
      throw Exception('Erro ao buscar itens do inventário: ${response.body}');
    }

    final List<dynamic> jsonList = jsonDecode(utf8.decode(response.bodyBytes));
    return jsonList.map((json) => ItemInventario.fromJson(json)).toList();
  }
}