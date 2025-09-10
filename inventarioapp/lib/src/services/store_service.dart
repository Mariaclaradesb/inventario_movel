import 'dart:convert';
import 'package:inventarioapp/src/models/empresa.dart';
import 'package:inventarioapp/src/services/api_url_provider.dart';
import 'package:inventarioapp/src/services/http_client.dart'; // Importa o ApiClient

// Instancia o ApiClient fora da função para reutilização
final ApiClient _apiClient = ApiClient();

Future<List<Empresa>> getLojas() async {
  String apiUrl = await ApiUrlProvider.getConfiguredUrl();
  final response = await _apiClient.get(Uri.parse('$apiUrl/lojas'));

  if (response.statusCode == 200) {
    List<dynamic> lojasJson = json.decode(utf8.decode(response.bodyBytes));
    return lojasJson.map((json) => Empresa.fromJson(json)).toList();
  } else {
    throw Exception('Erro ao buscar lojas: ${response.body}');
  }
}