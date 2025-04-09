import 'package:inventarioapp/src/models/loja_fisica.dart';

import 'marca.dart';

class VProduto {
  int _codigo;
  LojaFisica _loja;
  String _nome;
  String? _alternati;
  String? _codigoDeBarrasPrincipal;
  String? _codigoDeBarrasSecundario;
  String? _codigoDeBarrasAlternativo;
  String? _original;
  double? _pcoRemar;
  double? _estAtual;
  String? _unidade;
  Marca? _marca;


  VProduto(this._codigo, this._loja, this._nome, this._alternati,
      this._codigoDeBarrasPrincipal, this._codigoDeBarrasSecundario,
      this._codigoDeBarrasAlternativo, this._original, this._pcoRemar,
      this._estAtual, this._unidade, this._marca);

  factory VProduto.fromJson(Map<String, dynamic> json) {
    return VProduto(
      json['codigo'] as int,
      LojaFisica.fromJson(json['loja']),
      json['nome'] as String,
      json['alternati'] as String,
      json['cbarra'] as String?,
      json['cbarra2'] as String?,
      json['cbarra3'] as String?,
      json['original'] as String?,
      json['pcoRemar'] as double,
      json['estAtual'] as double,
      json['unidade'] as String?,
      Marca.fromJson(json['marca']) as Marca?
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

  int get codigo => _codigo;

  LojaFisica get loja => _loja;

  String get nome => _nome;

  String? get alternati => _alternati;

  String? get codigoDeBarrasPrincipal => _codigoDeBarrasPrincipal;

  String? get codigoDeBarrasSecundario => _codigoDeBarrasSecundario;

  String? get codigoDeBarrasAlternativo => _codigoDeBarrasAlternativo;

  String? get original => _original;

  double? get pcoRemar => _pcoRemar;

  String? get pcoRemarFormatado => (_pcoRemar == null) ? "Sem preço" : _pcoRemar?.toStringAsFixed(2);

  double? get estAtual => _estAtual;

  Marca? get marca => _marca;

  String? get unidade => _unidade;


}
