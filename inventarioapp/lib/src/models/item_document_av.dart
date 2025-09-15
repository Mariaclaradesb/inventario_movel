import 'package:inventarioapp/src/models/document_av_get.dart';
import 'package:inventarioapp/src/models/empresa.dart';
import 'package:inventarioapp/src/models/funcionario.dart';
import 'package:inventarioapp/src/models/vproduto.dart';

class ItemDocumentAv {
  int? _codProduto;
  FuncionarioData? _vendedor;
  Empresa? _loja;
  DocumentAvGet? _preVenda;
  VProduto? _vProduto;

  int? _quantidade;
  double? _unitario1;
  double? _unitario2;
  double? _nvTotal;
  double? _valorOriginal;
  DateTime? _data;
  String? _muUnidade;
  int? _menorUnidade;
  String? _codigoBarra;
  String? _descricao;
  String? _unidade;
  int? _davNumero;

  double? _pcoCompra;
  double? _cAquis;
  double? _pcoLiq;
  double? _pcoRemar;
  double? _pco02;
  double? _pco03;
  double? _pco04;
  double? _lucroBruto;
  double? _lucroReal;

  ItemDocumentAv({
    int? codProduto,
    FuncionarioData? vendedor,
    Empresa? loja,
    DocumentAvGet? preVenda,
    VProduto? vProduto,
    int? quantidade,
    double? unitario1,
    double? unitario2,
    double? nvTotal,
    double? valorOriginal,
    DateTime? data,
    String? muUnidade,
    int? menorUnidade,
    String? codigoBarra,
    String? descricao,
    String? unidade,
    int? davNumero,
    double? pcoCompra,
    double? cAquis,
    double? pcoLiq,
    double? pcoRemar,
    double? pco02,
    double? pco03,
    double? pco04,
    double? lucroBruto,
    double? lucroReal,
  })  : _codProduto = codProduto,
        _vendedor = vendedor,
        _loja = loja,
        _preVenda = preVenda,
        _vProduto = vProduto,
        _quantidade = quantidade,
        _unitario1 = unitario1,
        _unitario2 = unitario2,
        _nvTotal = nvTotal,
        _valorOriginal = valorOriginal,
        _data = data,
        _muUnidade = muUnidade,
        _menorUnidade = menorUnidade,
        _codigoBarra = codigoBarra,
        _descricao = descricao,
        _unidade = unidade,
        _davNumero = davNumero,
        _pcoCompra = pcoCompra,
        _cAquis = cAquis,
        _pcoLiq = pcoLiq,
        _pcoRemar = pcoRemar,
        _pco02 = pco02,
        _pco03 = pco03,
        _pco04 = pco04,
        _lucroBruto = lucroBruto,
        _lucroReal = lucroReal;

  factory ItemDocumentAv.fromJson(Map<String, dynamic> json) {
    return ItemDocumentAv(
      codProduto: json['produto'] != null ? json['produto']['codigo'] as int? : null,
      vendedor: json['vendedor'] != null
          ? FuncionarioData.fromJson(json['vendedor'])
          : null,
      loja: json['loja'] != null ? Empresa.fromJson(json['loja']) : null,
      preVenda: json['preVenda'] != null
          ? DocumentAvGet.fromJson(json['preVenda'])
          : null,
      quantidade: json['quantidade'] as int?,
      
      unitario1: (json['unitario1'] as num?)?.toDouble(),
      unitario2: (json['unitario2'] as num?)?.toDouble(),
      nvTotal: (json['nvTotal'] as num?)?.toDouble(),
      valorOriginal: (json['valorOriginal'] as num?)?.toDouble(),
      
      data: json['data'] != null ? DateTime.parse(json['data']) : null,

      muUnidade: json['muUnidade'] as String?,
      unidade: json['unidade'] as String?,

      menorUnidade: json['menorUnidade'] as int?,
      codigoBarra: json['codigoBarra'] as String?,
      descricao: json['descricao'] as String?,
      davNumero: json['davNumero'] as int?,
      pcoCompra: (json['pcoCompra'] as num?)?.toDouble(),
      cAquis: (json['cAquis'] as num?)?.toDouble(),
      pcoLiq: (json['pcoLiq'] as num?)?.toDouble(),
      pcoRemar: (json['pcoRemar'] as num?)?.toDouble(),
      pco02: (json['pco02'] as num?)?.toDouble(),
      pco03: (json['pco03'] as num?)?.toDouble(),
      pco04: (json['pco04'] as num?)?.toDouble(),
      lucroBruto: (json['lucroBruto'] as num?)?.toDouble(),
      lucroReal: (json['lucroReal'] as num?)?.toDouble(),
    );
  }

  // Getters e Setters atualizados
  int? get codProduto => _codProduto;
  set codProduto(int? value) => _codProduto = value;

  FuncionarioData? get vendedor => _vendedor;
  set vendedor(FuncionarioData? value) => _vendedor = value;

  Empresa? get loja => _loja;
  set loja(Empresa? value) => _loja = value;

  DocumentAvGet? get preVenda => _preVenda;
  set preVenda(DocumentAvGet? value) => _preVenda = value;

  VProduto? get vProduto => _vProduto;
  set vProduto(VProduto? value) => _vProduto = value;

  int? get quantidade => _quantidade;
  set quantidade(int? value) => _quantidade = value;

  double? get unitario1 => _unitario1;
  set unitario1(double? value) => _unitario1 = value;

  double? get unitario2 => _unitario2;
  set unitario2(double? value) => _unitario2 = value;

  double? get nvTotal => _nvTotal;
  set nvTotal(double? value) => _nvTotal = value;

  double? get valorOriginal => _valorOriginal;
  set valorOriginal(double? value) => _valorOriginal = value;

  DateTime? get data => _data;
  set data(DateTime? value) => _data = value;

  String? get muUnidade => _muUnidade;
  set muUnidade(String? value) => _muUnidade = value;

  int? get menorUnidade => _menorUnidade;
  set menorUnidade(int? value) => _menorUnidade = value;

  String? get codigoBarra => _codigoBarra;
  set codigoBarra(String? value) => _codigoBarra = value;

  String? get descricao => _descricao;
  set descricao(String? value) => _descricao = value;

  String? get unidade => _unidade;
  set unidade(String? value) => _unidade = value;

  int? get davNumero => _davNumero;
  set davNumero(int? value) => _davNumero = value;

  double? get pcoCompra => _pcoCompra;
  set pcoCompra(double? value) => _pcoCompra = value;

  double? get cAquis => _cAquis;
  set cAquis(double? value) => _cAquis = value;

  double? get pcoLiq => _pcoLiq;
  set pcoLiq(double? value) => _pcoLiq = value;

  double? get pcoRemar => _pcoRemar;
  set pcoRemar(double? value) => _pcoRemar = value;

  double? get pco02 => _pco02;
  set pco02(double? value) => _pco02 = value;

  double? get pco03 => _pco03;
  set pco03(double? value) => _pco03 = value;

  double? get pco04 => _pco04;
  set pco04(double? value) => _pco04 = value;

  double? get lucroBruto => _lucroBruto;
  set lucroBruto(double? value) => _lucroBruto = value;

  double? get lucroReal => _lucroReal;
  set lucroReal(double? value) => _lucroReal = value;

  // toJson não foi alterado pois já está correto
  Map<String, dynamic> toJson() {
    return {
      // ...
    };
  }
}