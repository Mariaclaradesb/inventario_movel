import 'package:http/http.dart' as http;
import 'package:inventarioapp/src/constants/api_constants.dart';
import 'dart:convert';

import '../models/connection_data.dart';
import 'shared_prefs_service.dart';

class DatabaseConfigService {
  Future<void> enviarDadosConexao(ConnectionData data) async {
    final apiUrl = ApiConstants.databaseConfigUrl;
    final uri = Uri.parse(apiUrl);

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
