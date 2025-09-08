import 'package:http/http.dart' as http;
import 'package:inventarioapp/src/services/api_url_provider.dart';

Future<String> getDatabaseName() async {
  String baseUrl = await ApiUrlProvider.getConfiguredUrl();

  final response = await http.get(Uri.parse('$baseUrl/api/database-name'));

  if (response.statusCode == 200) {
    return response.body; 
  } else {
    throw Exception('Erro ao buscar o nome do banco');
  }
}
