import 'package:inventarioapp/src/constants/api_constants.dart';
import 'package:inventarioapp/src/services/shared_prefs_service.dart';

class ApiUrlProvider {

 static Future<String> getConfiguredUrl() async {
    final ip = await SharedPrefsService.obterIpServidor();

    // Define um IP padrão caso não esteja salvo
    final baseUrl = ip ?? 'http://192.168.0.1:9090';

    // Configura a API para usar este IP
    ApiConstants.configurarComIp(baseUrl);

    return baseUrl;
  }
}