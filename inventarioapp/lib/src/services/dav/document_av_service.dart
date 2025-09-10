import 'dart:convert';

import 'package:inventarioapp/src/models/document_av_get.dart';
import 'package:inventarioapp/src/models/document_av_insert.dart';
import 'package:inventarioapp/src/services/api_url_provider.dart';
import 'package:inventarioapp/src/services/http_client.dart';
import 'package:inventarioapp/src/services/shared_prefs_service.dart';


class DocumentAVDataService{
  final ApiClient _apiClient = ApiClient();

  Future<DocumentAvGet> create(int? codVendedor, String? nomeCliente) async {
    final int? codLoja = await SharedPrefsService.obterLojaSelecionada();
    if (codLoja == null){
      throw Exception("Loja não selecionada");
    }

    DocumentAVInsert newDocument = DocumentAVInsert(codLoja, codVendedor!, nomeCliente!);

    String baseUrl = await ApiUrlProvider.getConfiguredUrl();
    final uri = Uri.parse("$baseUrl/pre-vendas?codLoja=$codLoja");

    final response = await _apiClient.post(uri, body: newDocument.toJson());

    if (response.statusCode != 201){
      throw Exception("Erro ao criar documento: ${response.body}");
    }

    return DocumentAvGet.fromJson(json.decode(utf8.decode(response.bodyBytes)));
  }

  Future<List<DocumentAvGet>> findAll() async{
    final int? codLoja = await SharedPrefsService.obterLojaSelecionada();
    if (codLoja == null) {
      throw Exception("Loja não selecionada");
    }

    String baseUrl = await ApiUrlProvider.getConfiguredUrl();
    final uri = Uri.parse("$baseUrl/pre-vendas?codLoja=$codLoja");

    final response = await _apiClient.get(uri);

    if (response.statusCode != 200) {
      throw Exception("Erro ao buscar inventários: ${response.body}");
    }

    Iterable list = json.decode(utf8.decode(response.bodyBytes));
    return List<DocumentAvGet>.from(list.map((i) => DocumentAvGet.fromJson(i)));
  }
}