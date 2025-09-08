class ApiConstants {
  static late String apiUrl;

  static void configurarComIp(String url) {
    apiUrl = url;
  }

  static String get inventoriesUrl => '$apiUrl/inventarios';
  static String get inventoryItemUrl => '$apiUrl/item-inventario';
  static String get productsUrl => '$apiUrl/produtos';
  static String get quoteUrl => '$apiUrl/cotacao-lista';
  static String get getDatabaseNameUrl => '$apiUrl/api/database-name';
  static String get databaseConfigUrl => '$apiUrl/database/config';
  static String get inventoryReport => '$apiUrl/relatorio/divergencia';
}
