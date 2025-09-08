import 'dart:convert';
import 'package:inventarioapp/src/models/inventario_data.dart';
import 'package:inventarioapp/src/models/novo_inventario_data.dart';
import 'package:inventarioapp/src/services/api_url_provider.dart';
import 'package:inventarioapp/src/services/http_client.dart'; // Importa o ApiClient
import 'package:inventarioapp/src/services/shared_prefs_service.dart';

class InventarioDataService {
  final ApiClient _apiClient = ApiClient(); // Usa o ApiClient

  Future<InventarioData> create(NovoInventarioData newInventoryDate) async {
    final int? codLoja = await SharedPrefsService.obterLojaSelecionada();
    if (codLoja == null) {
      throw Exception("Loja não selecionada");
    }

    String baseUrl = await ApiUrlProvider.getConfiguredUrl();
    final uri = Uri.parse("$baseUrl/inventarios/criar?codLoja=$codLoja");

    final response = await _apiClient.post(uri, body: newInventoryDate.toJson());

    if (response.statusCode != 201) {
      throw Exception("Erro ao criar inventário: ${response.body}");
    }
    return InventarioData.fromJson(json.decode(utf8.decode(response.bodyBytes)));
  }

  Future<List<InventarioData>> findAll() async {
    final int? codLoja = await SharedPrefsService.obterLojaSelecionada();
    if (codLoja == null) {
      throw Exception("Loja não selecionada");
    }

    String baseUrl = await ApiUrlProvider.getConfiguredUrl();
    final uri = Uri.parse("$baseUrl/inventarios/buscar?codLoja=$codLoja");

    final response = await _apiClient.get(uri);

    if (response.statusCode != 200) {
      throw Exception("Erro ao buscar inventários: ${response.body}");
    }

    Iterable list = json.decode(utf8.decode(response.bodyBytes));
    return List<InventarioData>.from(list.map((i) => InventarioData.fromJson(i)));
  }
}