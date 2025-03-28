import 'package:sunmi_printer_plus/core/enums/enums.dart';
import 'package:sunmi_printer_plus/core/styles/sunmi_text_style.dart';
import 'package:sunmi_printer_plus/core/sunmi/sunmi_printer.dart';

class SunmiPrinterService {

  // print text passed as parameter
  Future<void> printText(String text) async {
    await SunmiPrinter.lineWrap(1); // creates one line space
    await SunmiPrinter.printText(
      text,
      style: SunmiTextStyle(
        fontSize: 24,
        bold: true,
        align: SunmiPrintAlign.CENTER,
      ),
    );
    await SunmiPrinter.lineWrap(1); // creates one line space
  }

  // print one structure
  Future<void> printReceipt() async {
    for (int i = 0; i < 5; i++) {
      await printText("TESTE FINAL");
    }
  }

}
