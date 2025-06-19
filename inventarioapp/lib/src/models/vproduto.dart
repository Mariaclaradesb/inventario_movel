import 'package:inventarioapp/src/models/empresa.dart';
import 'package:inventarioapp/src/models/vproduto_id.dart';

import 'marca.dart';

class VProduto {
  VProdutoId _codigo;
  Empresa _loja;
  String _nome;
  String? _alternati;
  String? _codigoDeBarrasPrincipal;
  String? _codigoDeBarrasSecundario;
  String? _codigoDeBarrasAlternativo;
  String? _original;
  double? _pcoRemar;
  int? _estAtual;
  String? _unidade;
  Marca? _marca;


  VProduto(this._codigo, this._loja, this._nome, this._alternati,
      this._codigoDeBarrasPrincipal, this._codigoDeBarrasSecundario,
      this._codigoDeBarrasAlternativo, this._original, this._pcoRemar,
      this._estAtual, this._unidade, this._marca);

  VProduto.mock({
    required VProdutoId codigo,
    required Empresa loja,
    required String nome,
    double? preco,
    int? estoque,
    String? unidade,
    Marca? marca,
  })  : _codigo = codigo,
        _loja = loja,
        _nome = nome,
        _pcoRemar = preco,
        _estAtual = estoque,
        _unidade = unidade,
        _marca = marca,
        _alternati = null,
        _codigoDeBarrasPrincipal = null,
        _codigoDeBarrasSecundario = null,
        _codigoDeBarrasAlternativo = null,
        _original = null;

  factory VProduto.fromJson(Map<String, dynamic> json) {
    return VProduto(
      VProdutoId.fromJson(json['codigo']),
      Empresa.fromJson(json['loja']),
      json['nome'] as String,
      json['alternati'] as String?,
      json['cbarra'] as String?,
      json['cbarra2'] as String?,
      json['cbarra3'] as String?,
      json['original'] as String?,
      (json['pcoRemar'] as num?)?.toDouble(),
      json['estAtual'] as int?,
      json['unidade'] as String?,
      json['marca'] != null ? Marca.fromJson(json['marca']) : null,
    );
  }


  String? getPrincipalBarcode() {
    if (this._codigoDeBarrasPrincipal != null && _codigoDeBarrasPrincipal?.length == 13) {
      return _codigoDeBarrasPrincipal;
    }

    if (_codigoDeBarrasSecundario != null && _codigoDeBarrasSecundario?.length == 13) {
      return _codigoDeBarrasSecundario;
    }

    if (_codigoDeBarrasAlternativo != null && _codigoDeBarrasAlternativo?.length == 13) {
      return _codigoDeBarrasAlternativo;
    }

    return null;
  }

  VProdutoId get codigo => _codigo;

  Empresa get loja => _loja;

  String get nome => _nome;

  String? get alternati => _alternati;

  String? get codigoDeBarrasPrincipal => _codigoDeBarrasPrincipal;

  String? get codigoDeBarrasSecundario => _codigoDeBarrasSecundario;

  String? get codigoDeBarrasAlternativo => _codigoDeBarrasAlternativo;

  String? get original => _original;

  double? get pcoRemar => _pcoRemar;

  String? get pcoRemarFormatado => (_pcoRemar == null) ? "Sem preço" : _pcoRemar?.toStringAsFixed(2);

  int? get estAtual => _estAtual;

  Marca? get marca => _marca;

  String? get unidade => _unidade;

}
