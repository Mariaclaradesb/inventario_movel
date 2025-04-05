class VProduto {
  int _codigo;
  int _codLojaCadastro;
  String _nome;
  String? _alternati;
  String? _codigoDeBarrasPrincipal;
  String? _codigoDeBarrasSecundario;
  String? _codigoDeBarrasAlternativo;
  String? _original;
  double? _pcoRemar;
  int? _qt;


  VProduto(this._codigo, this._codLojaCadastro, this._nome, this._alternati,
      this._codigoDeBarrasPrincipal, this._codigoDeBarrasSecundario,
      this._codigoDeBarrasAlternativo, this._original, this._pcoRemar,
      this._qt);

  factory VProduto.fromJson(Map<String, dynamic> json) {
    return VProduto(
      json['codigo'] as int,
      json['codlojacadastro'] as int,
      json['nome'] as String,
      json['alternati'] as String,
      json['cbarra'] as String?,
      json['cbarra2'] as String?,
      json['cbarra3'] as String?,
      json['original'] as String?,
      json['pcoRemar'] as double,
      json['qt'] as int,
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

  int get codLojaCadastro => _codLojaCadastro;

  String get nome => _nome;

  String? get alternati => _alternati;

  String? get codigoDeBarrasPrincipal => _codigoDeBarrasPrincipal;

  String? get codigoDeBarrasSecundario => _codigoDeBarrasSecundario;

  String? get codigoDeBarrasAlternativo => _codigoDeBarrasAlternativo;

  String? get original => _original;

  double? get pcoRemar => _pcoRemar;

  int? get qt => _qt;

}
