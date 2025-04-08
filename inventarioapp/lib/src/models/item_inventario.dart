import 'dart:ffi';

class ItemInventario {
  int _codInventario;
  int _codProduto;
  double? _estAtual;
  double? _estLoja;

  ItemInventario(
    this._codInventario,
    this._codProduto,
    this._estAtual,
    this._estLoja,
  );

  factory ItemInventario.fromJson(Map<String, dynamic> json) {
    return ItemInventario(
      json['codInventario'] as int,
      json['codProduto'] as int,
      json['estAtual'] as double,
      json['estLoja'] as double
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'codInventario': _codInventario,
      'codProduto': _codProduto,
      'estAtual': _estAtual,
      'estLoja': _estLoja,
    };
  }

  double? get estLoja => _estLoja;

  set estLoja(double? value) {
    _estLoja = value;
  }

  double? get estAtual => _estAtual;

  set estAtual(double? value) {
    _estAtual = value;
  }

  int get codProduto => _codProduto;

  set codProduto(int value) {
    _codProduto = value;
  }

  int get codInventario => _codInventario;

  set codInventario(int value) {
    _codInventario = value;
  }
}
