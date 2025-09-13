import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsService {
  static const String _backendUrlKey = 'backendUrl';
  static const String _lojaKey = 'codLojaSelecionada';

  static const String _dbIpKey = 'dbIp';
  static const String _dbPortKey = 'dbPort';
  static const String _dbNameKey = 'dbName';
  static const String _dbUserKey = 'dbUser';
  static const String _dbPasswordKey = 'dbPassword';

  // --- Servidor Backend ---
  static Future<void> salvarBackendUrl(String url) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_backendUrlKey, url);
  }

  static Future<String?> obterBackendUrl() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_backendUrlKey);
  }

  // --- Loja Selecionada ---
  static Future<void> salvarLojaSelecionada(int codLoja) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_lojaKey, codLoja);
  }

  static Future<int?> obterLojaSelecionada() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(_lojaKey);
  }

  // --- Configurações do Banco de Dados da Loja ---
  static Future<void> salvarConfiguracaoCompleta({
    required String dbIp,
    required String dbPort,
    required String dbName,
    required String dbUser,
    required String dbPassword,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_dbIpKey, dbIp);
    await prefs.setString(_dbPortKey, dbPort);
    await prefs.setString(_dbNameKey, dbName);
    await prefs.setString(_dbUserKey, dbUser);
    await prefs.setString(_dbPasswordKey, dbPassword);
  }

  static Future<Map<String, String?>> obterConfiguracaoCompleta() async {
    final prefs = await SharedPreferences.getInstance();
    return {
      'dbIp': prefs.getString(_dbIpKey),
      'dbPort': prefs.getString(_dbPortKey),
      'dbName': prefs.getString(_dbNameKey),
      'dbUser': prefs.getString(_dbUserKey),
      'dbPassword': prefs.getString(_dbPasswordKey),
    };
  }
}