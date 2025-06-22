import 'dart:ffi';

import 'package:inventarioapp/src/models/vproduto_id.dart';

class ItemInventario {
  int? _codInventario;
  VProdutoId _codProduto; // não pode ser nulo, precisa ser inicializado
  double? _estAtual;
  double? _estLoja;
  String? _nomeProduto;

  // Construtor exige codProduto obrigatoriamente
  ItemInventario(
    this._codInventario,
    this._codProduto,
    this._estAtual,
    this._estLoja,
    [this._nomeProduto]
  );

  factory ItemInventario.fromJson(Map<String, dynamic> json) {
    return ItemInventario(
      json['codInventario'] as int?,
      VProdutoId.fromJson(json['codProduto']),
      (json['estAtual'] as num).toDouble(),
      (json['estLoja'] as num).toDouble(),
      json['nomeProduto'] as String?
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'codInventario': _codInventario,
      'codProduto': _codProduto.toJson(),
      'estAtual': _estAtual,
      'estLoja': _estLoja,
    };
  }

  VProdutoId get codProduto => _codProduto;

  set codProduto(VProdutoId value) {
    _codProduto = value;
  }

  int? get codInventario => _codInventario;

  set codInventario(int? value) {
    _codInventario = value;
  }

  double? get estAtual => _estAtual;

  set estAtual(double? value) {
    _estAtual = value;
  }

  double? get estLoja => _estLoja;

  set estLoja(double? value) {
    _estLoja = value;
  }

  String? get nomeProduto => _nomeProduto;
}

