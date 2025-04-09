import 'dart:ffi';

class ItemInventario {
  int _codInventario;
  int _codProduto;
  Double? _estAtual;
  Double? _estLoja;

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
      json['estAtual'] as Double,
      json['estLoja'] as Double
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

  Double? get estLoja => _estLoja;

  set estLoja(Double? value) {
    _estLoja = value;
  }

  Double? get estAtual => _estAtual;

  set estAtual(Double? value) {
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
