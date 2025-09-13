import 'dart:io';

import 'package:flutter/material.dart';
import 'package:inventarioapp/src/models/document_av_get.dart';
import 'package:inventarioapp/src/models/item_pre_venda.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:share_plus/share_plus.dart';
import 'package:sunmi_printer_plus/core/enums/enums.dart';
import 'package:sunmi_printer_plus/core/styles/sunmi_text_style.dart';
import 'package:sunmi_printer_plus/core/sunmi/sunmi_printer.dart';

/// Gera uma string de texto plano formatada para o relatório do DAV.
String gerarRelatorioDavTexto(
    DocumentAvGet document, List<ItemPreVenda> items) {
  final buffer = StringBuffer();

  buffer.writeln("Documento Auxiliar de Venda");
  buffer.writeln(
      "DAV Nº: ${document.codigoVenda} | Emissão: ${document.emissao?.toLocal().toString().split(' ').first ?? ''}");
  buffer.writeln("Loja: ${document.loja?.nome ?? 'N/A'}");
  buffer.writeln("Vendedor: ${document.vendedor?.nome ?? 'N/A'}");
  buffer.writeln("Cliente: ${document.nomeCli ?? 'N/A'}");
  buffer.writeln("--------------------------------");
  buffer.writeln("Itens:");

  for (var item in items) {
    buffer.writeln(item.descricaoProduto);
    buffer.writeln(
        'Qtd: ${item.quantidade} x R\$ ${item.valorUnitario.toStringAsFixed(2)} = R\$ ${item.valorTotal.toStringAsFixed(2)}');
    buffer.writeln("--------------------------------");
  }

  buffer.writeln(
      "Valor Total: R\$ ${document.totalVenda?.toStringAsFixed(2) ?? '0.00'}");
  buffer.writeln("Gerado em: ${DateTime.now()}");
  return buffer.toString();
}

/// Imprime o relatório do DAV na maquininha Sunmi.
Future<void> imprimirDavNaMaquininha(
    DocumentAvGet document, List<ItemPreVenda> items) async {
  final conteudo = gerarRelatorioDavTexto(document, items);

  // Divide o conteúdo em linhas e imprime uma por uma
  for (var linha in conteudo.split('\n')) {
    await SunmiPrinter.printText(
      linha,
      style: SunmiTextStyle(
        fontSize: 20,
        bold: true, // Tamanho de fonte ajustado para caber
        align: SunmiPrintAlign.LEFT,
      ),
    );
  }
  // Adiciona espaço no final e corta o papel
  await SunmiPrinter.lineWrap(3);
  await SunmiPrinter.cutPaper();
}

/// Exibe as opções de relatório (PDF, Impressão, etc.).
Future<void> gerarRelatorioDavPdf(
  BuildContext context,
  DocumentAvGet document,
  List<ItemPreVenda> items,
) async {
  try {
    final pdf = pw.Document();

    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.roll80,
        build: (context) => pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            pw.Text("Documento Auxiliar de Venda",
                style: pw.TextStyle(fontSize: 10)),
            pw.Text(
                "DAV Nº: ${document.codigoVenda} | Emissão: ${document.emissao?.toLocal().toString().split(' ').first ?? ''}",
                style: pw.TextStyle(fontSize: 10)),
            pw.Text("Loja: ${document.loja?.nome ?? 'N/A'}",
                style: pw.TextStyle(fontSize: 10)),
            pw.Text("Vendedor: ${document.vendedor?.nome ?? 'N/A'}",
                style: pw.TextStyle(fontSize: 10)),
            pw.Text("Cliente: ${document.nomeCli ?? 'N/A'}",
                style: pw.TextStyle(fontSize: 10)),
            pw.Divider(thickness: 1, height: 4),
            pw.Text("Itens:",
                style:
                    pw.TextStyle(fontSize: 9, fontWeight: pw.FontWeight.bold)),
            pw.SizedBox(height: 5),
            ...items.map((item) {
              return pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Text(item.descricaoProduto,
                      style: pw.TextStyle(fontSize: 9)),
                  pw.Text(
                      'Qtd: ${item.quantidade} | Vlr. Unit.: R\$ ${item.valorUnitario.toStringAsFixed(2)} | Total: R\$ ${item.valorTotal.toStringAsFixed(2)}',
                      style: pw.TextStyle(fontSize: 9)),
                  pw.Divider(thickness: 1, height: 4),
                ],
              );
            }),
            pw.SizedBox(height: 10),
            pw.Text(
                "Valor Total: R\$ ${document.totalVenda?.toStringAsFixed(2) ?? '0.00'}",
                style:
                    pw.TextStyle(fontSize: 10, fontWeight: pw.FontWeight.bold)),
            pw.SizedBox(height: 10),
            pw.Text("Gerado em: ${DateTime.now()}",
                style: pw.TextStyle(fontSize: 8)),
          ],
        ),
      ),
    );

    final dir = await getApplicationDocumentsDirectory();
    final filePath = '${dir.path}/dav_report_${document.codigoVenda}.pdf';
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
              title: const Text('Imprimir em impressora A4'),
              onTap: () async {
                Navigator.pop(context);
                await Printing.layoutPdf(onLayout: (_) => pdf.save());
              },
            ),
            // --- NOVA OPÇÃO ADICIONADA ---
            ListTile(
              leading: const Icon(Icons.receipt_long),
              title: const Text('Imprimir na maquininha'),
              onTap: () async {
                Navigator.pop(context);
                await imprimirDavNaMaquininha(document, items);
              },
            ),
            ListTile(
              leading: const Icon(Icons.share),
              title: const Text('Compartilhar PDF'),
              onTap: () async {
                Navigator.pop(context);
                await Share.shareXFiles([XFile(file.path)],
                    text: 'Relatório do DAV Nº ${document.codigoVenda}');
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
    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text(
                'Erro ao gerar/imprimir relatório: ${e.toString().replaceAll("Exception: ", "")}')),
      );
    }
  }
}