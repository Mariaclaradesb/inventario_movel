class ItemDocumentAvCreate {
  int _codProduto;
  int _codVendedor;
  int _codLoja;
  int _quantidade; 

  ItemDocumentAvCreate({
    required int codProduto,
    required int codVendedor,
    required int codLoja,
    required int quantidade,
  })  : _codProduto = codProduto,
        _codVendedor = codVendedor,
        _codLoja = codLoja,
        _quantidade = quantidade;

  factory ItemDocumentAvCreate.fromJson(Map<String, dynamic> json) {
    return ItemDocumentAvCreate(
      codProduto: json['codProduto'] as int,
      codVendedor: json['codVendedor'] as int,
      codLoja: json['codLoja'] as int,
      quantidade: json['quantidade'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'codProduto': _codProduto,
      'codVendedor': _codVendedor,
      'codLoja': _codLoja,
      'quantidade': _quantidade,
    };
  }

  // Getters e Setters
  int get codProduto => _codProduto;git
  set codProduto(int value) => _codProduto = value;

  int get codVendedor => _codVendedor;
  set codVendedor(int value) => _codVendedor = value;

  int get codLoja => _codLoja;
  set codLoja(int value) => _codLoja = value;

  int get quantidade => _quantidade;
  set quantidade(int value) => _quantidade = value;
}