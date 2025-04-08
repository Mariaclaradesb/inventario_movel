class NovoInventarioData {
  String _nome;

  NovoInventarioData(this._nome);

  Map<String, dynamic> toJson() => {
    'nome': _nome,
  };

  String get nome => _nome;

  set nome(String value) {
    _nome = value;
  }
}