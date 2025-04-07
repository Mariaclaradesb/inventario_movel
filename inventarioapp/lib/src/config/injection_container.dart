import 'package:get_it/get_it.dart';
import 'package:inventarioapp/src/services/price_tag/price_tag_printer.dart';
import 'package:inventarioapp/src/services/price_tag/price_tag_service.dart';

final locator = GetIt.instance;

void setup() {
  locator.registerSingleton<PriceTagPrinter>(PriceTagPrinter());
  locator.registerSingleton<PriceTagService>(PriceTagService(
      locator<PriceTagPrinter>()
  ));
}