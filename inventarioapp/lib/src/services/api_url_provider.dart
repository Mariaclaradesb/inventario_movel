import 'package:inventarioapp/src/services/shared_prefs_service.dart';

class ApiUrlProvider {
  static Future<String> getConfiguredUrl() async {
    final url = await SharedPrefsService.obterBackendUrl();
    return url ?? 'http://192.168.0.1:8080';
  }
}