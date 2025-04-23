import 'package:http/http.dart' as http;
import 'package:inventarioapp/src/constants/api_constants.dart';

Future<String> getDatabaseName() async {
  final response = await http.get(Uri.parse(ApiConstants.getDatabaseNameUrl));

  if (response.statusCode == 200) {
    return response.body; 
  } else {
    throw Exception('Erro ao buscar o nome do banco');
  }
}
