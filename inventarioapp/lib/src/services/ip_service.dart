import 'package:http/http.dart' as http;

class IpService {
  Future<void> enviarIpParaBack(String ip) async {
    final response = await http.post(
      Uri.parse('http://10.0.2.2:8080/config/ip'),
      body: ip,
      headers: {'Content-Type': 'text/plain'},
    );

    if (response.statusCode == 200) {
      print("IP enviado com sucesso");
    } else {
      print("Erro ao enviar IP: ${response.statusCode}");
      print("Detalhes: ${response.body}");
    }
  }
}
