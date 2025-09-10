class ItemPreVenda {
  final int codProduto;
  final String descricaoProduto;
  final double quantidade;
  final double valorUnitario;
  final double valorTotal;

  ItemPreVenda({
    required this.codProduto,
    required this.descricaoProduto,
    required this.quantidade,
    required this.valorUnitario,
    required this.valorTotal,
  });

  factory ItemPreVenda.fromJson(Map<String, dynamic> json) {
    return ItemPreVenda(
      codProduto: json['codProduto'],
      descricaoProduto: json['descricaoProduto'],
      quantidade: (json['quantidade'] as num).toDouble(),
      valorUnitario: (json['valorUnitario'] as num).toDouble(),
      valorTotal: (json['valorTotal'] as num).toDouble(),
    );
  }
}