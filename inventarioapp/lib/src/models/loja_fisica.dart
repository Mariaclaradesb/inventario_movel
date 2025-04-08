class LojaFisica {
  int _codigo;

  LojaFisica(this._codigo);

  factory LojaFisica.fromJson(Map<String, dynamic> json) {
    return LojaFisica(json['codigo'] as int);
  }

  int get codigo => _codigo;
}