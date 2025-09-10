import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:inventarioapp/src/models/vproduto.dart';
import 'package:inventarioapp/src/services/api_url_provider.dart';
import 'package:inventarioapp/src/services/http_client.dart';
import 'package:inventarioapp/src/services/shared_prefs_service.dart';

class ConsultapService {
  final ApiClient _apiClient = ApiClient();

  Future<List<VProduto>> buscarProdutos(String termo, int codLoja) async {
    String baseUrl = await ApiUrlProvider.getConfiguredUrl();

    final uri = Uri.parse("$baseUrl/produtos/buscar?termo=$termo&codLoja=$codLoja");

    final response = await _apiClient.get(uri);

    if (response.statusCode != 200) {
      print("Erro HTTP ${response.statusCode}: ${response.body}");
      throw Exception("Erro ao buscar produtos");
    }


    Iterable list = json.decode(utf8.decode(response.bodyBytes));
    List<VProduto> products = List<VProduto>.from(
      list.map((p) => VProduto.fromJson(p)),
    );

    int? codigoBuscado = int.tryParse(termo);
    if (codigoBuscado != null) {
      products.sort((a, b) {
        bool aMatch = a.codigo.codigo == codigoBuscado;
        bool bMatch = b.codigo.codigo == codigoBuscado;

        if (aMatch && !bMatch) return -1;
        if (!aMatch && bMatch) return 1;
        return 0; // mantém a ordem
      });
    }

    return products;
  }

  Future<void> adicionarItemACotacao(int codProduto, double quantidade) async {
    String baseUrl = await ApiUrlProvider.getConfiguredUrl();
    final url = Uri.parse(
      "$baseUrl/cotacao-lista/adicionar?codigoProduto=$codProduto&quantidade=$quantidade",
    );
    final response = await _apiClient.post(url);

    if (response.statusCode != 200) {
      throw Exception("Erro ao adicionar à cotação: ${response.body}");
    }
  }
}
