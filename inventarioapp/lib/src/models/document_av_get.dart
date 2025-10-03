import 'package:inventarioapp/src/models/funcionario.dart';
import 'package:inventarioapp/src/models/sequencia_dav.dart';
import 'empresa.dart';

class DocumentAvGet {
  int codigoVenda;
  Empresa? loja;
  DateTime? emissao;
  FuncionarioData? vendedor;
  double? valorProd;
  double? totalVenda;
  String? nomeCli;
  DateTime? mapa;
  String? hora;
  String? nomeUsuario;
  Sequencia? sequencia;

  DocumentAvGet({
    required this.codigoVenda,
    this.loja,
    this.emissao,
    this.vendedor,
    this.valorProd,
    this.totalVenda,
    this.nomeCli,
    this.mapa,
    this.hora,
    this.nomeUsuario,
    this.sequencia,
  });

  // Função auxiliar para converter a data "dd/MM/yyyy"
  static DateTime? _parsePtBrDate(String? dateString) {
    if (dateString == null) return null;
    try {
      final parts = dateString.split('/');
      if (parts.length != 3) return null; // Garante que a data tem 3 partes
      final dia = parts[0];
      final mes = parts[1];
      final ano = parts[2];
      // Remonta a data no formato que o Dart entende (yyyy-MM-dd)
      return DateTime.parse('$ano-$mes-$dia');
    } catch (e) {
      print('Erro ao converter a data: $dateString');
      return null; // Retorna nulo se a conversão falhar
    }
  }

  factory DocumentAvGet.fromJson(Map<String, dynamic> json) {
    return DocumentAvGet(
      codigoVenda: json['codigoVenda'] as int,
      loja: json['codLoja'] != null ? Empresa(json['codLoja'] as int, '') : null,
      emissao: json['emissao'] != null ? DateTime.parse(json['emissao']) : null,
      vendedor: json['vendedor'] != null ? FuncionarioData.fromJson(json['vendedor']) : null,
      valorProd: (json['valorProd'] as num?)?.toDouble(),
      totalVenda: (json['totalVenda'] as num?)?.toDouble(),
      nomeCli: json['nomeCli'] as String?,
      
      // --- ALTERAÇÃO PRINCIPAL AQUI ---
      // Usa a nossa função auxiliar para converter o campo 'mapa'
      mapa: _parsePtBrDate(json['mapa']),
      
      hora: json['hora'] as String?,
      nomeUsuario: json['nomeUsuario'] as String?,
      sequencia: json['sequencia'] != null ? Sequencia(sequencia: json['sequencia'] as int) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'codigoVenda': codigoVenda,
      'loja': loja?.toJson(),
      'emissao': emissao?.toIso8601String(),
      'vendedor': vendedor?.toJson(),
      'valorProd': valorProd,
      'totalVenda': totalVenda,
      'nomeCli': nomeCli,
      'mapa': mapa?.toIso8601String(), // Ao enviar de volta, usa o formato padrão
      'hora': hora,
      'nomeUsuario': nomeUsuario,
      'sequencia': sequencia?.toJson(),
    };
  }
}