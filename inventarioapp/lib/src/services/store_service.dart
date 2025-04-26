import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:inventarioapp/src/services/api_url_provider.dart';

Future<List<int>> getLojas() async {
  String apiUrl = await ApiUrlProvider.getConfiguredUrl();
  final response = await http.get(Uri.parse('$apiUrl/lojas'));

  if (response.statusCode == 200) {
    List<dynamic> lojasJson = json.decode(response.body);  // Decodificando a resposta JSON
    return lojasJson.map<int>((loja) => loja as int).toList(); // Convertendo para List<int>
  } else {
    throw Exception('Erro ao buscar lojas');
  }
}
