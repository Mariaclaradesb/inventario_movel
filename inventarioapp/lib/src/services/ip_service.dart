import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/connection_data.dart';
import 'shared_prefs_service.dart';

class IpService {
  Future<void> enviarDadosConexao(ConnectionData data) async {
    final ip = await SharedPrefsService.obterIpServidor();
    final uri = Uri.parse("http://$ip/database/config");  //aqui deve ser 10.0.2.2?

    // final ip = await SharedPrefsService.obterIpServidor() ?? '10.0.2.2:8080';
    // final uri = Uri.parse("http://$ip/database/config");

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
