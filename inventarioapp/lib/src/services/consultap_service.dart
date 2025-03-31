import 'dart:convert';

import 'package:http/http.dart' as http;

class ConsultapService {
  static const String baseUrl = "http://10.0.2.2:8080/produtos";

  Future<List<dynamic>> buscarProdutos (String termo) async {
    final response = await http.get(Uri.parse("$baseUrl/buscar?termo=$termo"));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception("Erro ao buscar produtos");
    }
  }
}
