import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:inventarioapp/src/models/funcionario.dart';

class FuncionarioDataServiceMock {
  // O nome do método foi alterado para corresponder ao que a UI está chamando
  // e agora aceita o parâmetro 'filter'
  Future<List<FuncionarioData>> findAllFuncionarios([String filter = '']) async {
    await Future.delayed(const Duration(milliseconds: 500));

    final String jsonString = await rootBundle.loadString('assets/mocks/funcionarios.json');
    final List<dynamic> jsonList = json.decode(jsonString);
    List<FuncionarioData> allFuncionarios = jsonList.map((f) => FuncionarioData.fromJson(f)).toList();

    // Se o filtro estiver vazio, retorna todos.
    if (filter.isEmpty) {
      return allFuncionarios;
    }

    // Caso contrário, filtra a lista pelo nome
    final filterLowerCase = filter.toLowerCase();
    return allFuncionarios.where((funcionario) {
      final nome = funcionario.nome?.toLowerCase() ?? '';
      final apelido = funcionario.apelido?.toLowerCase() ?? '';
      return nome.contains(filterLowerCase) || apelido.contains(filterLowerCase);
    }).toList();
  }
}