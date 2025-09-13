import 'dart:ffi';

import 'package:inventarioapp/src/models/vproduto_id.dart';

class ItemInventario {
  int? _codInventario;
  VProdutoId _codProduto;
  double? _estLoja; // contagem feita no inventário
  double? _estLojaProd; // estoque real do produto (de VProduto)
  String? _nomeProduto;

  ItemInventario(
    this._codInventario,
    this._codProduto,
    this._estLoja,
    this._estLojaProd,
    [this._nomeProduto]
  );

  factory ItemInventario.fromJson(Map<String, dynamic> json) {
    return ItemInventario(
      json['codInventario'] as int?,
      VProdutoId.fromJson(json['codProduto']),
      (json['estLoja'] as num?)?.toDouble(),
      (json['estLojaProd'] as num?)?.toDouble(),
      json['nomeProduto'] as String?
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'codInventario': _codInventario,
      'codProduto': _codProduto.toJson(),
      'estLoja': _estLoja,
      'estLojaProd': _estLojaProd,
      'nomeProduto': _nomeProduto,
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

  // double? get estAtual => _estAtual;

  // set estAtual(double? value) {
  //   _estAtual = value;
  // }

  double? get estLoja => _estLoja;

  set estLoja(double? value) {
    _estLoja = value;
  }

  String? get nomeProduto => _nomeProduto;

  double? get estLojaProd => _estLojaProd;

  set estLojaProd(double? value) {
    _estLojaProd = value;
  }

}

