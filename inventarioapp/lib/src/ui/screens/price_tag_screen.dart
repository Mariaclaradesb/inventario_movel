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
  Future<void> _printPriceTags(VProduto product, int quantity) async {
    if (quantity <= 0) return;

    try {
      await widget.priceTagService.printPriceTags(product, quantity);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Impressão enviada com sucesso!'),
            backgroundColor: Colors.green,
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Falha na impressão. Verifique a impressora (sem papel, offline, etc.).'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

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
              ElevatedButton(
                onPressed: () async {
                  final result = await openQuantityDialog();
                  if (result != null) {
                    int? quantity = int.tryParse(result);
                    if (quantity != null) {
                      await _printPriceTags(widget.product, quantity);
                    }
                  }
                },
                child: const Text('Imprimir etiqueta'),
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
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          backgroundColor: Color(0xFF006989),
          title: Row(
            children: [
              Icon(Icons.tag, color: Colors.white),
              SizedBox(width: 10),
              Text('Nº de Etiquetas', style: TextStyle(color: Colors.white)),
            ],
          ),
          content: TextField(
            controller: controller,
            autofocus: true,
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
              labelText: 'Digite a quantidade',
              labelStyle: TextStyle(color: Colors.white70),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white54)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white, width: 2)),
            ),
            keyboardType: TextInputType.number,
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('Cancelar', style: TextStyle(color: Colors.white70)),
            ),
            ElevatedButton(
                onPressed: () => Navigator.of(context).pop(controller.text),
                style: ElevatedButton.styleFrom(backgroundColor: Color(0xFF013A63)),
                child: Text('Imprimir', style: TextStyle(color: Colors.white)))
          ],
        );
      });
}