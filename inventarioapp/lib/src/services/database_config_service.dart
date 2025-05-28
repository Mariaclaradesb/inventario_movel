import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:inventarioapp/src/services/api_url_provider.dart';

import '../models/connection_data.dart';
import 'shared_prefs_service.dart';

class DatabaseConfigService {
  Future<void> enviarDadosConexao(ConnectionData data) async {

    String serverIp = 'http://' + data.url;
    int port = 9090;
    await SharedPrefsService.salvarIpServidor("$serverIp:$port");

    String baseUrl = await ApiUrlProvider.getConfiguredUrl();

    final url = '$baseUrl/database/config';
    final uri = Uri.parse(url);

    final response = await http.post(
      uri,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(data.toJson()),
    );

    if (response.statusCode != 200) {
      throw Exception("Erro ao configurar o banco: ${response.body}");
    }

  }
}
