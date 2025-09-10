import 'dart:convert';
import 'package:inventarioapp/src/models/item_document_av.dart';
import 'package:inventarioapp/src/models/item_document_av_create.dart';
import 'package:inventarioapp/src/services/api_url_provider.dart';
import 'package:inventarioapp/src/services/http_client.dart';

class ItemDocumentAvService {
  final ApiClient _apiClient = ApiClient();

  Future<ItemDocumentAv> create(
      int codigoVenda, ItemDocumentAvCreate item) async {
    String baseUrl = await ApiUrlProvider.getConfiguredUrl();
    final uri = Uri.parse("$baseUrl/pre-vendas/$codigoVenda/itens");

    final response = await _apiClient.post(uri, body: item.toJson());

    if (response.statusCode != 201) {
      throw Exception("Erro ao criar item: ${response.body}");
    }

    return ItemDocumentAv.fromJson(
        json.decode(utf8.decode(response.bodyBytes)));
  }

  Future<List<ItemDocumentAv>> findAll(int codigoVenda) async {
    String baseUrl = await ApiUrlProvider.getConfiguredUrl();
    final uri = Uri.parse("$baseUrl/pre-vendas/$codigoVenda/itens");

    final response = await _apiClient.get(uri);

    if (response.statusCode != 200) {
      throw Exception("Erro ao buscar itens: ${response.body}");
    }

    Iterable list = json.decode(utf8.decode(response.bodyBytes));
    return List<ItemDocumentAv>.from(
        list.map((i) => ItemDocumentAv.fromJson(i)));
  }

  // Future<ItemDocumentAv> update(
  //     int codigoVenda, int codProduto, int itemId, int quantidade) async {
  //   String baseUrl = await ApiUrlProvider.getConfiguredUrl();
  //   final uri = Uri.parse(
  //       "$baseUrl/pre-vendas/$codigoVenda/itens?codProduto=$codProduto&itemId=$itemId&quantidade=$quantidade");
  //
  //   final response = await _apiClient.put(uri);
  //
  //   if (response.statusCode != 200) {
  //     throw Exception("Erro ao atualizar item: ${response.body}");
  //   }
  //
  //   return ItemDocumentAv.fromJson(
  //       json.decode(utf8.decode(response.bodyBytes)));
  // }


  // Future<void> delete(int codigoVenda, int codProduto, int itemId) async {
  //   String baseUrl = await ApiUrlProvider.getConfiguredUrl();
  //   final uri = Uri.parse(
  //       "$baseUrl/pre-vendas/$codigoVenda/itens?codProduto=$codProduto&itemId=$itemId");
  //
  //   final response = await _apiClient.delete(uri);
  //
  //   if (response.statusCode != 204) {
  //     throw Exception("Erro ao deletar item: ${response.body}");
  //   }
  // }
}
