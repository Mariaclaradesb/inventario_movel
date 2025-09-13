import 'empresa.dart';

class InventarioData {
  int? _codigo;
  Empresa? _loja;
  DateTime? _data;
  String? _hora;
  String? _nome;
  int? _disponivelEfd;

  InventarioData(
    this._codigo,
    this._loja,
    this._data,
    this._hora,
    this._nome,
    this._disponivelEfd,
  );


  factory InventarioData.fromJson(Map<String, dynamic> json) {
    return InventarioData(
      json['codigo'] as int,
      json['loja'] != null
          ? Empresa.fromJson(json['loja'])
          : null as Empresa?,
      json['data'] != null ? DateTime.parse(json['data']) : null as DateTime?,
      json['hora'] as String?,
      json['nome'] as String?,
      json['disponivelEfd'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'codigo': _codigo,
      'loja': _loja?.toJson(),
      'data': _data?.toIso8601String(),
      'hora': _hora,
      'nome': _nome,
      'disponivelEfd': _disponivelEfd,
    };
  }

  int? get disponivelEfd => _disponivelEfd;

  set disponivelEfd(int? value) {
    _disponivelEfd = value;
  }

  String? get nome => _nome;

  set nome(String? value) {
    _nome = value;
  }

  String? get hora => _hora;

  set hora(String? value) {
    _hora = value;
  }

  DateTime? get data => _data;

  set data(DateTime? value) {
    _data = value;
  }

  Empresa? get loja => _loja;

  set loja(Empresa? value) {
    _loja = value;
  }

  int? get codigo => _codigo;

  set codigo(int? value) {
    _codigo = value;
  }
}
