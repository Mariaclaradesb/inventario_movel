class VProdutoId {
  int _codigo;
  int _codLoja;

  VProdutoId(this._codigo, this._codLoja);

  int get codLoja => _codLoja;

  int get codigo => _codigo;

  factory VProdutoId.fromJson(Map<String, dynamic> json) {
    return VProdutoId(
        json['codigo'] as int,
        json['codLoja'] as int,
    );
  }
}