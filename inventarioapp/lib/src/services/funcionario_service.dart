import 'dart:convert';

import 'package:inventarioapp/src/models/funcionario.dart';
import 'package:inventarioapp/src/services/api_url_provider.dart';
import 'package:inventarioapp/src/services/http_client.dart';
import 'package:inventarioapp/src/services/shared_prefs_service.dart';

class FuncionarioDataService {
  final ApiClient _apiClient = ApiClient();

  Future<List<FuncionarioData>> findAll() async {
    final int? codLoja = await SharedPrefsService.obterLojaSelecionada();
    if (codLoja == null) {
      throw Exception("Loja não selecionada");
    }

    String baseUrl = await ApiUrlProvider.getConfiguredUrl();
    
    
    final uri = Uri.parse('$baseUrl/funcionarios?codLoja=$codLoja');

    try {
      final response = await _apiClient.get(uri);

      if (response.statusCode != 200) {
        throw Exception('Erro ao buscar funcionários: ${response.statusCode} - ${response.body}');
      }

      
      final List<dynamic> list = json.decode(utf8.decode(response.bodyBytes));
      
      return list.map((f) => FuncionarioData.fromJson(f)).toList();
    } on Exception catch (e) {
      print('Erro ao carregar funcionários: $e');
      rethrow; 
    }
  }
}