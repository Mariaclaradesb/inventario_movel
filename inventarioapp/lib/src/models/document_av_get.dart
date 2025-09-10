import 'package:inventarioapp/src/models/funcionario.dart';
import 'package:inventarioapp/src/models/sequencia_dav.dart';
import 'empresa.dart';

class DocumentAvGet {
  int? codigoVenda;
  Empresa? loja;
  DateTime? emissao;
  FuncionarioData? vendedor;
  double? valorProd;
  double? totalVenda;
  String? nomeCli;
  DateTime? mapa;
  String? hora;
  String? nomeUsuario;
  Sequencia? sequencia;      // novo campo

  DocumentAvGet({
    this.codigoVenda,
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

  factory DocumentAvGet.fromJson(Map<String, dynamic> json) {
    return DocumentAvGet(
      codigoVenda: json['codigoVenda'] as int?,
      loja: json['loja'] != null ? Empresa.fromJson(json['loja']) : null,
      emissao: json['emissao'] != null ? DateTime.parse(json['emissao']) : null,
      vendedor: json['vendedor'] != null ? FuncionarioData.fromJson(json['vendedor']) : null,
      valorProd: (json['valorProd'] as num?)?.toDouble(),
      totalVenda: (json['totalVenda'] as num?)?.toDouble(),
      nomeCli: json['nomeCli'] as String?,
      mapa: json['mapa'] != null ? DateTime.parse(json['mapa']) : null,
      hora: json['hora'] as String?,
      nomeUsuario: json['nomeUsuario'] as String?,
      sequencia: json['sequencia'] != null ? Sequencia.fromJson(json['sequencia']) : null,
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
      'mapa': mapa?.toIso8601String(),
      'hora': hora,
      'nomeUsuario': nomeUsuario,
      'sequencia': sequencia?.toJson(),
    };
  }
}
