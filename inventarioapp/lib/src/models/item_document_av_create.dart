class ItemDocumentAvCreate {
  int _codProduto;
  int _codVendedor;
  int _codLoja;

  ItemDocumentAvCreate({
    required int codProduto,
    required int codVendedor,
    required int codLoja,
  })  : _codProduto = codProduto,
        _codVendedor = codVendedor,
        _codLoja = codLoja;

  /// Factory para criar a partir de JSON
  factory ItemDocumentAvCreate.fromJson(Map<String, dynamic> json) {
    return ItemDocumentAvCreate(
      codProduto: json['codProduto'] as int,
      codVendedor: json['codVendedor'] as int,
      codLoja: json['codLoja'] as int,
    );
  }

  /// Converter para JSON
  Map<String, dynamic> toJson() {
    return {
      'codProduto': _codProduto,
      'codVendedor': _codVendedor,
      'codLoja': _codLoja,
    };
  }

  // Getters e Setters
  int get codProduto => _codProduto;
  set codProduto(int value) => _codProduto = value;

  int get codVendedor => _codVendedor;
  set codVendedor(int value) => _codVendedor = value;

  int get codLoja => _codLoja;
  set codLoja(int value) => _codLoja = value;
}
