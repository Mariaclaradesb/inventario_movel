import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:inventarioapp/src/constants/api_constants.dart';
import 'package:inventarioapp/src/services/shared_prefs_service.dart';

class ReelatorioService {
  Future<List<Map<String, dynamic>>> buscarDivergencias(
    int codLoja,
    codInventario,
  ) async {
    final int? codLoja = await SharedPrefsService.obterLojaSelecionada();

    if (codLoja == null) {
      throw Exception("Loja não selecionada");
    }
    final url = Uri.parse(
      '${ApiConstants.inventoryReport}/$codLoja/$codInventario',
    );

    try {
      final response = await http.get(url).timeout(const Duration(seconds: 20));

      if (response.statusCode != 200) {
        int code = response.statusCode;
        throw Exception(
          'Erro ao buscar relatório: ${response.statusCode} - ${response.body}, uri: $url, status: $code',
        );
      }

      final List lista = json.decode(response.body);
      return List<Map<String, dynamic>>.from(lista);
    } on TimeoutException catch (_) {
      throw Exception('Tempo de conexão esgotado, tente novamente.');
    } on SocketException catch (_) {
      throw Exception('Falha na conexão com o servidor.');
    } catch (e) {
      throw Exception('Erro inesperado: $e');
    }
  }
}
