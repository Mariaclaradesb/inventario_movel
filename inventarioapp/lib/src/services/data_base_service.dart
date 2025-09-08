import 'package:http/http.dart' as http;
import 'package:inventarioapp/src/services/api_url_provider.dart';
import 'package:inventarioapp/src/services/http_client.dart';

final ApiClient _apiClient = ApiClient();

Future<String> getDatabaseName() async {
  String baseUrl = await ApiUrlProvider.getConfiguredUrl();
  final response = await _apiClient.get(Uri.parse('$baseUrl/api/database-name'));
  
  if (response.statusCode == 200) {
    return response.body; 
  } else {
    throw Exception('Erro ao buscar o nome do banco');
  }
}
