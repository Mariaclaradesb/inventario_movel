import 'dart:convert';
import 'dart:typed_data';

import 'package:inventarioapp/src/models/document_av_get.dart';
import 'package:inventarioapp/src/models/document_av_insert.dart';
import 'package:inventarioapp/src/services/api_url_provider.dart';
import 'package:inventarioapp/src/services/http_client.dart';
import 'package:inventarioapp/src/services/shared_prefs_service.dart';

class DocumentAVDataService {
  final ApiClient _apiClient = ApiClient();

  
  Future<DocumentAvGet> create(int? codVendedor, String? nomeCliente) async {
    final int? codLoja = await SharedPrefsService.obterLojaSelecionada();
    if (codLoja == null) {
      throw Exception("Loja não selecionada");
    }

    
    if (codVendedor == null) {
      throw Exception("Vendedor não informado");
    }
    if (nomeCliente == null || nomeCliente.isEmpty) {
      throw Exception("Nome do cliente não informado");
    }

    final insert = DocumentAVInsert(codLoja, codVendedor, nomeCliente);
    final String baseUrl = await ApiUrlProvider.getConfiguredUrl();
    
    
    final uri = Uri.parse('$baseUrl/pre-vendas');

    try {
      final response = await _apiClient.post(uri, body: insert.toJson());

      
      if (response.statusCode != 200 && response.statusCode != 201) {
        throw Exception('Erro ao criar venda: ${response.statusCode} - ${response.body}');
      }

      final Map<String, dynamic> data = json.decode(utf8.decode(response.bodyBytes));
      return DocumentAvGet.fromJson(data);
    } on Exception catch (e) {
      print('Erro ao criar DocumentAV: $e');
      rethrow;
    }
  }

  
  Future<List<DocumentAvGet>> findAll() async {
    final int? codLoja = await SharedPrefsService.obterLojaSelecionada();
    if (codLoja == null) {
      throw Exception("Loja não selecionada");
    }

    final String baseUrl = await ApiUrlProvider.getConfiguredUrl();
    
   
    final uri = Uri.parse('$baseUrl/pre-vendas?codLoja=$codLoja');

    try {
      final response = await _apiClient.get(uri);

      if (response.statusCode != 200) {
        throw Exception('Erro ao carregar vendas: ${response.body}');
      }

      final List<dynamic> list = json.decode(utf8.decode(response.bodyBytes));
      return list.map((v) => DocumentAvGet.fromJson(v)).toList();
    } on Exception catch (e) {
      print('Erro ao carregar DocumentAVs: $e');
      rethrow;
    }
  }

    Future<DocumentAvGet> findById(int codigoVenda) async {
    final String baseUrl = await ApiUrlProvider.getConfiguredUrl();
    final uri = Uri.parse('$baseUrl/pre-vendas/$codigoVenda');

    try {
      final response = await _apiClient.get(uri);

      if (response.statusCode != 200) {
        throw Exception(
            'Erro ao carregar o documento: ${response.statusCode} - ${response.body}');
      }

      final Map<String, dynamic> data =
          json.decode(utf8.decode(response.bodyBytes));
      return DocumentAvGet.fromJson(data);
    } on Exception catch (e) {
      print('Erro ao carregar DocumentAV $codigoVenda: $e');
      rethrow;
    }
  }
}