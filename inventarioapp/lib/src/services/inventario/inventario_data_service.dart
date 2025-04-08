
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:inventarioapp/src/models/inventario_data.dart';
import 'package:inventarioapp/src/models/novo_inventario_data.dart';
import 'package:inventarioapp/src/services/shared_prefs_service.dart';


class InventarioDataService {
  static const String baseUrl = "http://10.0.2.2:8080/inventario-data";

  Future<InventarioData> create(NovoInventarioData newInventoryDate) async {
    final codLoja = await SharedPrefsService.obterLojaSelecionada();

    if (codLoja == null) {
      throw Exception("Loja não selecionada");
    }

    final uri = Uri.parse("$baseUrl/criar?codLoja=$codLoja");

    final response = await http.post(uri, body: newInventoryDate);

    if (response.statusCode != 201) {
      throw Exception("Erro ao criar inventário");
    }

    return InventarioData.fromJson(json.decode(response.body));
  }

  Future<List<InventarioData>> findAll() async {
    final codLoja = await SharedPrefsService.obterLojaSelecionada();

    if (codLoja == null) {
      throw Exception("Loja não selecionada");
    }

    final uri = Uri.parse("$baseUrl/buscar?codLoja=$codLoja");

    final response = await http.get(uri);

    Iterable list = json.decode(response.body);
    List<InventarioData> inventories = List<InventarioData>.from(list.map((i) => InventarioData.fromJson(i)));
    return inventories;
  }

}
