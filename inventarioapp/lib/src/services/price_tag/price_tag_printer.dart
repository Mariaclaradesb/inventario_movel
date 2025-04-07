import 'package:inventarioapp/src/models/vproduto.dart';
import 'package:sunmi_printer_plus/core/enums/enums.dart';
import 'package:sunmi_printer_plus/core/styles/sunmi_barcode_style.dart';
import 'package:sunmi_printer_plus/core/styles/sunmi_text_style.dart';
import 'package:sunmi_printer_plus/core/sunmi/sunmi_printer.dart';

class PriceTagPrinter {
  // print text passed as parameter
  Future<void> _printProductName(VProduto product) async {
    await SunmiPrinter.lineWrap(1); // creates one line space
    await SunmiPrinter.printText(
      product.nome,
      style: SunmiTextStyle(
        fontSize: 30,
        bold: true,
        align: SunmiPrintAlign.LEFT,
      ),
    );
    await SunmiPrinter.lineWrap(1); // creates one line space
  }

  Future<void> _printPriceAndCode(VProduto product) async {
    String? formattedPrice = product.pcoRemar
        ?.toStringAsFixed(2)
        .replaceFirst('.', ',');
    String price = "R\$ ${formattedPrice}";
    String code = "COD. ${product.codigo}";

    String spaces = " " * (27 - price.length - code.length);

    await SunmiPrinter.printText(
      price + spaces + code,
      style: SunmiTextStyle(
        fontSize: 28,
        bold: true,
        align: SunmiPrintAlign.LEFT,
      ),
    );
  }

  Future<void> _printBarcode(VProduto product) async {
    String? barcode = product.getPrincipalBarcode();

    if (barcode == null) {
      await SunmiPrinter.printText("Código de barras inválido!");
      return;
    }

    await SunmiPrinter.printBarCode(
      barcode,
      style: SunmiBarcodeStyle(
        size: 3,
        type: SunmiBarcodeType.JAN13,
        height: 80,
        textPos: SunmiBarcodeTextPos.NO_TEXT,
        align: SunmiPrintAlign.CENTER,
      ),
    );

    await SunmiPrinter.printText(
      barcode,
      style: SunmiTextStyle(
        fontSize: 30,
        bold: true,
        align: SunmiPrintAlign.CENTER,
      ),
    );
  }

  Future<void> printPriceTags(VProduto product, int quantityToPrint) async {
    for (int i = 0; i < quantityToPrint; i++) {
      await _printOnePriceTag(product);
    }
  }

  Future<void> _printOnePriceTag(VProduto product) async {
    await _printProductName(product);
    await _printPriceAndCode(product);
    await _printBarcode(product);

    await SunmiPrinter.cutPaper();
    await SunmiPrinter.lineWrap(2);
  }
}
