import 'dart:convert';
import 'dart:typed_data';

import 'package:http/http.dart';
import 'package:inventarioapp/src/models/document_av_get.dart';
import 'package:inventarioapp/src/models/item_document_av.dart';
import 'package:inventarioapp/src/models/item_document_av_create.dart';
import 'package:inventarioapp/src/services/api_url_provider.dart';
import 'package:inventarioapp/src/services/dav/document_av_service.dart';
import 'package:inventarioapp/src/services/http_client.dart';

class ItemDocumentAvService {
  final ApiClient _apiClient = ApiClient();
  final DocumentAVDataService documentAvService = DocumentAVDataService();

  
  Future<ItemDocumentAv> create(int codigoVenda, ItemDocumentAvCreate item, DocumentAvGet documento) async {
    final String baseUrl = await ApiUrlProvider.getConfiguredUrl();
    final uri = Uri.parse('$baseUrl/pre-vendas/$codigoVenda/itens');

    try {
      final response = await _apiClient.post(uri, body: item.toJson());

      
      if (response.statusCode != 200 && response.statusCode != 201) {
        throw Exception('Erro ao criar item: ${response.statusCode} - ${response.body}');
      }

      final Map<String, dynamic> data = json.decode(utf8.decode(response.bodyBytes));
      return ItemDocumentAv.fromJson(data);
      updateDocument(documento);
    } on Exception catch (e) {
      print('Erro ao criar item na venda $codigoVenda: $e');
      rethrow;
    }
  }

  Future<List<ItemDocumentAv>> findAll(int codigoVenda) async {
    final String baseUrl = await ApiUrlProvider.getConfiguredUrl();
    final uri = Uri.parse('$baseUrl/pre-vendas/$codigoVenda/itens');

    try {
      final response = await _apiClient.get(uri);

      if (response.statusCode != 200) {
        throw Exception('Erro ao carregar itens: ${response.body}');
      }

      final List<dynamic> list = json.decode(utf8.decode(response.bodyBytes));
      return list.map((i) => ItemDocumentAv.fromJson(i)).toList();
    } on Exception catch (e) {
      print('Erro ao carregar itens da venda $codigoVenda: $e');
      rethrow;
    }
  }

  Future<ItemDocumentAv> update({
    required int codigoVenda,
    required int codProduto,
    required int itemId,
    required int quantidade,
  }) async {
    final String baseUrl = await ApiUrlProvider.getConfiguredUrl();
    final uri = Uri.parse('$baseUrl/pre-vendas/$codigoVenda/itens')
        .replace(queryParameters: {
      'codProduto': codProduto.toString(),
      'itemId': itemId.toString(),
      'quantidade': quantidade.toString(),
    });

    try {
      final response = await _apiClient.post(uri);

      if (response.statusCode != 200) {
        throw Exception('Erro ao atualizar item: ${response.body}');
      }

      final Map<String, dynamic> data = json.decode(utf8.decode(response.bodyBytes));
      return ItemDocumentAv.fromJson(data);
    } on Exception catch (e) {
      print('Erro ao atualizar item: $e');
      rethrow;
    }
  }

  Future<void> delete({
    required int codigoVenda,
    required int codProduto,
    required int itemId,
  }) async {
    final String baseUrl = await ApiUrlProvider.getConfiguredUrl();
    final uri = Uri.parse('$baseUrl/pre-vendas/$codigoVenda/itens')
        .replace(queryParameters: {
      'itemId': itemId.toString(),
      'codProduto': codProduto.toString(),
    });

    try {
      final response = await _apiClient.post(uri);

      if (response.statusCode != 204 && response.statusCode != 200) {
        throw Exception('Erro ao remover item: ${response.body}');
      }
    } on Exception catch (e) {
      print('Erro ao deletar item: $e');
      rethrow;
    }
  }
  
  Future<void> updateDocument(DocumentAvGet documento) async {
    documento = await documentAvService.findById(documento.codigoVenda!);
  }
}