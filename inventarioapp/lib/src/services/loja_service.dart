import 'dart:convert';

import 'package:http/http.dart' as http;

Future<List<int>> getLojas() async {
  final response = await http.get(Uri.parse('http://10.0.2.2:8080/lojas'));

  if (response.statusCode == 200) {
    List<dynamic> lojasJson = json.decode(response.body);  // Decodificando a resposta JSON
    return lojasJson.map<int>((loja) => loja as int).toList(); // Convertendo para List<int>
  } else {
    throw Exception('Erro ao buscar lojas');
  }
}
