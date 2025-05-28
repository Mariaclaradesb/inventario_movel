import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:inventarioapp/src/services/api_url_provider.dart';

import '../models/connection_data.dart';
import 'shared_prefs_service.dart';

class DatabaseConfigService {
  Future<void> enviarDadosConexao(ConnectionData data) async {

    print('[DatabaseConfigService] Início de enviarDadosConexao');

    String serverIp = 'http://' + data.url;
    int port = 9090;

        print('[DatabaseConfigService] Salvando IP: $serverIp:$port');

    await SharedPrefsService.salvarIpServidor("$serverIp:$port");

    String baseUrl = await ApiUrlProvider.getConfiguredUrl();
    print('[DatabaseConfigService] baseUrl obtida: $baseUrl');

    final url = '$baseUrl/database/config';
    final uri = Uri.parse(url);

    print('[DatabaseConfigService] Enviando POST para: $url');
    print('[DatabaseConfigService] Dados enviados: ${jsonEncode(data.toJson())}');

    final response = await http.post(
      uri,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(data.toJson()),
    );

    print('[DatabaseConfigService] Status da resposta: ${response.statusCode}');
    print('[DatabaseConfigService] Corpo da resposta: ${response.body}');

    if (response.statusCode != 200) {
      throw Exception("Erro ao configurar o banco: ${response.body}");
    }

  }
}
