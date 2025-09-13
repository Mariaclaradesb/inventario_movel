class Empresa {
  int _codigo;
  String _nome;

  Empresa(this._codigo, this._nome);

  factory Empresa.fromJson(Map<String, dynamic> json) {
    return Empresa(json['codigo'] as int, json['nome'] as String);
  }

  Map<String, dynamic> toJson() {
    return {
      'codigo': codigo,
      'nome': nome
    };
  }

  int get codigo => _codigo;
  String get nome => _nome;
}