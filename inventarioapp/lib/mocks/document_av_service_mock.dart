import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:inventarioapp/src/models/document_av_get.dart';
import 'package:inventarioapp/src/models/empresa.dart';
import 'package:inventarioapp/src/models/funcionario.dart';
import 'package:inventarioapp/src/models/sequencia_dav.dart';

class DocumentAVDataServiceMock {
  // A lista que guardará o "estado" dos nossos documentos em memória.
  static final List<DocumentAvGet> _documents = [];
  static bool _isInitialized = false;

  // Carrega os dados iniciais do arquivo JSON, mas apenas uma vez.
  Future<void> _loadInitialData() async {
    if (_isInitialized) return;

    final String jsonString = await rootBundle.loadString('assets/mocks/documents.json');
    final List<dynamic> jsonList = json.decode(jsonString);
    _documents.addAll(jsonList.map((item) => DocumentAvGet.fromJson(item)));
    _isInitialized = true;
  }

  Future<List<DocumentAvGet>> findAll() async {
    await _loadInitialData();
    await Future.delayed(const Duration(milliseconds: 800));
    return _documents;
  }

  Future<DocumentAvGet> create(FuncionarioData vendedor, String nomeCliente) async {
    await _loadInitialData();
    await Future.delayed(const Duration(milliseconds: 500));

    final newDocument = DocumentAvGet(
      codigoVenda: 1000 + _documents.length + 1, // Gera um novo código
      loja: Empresa(1, "LOJA MATRIZ"),
      emissao: DateTime.now(),
      hora: "${DateTime.now().hour}:${DateTime.now().minute.toString().padLeft(2, '0')}",
      nomeCli: nomeCliente,
      vendedor: vendedor,
      totalVenda: 0.0,
      valorProd: 0.0,
      nomeUsuario: nomeCliente,
      sequencia: Sequencia(sequencia: 123),
    );

    // Adiciona o novo documento à lista em memória (salvando o estado)
    _documents.add(newDocument);

    // O backend geralmente retorna o objeto criado, então fazemos o mesmo.
    return newDocument;
  }

// Você pode adicionar seu método showMenuAddDocumentAV aqui ou mantê-lo separado
// Se mantiver separado, lembre-se de que ele deve chamar o método `create` deste mock.
}