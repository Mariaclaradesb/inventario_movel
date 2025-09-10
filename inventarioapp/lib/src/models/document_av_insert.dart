
class DocumentAVInsert{
  int _codLoja;
  int _codVendedor;
  String _nomeCliente;

  DocumentAVInsert(this._codLoja, this._codVendedor, this._nomeCliente);

  factory DocumentAVInsert.fromJson(Map<String, dynamic> json){
    return DocumentAVInsert(
      json['codLoja'] as int,
      json['codVendedor'] as int,
      json['nomeCliente'] as String,
    );
  }

  Map<String, dynamic> toJson(){
    return {
      'codLoja': _codLoja,
      'codVendedor': _codVendedor,
      'nomeCliente': _nomeCliente
    };
  }

  String get nomeCliente => _nomeCliente;

  set nomeCliente(String value) {
    _nomeCliente = value;
  }

  int get codVendedor => _codVendedor;

  set codVendedor(int value) {
    _codVendedor = value;
  }

  int get codLoja => _codLoja;

  set codLoja(int value) {
    _codLoja = value;
  }
}