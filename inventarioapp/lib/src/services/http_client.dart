import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:inventarioapp/src/services/shared_prefs_service.dart';

// 1. Classe renomeada de HttpClient para ApiClient
class ApiClient {
  Future<Map<String, String>> _getHeaders() async {
    final dbConfig = await SharedPrefsService.obterConfiguracaoCompleta();
    return {
      'Content-Type': 'application/json; charset=UTF-8',
      'X-DB-IP': dbConfig['dbIp'] ?? '',
      'X-DB-Port': dbConfig['dbPort'] ?? '',
      'X-DB-Name': dbConfig['dbName'] ?? '',
      'X-DB-User': dbConfig['dbUser'] ?? '',
      'X-DB-Password': dbConfig['dbPassword'] ?? '',
    };
  }

  Future<http.Response> get(Uri url) async {
    final headers = await _getHeaders();
    return http.get(url, headers: headers);
  }

  Future<http.Response> post(Uri url, {Object? body}) async {
    final headers = await _getHeaders();
    return http.post(url, headers: headers, body: jsonEncode(body));
  }
}