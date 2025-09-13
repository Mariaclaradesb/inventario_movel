class Marca {
  int _codigo;
  int? _codLoja;
  String? _nome;

  Marca(this._codigo, this._codLoja, this._nome);

  String? get nome => _nome;

  int? get codLoja => _codLoja;

  int get codigo => _codigo;

  factory Marca.fromJson(Map<String, dynamic> json) {
    return Marca(
        json['codigo'] as int,
        json['codLoja'] as int?,
        json['nome'] as String?
    );
  }
}