import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:inventarioapp/src/models/vproduto.dart';
import 'package:inventarioapp/src/services/shared_prefs_service.dart';

class ConsultapService {
  static const String baseUrl = "http://10.0.2.2:8080/produtos";

  Future<List<VProduto>> buscarProdutos(String termo) async {
    final codLoja = await SharedPrefsService.obterLojaSelecionada();
    
    if (codLoja == null) {
      throw Exception("Loja não selecionada");
    }

    final response = await http.get(
      Uri.parse("$baseUrl/buscar?termo=$termo&codLoja=$codLoja"),
    );

    if (response.statusCode != 200) {
      throw Exception("Erro ao buscar produtos");
    }

    Iterable list = json.decode(response.body);
    List<VProduto> products = List<VProduto>.from(list.map((p) => VProduto.fromJson(p)));
    return products;
  }
}
