import 'package:inventarioapp/src/services/shared_prefs_service.dart';

class ApiUrlProvider {

  static Future<String> getConfiguredUrl() async {
    String? baseUrl = await SharedPrefsService.obterIpServidor();

    if (baseUrl == null) {
      throw Exception("A conexão com o servidor não foi configurada corretamente!");
    }

    return baseUrl;
  }

}