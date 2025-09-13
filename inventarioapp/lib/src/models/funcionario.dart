import 'package:inventarioapp/src/models/empresa.dart';

class FuncionarioData {
  int? _codigo;
  String? _nome;
  String? _apelido;
  Empresa? _loja;

  FuncionarioData(this._codigo, this._nome, this._apelido, this._loja);

  factory FuncionarioData.fromJson(Map<String, dynamic> json) {
    return FuncionarioData(
      json['codigo'] as int?,
      json['nome'] as String?,
      json['apelido'] as String?,
      json['loja'] != null ? Empresa.fromJson(json['loja']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'codigo': _codigo,
      'nome': _nome,
      'apelido': _apelido,
      'loja': _loja?.toJson()
    };
  }

  Empresa? get loja => _loja;

  set loja(Empresa? value) {
    _loja = value;
  }

  String? get apelido => _apelido;

  set apelido(String? value) {
    _apelido = value;
  }

  String? get nome => _nome;

  set nome(String? value) {
    _nome = value;
  }

  int? get codigo => _codigo;

  set codigo(int? value) {
    _codigo = value;
  }
}