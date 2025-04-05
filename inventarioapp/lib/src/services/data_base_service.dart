import 'package:http/http.dart' as http;

Future<String> getDatabaseName() async {
  final response = await http.get(Uri.parse('http://10.0.2.2:8080/api/database-name'));

  if (response.statusCode == 200) {
    return response.body; 
  } else {
    throw Exception('Erro ao buscar o nome do banco');
  }
}
