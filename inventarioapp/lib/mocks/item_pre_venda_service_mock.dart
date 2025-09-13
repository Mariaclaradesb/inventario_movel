import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:inventarioapp/src/models/ItemPreVendaInsert.dart';
import 'package:inventarioapp/src/models/item_pre_venda.dart';
import 'package:inventarioapp/src/models/vproduto.dart';

class ItemPreVendaServiceMock {
  // Usamos um Mapa para guardar os itens de cada documento separadamente
  static final Map<int, List<ItemPreVenda>> _itemsByDocument = {};
  static bool _isInitialized = false;

  Future<void> _loadInitialData() async {
    if (_isInitialized) return;

    final String jsonString = await rootBundle.loadString('assets/mocks/documents_items.json');
    final Map<String, dynamic> jsonMap = json.decode(jsonString);

    jsonMap.forEach((key, value) {
      final int documentId = int.parse(key);
      final List<dynamic> itemsList = value;
      _itemsByDocument[documentId] = itemsList.map((item) => ItemPreVenda.fromJson(item)).toList();
    });
    _isInitialized = true;
  }

  // Busca os itens por código da venda
  Future<List<ItemPreVenda>> getByPreVenda(int codigoVenda) async {
    await _loadInitialData();
    await Future.delayed(const Duration(milliseconds: 600));

    // Retorna a lista de itens para o documento, ou uma lista vazia se não houver
    return _itemsByDocument[codigoVenda] ?? [];
  }

  Future<void> insert(int codigoVenda, ItemPreVendaInsert item, VProduto produto) async {
    await _loadInitialData();
    await Future.delayed(const Duration(milliseconds: 300));

    // Cria o objeto completo do item da pré-venda
    final novoItem = ItemPreVenda(
      codProduto: item.codProduto,
      descricaoProduto: produto.nome,
      quantidade: item.quantidade,
      valorUnitario: produto.pcoRemar ?? 0.0,
      valorTotal: (produto.pcoRemar ?? 0.0) * item.quantidade,
    );

    // Se não existir uma lista para este documento, crie uma
    if (!_itemsByDocument.containsKey(codigoVenda)) {
      _itemsByDocument[codigoVenda] = [];
    }

    // Adiciona o novo item à lista daquele documento
    _itemsByDocument[codigoVenda]!.add(novoItem);
  }
}