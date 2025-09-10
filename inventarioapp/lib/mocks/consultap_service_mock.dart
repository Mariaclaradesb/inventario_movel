import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:inventarioapp/src/models/vproduto.dart';

class ConsultapServiceMock {
  Future<List<VProduto>> buscarProdutos(String termo, int codLoja) async {
    await Future.delayed(const Duration(milliseconds: 700));

    final String jsonString = await rootBundle.loadString('assets/mocks/all_products.json');
    final List<dynamic> jsonList = json.decode(jsonString);
    final List<VProduto> allProducts = jsonList.map((p) => VProduto.fromJson(p)).toList();

    if (termo.isEmpty) {
      return allProducts;
    }

    final termoLowerCase = termo.toLowerCase();
    return allProducts.where((produto) {
      final nome = produto.nome.toLowerCase();
      final codigo = produto.codigo.codigo.toString();
      return nome.contains(termoLowerCase) || codigo.contains(termoLowerCase);
    }).toList();
  }
}