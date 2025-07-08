import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:share_plus/share_plus.dart';
import 'package:sunmi_printer_plus/core/enums/enums.dart';
import 'package:sunmi_printer_plus/core/styles/sunmi_barcode_style.dart';
import 'package:sunmi_printer_plus/core/styles/sunmi_text_style.dart';
import 'package:sunmi_printer_plus/core/sunmi/sunmi_printer.dart';



String gerarRelatorioTexto(List<Map<String, dynamic>> dados, int codLoja, int codInventario) {
  final buffer = StringBuffer();

  buffer.writeln("RELATÓRIO DE DIVERGÊNCIAS");
  buffer.writeln("Inventário Nº: $codInventario | Nome: ${dados.isNotEmpty ? dados[0]['nomeInventario'] : 'N/A'}");
  buffer.writeln("Loja Nº: $codLoja");
  buffer.writeln("--------------------------------");

  for (var item in dados) {
    final nome = item['nomeProduto'] ?? '';
    final cod = item['codProduto']['codigo'] ?? '';
    final cbarra = item['cbarra'] ?? '';
    final contado = item['estLoja']?.toString() ?? '0.00';
    final sistema = item['estLojaProd']?.toString() ?? '0.00';
    final dif = item['divergencia'] ?? 0;
    final sinal = dif >= 0 ? '+' : '';

    buffer.writeln("Produto: $nome");
    buffer.writeln("Código: $cod | CBarra: $cbarra");
    buffer.writeln("Contado: $contado | Sist.: $sistema");
    buffer.writeln("Diferença: $sinal$dif");
    buffer.writeln("--------------------------------");
  }

  buffer.writeln("Gerado em: ${DateTime.now()}");
  return buffer.toString();
}


Future<void> imprimirRelatorioNaMaquininha(List<Map<String, dynamic>> dados, int codLoja, int codInventario) async {
  try {
    final conteudo = gerarRelatorioTexto(dados, codLoja, codInventario);

    for (var linha in conteudo.split('\n')) {
      await SunmiPrinter.printText(
        linha,
        style: SunmiTextStyle(
          fontSize: 20,
          align: SunmiPrintAlign.LEFT,
        ),
      );
    }

    await SunmiPrinter.lineWrap(3);

  } catch (e) {
    print('Erro ao imprimir na Sunmi: $e');
  }
}

Future<void> gerarRelatorioPDF(
  BuildContext context,
  List<Map<String, dynamic>> dados,
  int codLoja,
  int codInventario,
) async {
  try {
    final pdf = pw.Document();
    final font = await PdfGoogleFonts.robotoMonoRegular();

    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.roll80,
        build: (context) => pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            pw.Text("Relatório de Divergências", style: pw.TextStyle(fontSize: 10)),
            pw.Text("Inventário Nº: $codInventario | Nome: ${dados.isNotEmpty ? dados[0]['nomeInventario'] : 'N/A'}", style: pw.TextStyle(fontSize: 10)),
            pw.Text("Loja Nº: $codLoja", style: pw.TextStyle(fontSize: 10)),
            pw.Divider(thickness: 1, height: 4),
            ...dados.map((item) {
              final cod = item['codProduto']['codigo'] ?? '';
              final cbarra = item['cbarra'];
              final nome = item['nomeProduto'] ?? '';
              final contado = item['estLoja']?.toString() ?? '0.00';
              final sistema = item['estLojaProd']?.toString() ?? '0.00';
              final dif = item['divergencia'] ?? 0;
              final sinal = dif >= 0 ? '+' : '';
              return pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Text('Produto: $nome', style: pw.TextStyle(fontSize: 9)),
                  pw.Text('Código: $cod | CBarra: $cbarra', style: pw.TextStyle(fontSize: 9)),
                  pw.Text('Contado: $contado | Sistema: $sistema', style: pw.TextStyle(fontSize: 9)),
                  pw.Text('Diferença: $sinal$dif', style: pw.TextStyle(fontSize: 9, fontWeight: pw.FontWeight.bold)),
                  pw.Divider(thickness: 1, height: 4),
                ],
              );
            }),
            pw.SizedBox(height: 10),
            pw.Text("Gerado em: ${DateTime.now()}", style: pw.TextStyle(fontSize: 8)),
          ],
        ),
      ),
    );

    final dir = await getApplicationDocumentsDirectory();
    final filePath = '${dir.path}/relatorio_inventario_$codInventario.pdf';
    final file = File(filePath);
    await file.writeAsBytes(await pdf.save());

    showModalBottomSheet(
      context: context,
      builder: (_) => Padding(
        padding: const EdgeInsets.all(16),
        child: Wrap(
          children: [
            ListTile(
              leading: const Icon(Icons.print),
              title: const Text('Imprimir em impressora normal'),
              onTap: () async {
                Navigator.pop(context);
                await Printing.layoutPdf(onLayout: (_) => pdf.save());
              },
            ),
            ListTile(
              leading: const Icon(Icons.print),
              title: const Text('Imprimir na maquininha'),
              onTap: () async {
                Navigator.pop(context);
                await imprimirRelatorioNaMaquininha(dados, codLoja, codInventario);
              },
            ),
            ListTile(
              leading: const Icon(Icons.share),
              title: const Text('Compartilhar PDF'),
              onTap: () async {
                Navigator.pop(context);
                await Share.shareXFiles([XFile(file.path)], text: 'Relatório de divergência do inventário $codInventario');
              },
            ),
            ListTile(
              leading: const Icon(Icons.remove_red_eye),
              title: const Text('Visualizar PDF'),
              onTap: () {
                Navigator.pop(context);
                Printing.layoutPdf(onLayout: (_) => pdf.save());
              },
            ),
          ],
        ),
      ),
    );
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Erro ao gerar relatório: $e')),
    );
  }
}
