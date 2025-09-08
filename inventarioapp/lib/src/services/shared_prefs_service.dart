import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsService {
  static const String _lojaKey = 'codLojaSelecionada';
  
  static Future<void> salvarIpServidor(String ip) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('ip_servidor', ip);  
    
  }

  static Future<String?> obterIpServidor() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('ip_servidor');  
  }

  static Future<void> salvarLojaSelecionada(int codLoja) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_lojaKey, codLoja);
  }

  static Future<int?> obterLojaSelecionada() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(_lojaKey);
  }

  static Future<void> limparLojaSelecionada() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_lojaKey);
  }
}
