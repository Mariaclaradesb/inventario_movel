import 'package:inventarioapp/src/models/vproduto.dart';
import 'package:inventarioapp/src/services/price_tag/price_tag_printer.dart';

class PriceTagService {
  PriceTagPrinter _priceTagPrinter;

  PriceTagService(this._priceTagPrinter);

  Future<void> printPriceTags(VProduto product, int quantityToPrint) async {
    _priceTagPrinter.printPriceTags(product, quantityToPrint);
  }

}