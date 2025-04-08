import 'package:flutter/material.dart';
import 'package:inventarioapp/src/models/vproduto.dart';
import 'package:inventarioapp/src/services/price_tag/price_tag_service.dart';

class PriceTagScreen extends StatefulWidget {
  @override
  _PriceTagScreenState createState() => _PriceTagScreenState();
  final VProduto product;
  final PriceTagService priceTagService;

  PriceTagScreen({required this.product, required this.priceTagService});
}

class _PriceTagScreenState extends State<PriceTagScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Impressão de Etiquetas")),
      body: Container(
        alignment: Alignment.center,
        child:
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: () => print("teste"),
                child: Text('Enviar para tabela de etiquetas'),
              ),
              ElevatedButton(onPressed: () async {
                int quantity = int.parse(await openQuantityDialog() ?? "0");

                _printPriceTags(this.widget.product, quantity);
              },
                child: Text('Imprimir etiqueta'),
              ),
            ],
          ),
      ),
    );
  }

  Future<String?> openQuantityDialog() => showDialog<String>(
    context: context,
    builder: (BuildContext context) {
      TextEditingController controller = TextEditingController();
      return AlertDialog(
        title: Text('Quantidade de etiquetas'),
        content: TextField(
          controller: controller,
          autofocus: true,
          decoration: InputDecoration(hintText: 'Digite a quantidade de etiquetas'),
          keyboardType: TextInputType.number,
        ),
        actions: [
          TextButton(onPressed: () => Navigator.of(context).pop(controller.text), child: Text('Imprimir'))
        ],
      );
    }
  );

  void _printPriceTags(VProduto product, int quantity) {
    this.widget.priceTagService.printPriceTags(product, quantity);
  }

}