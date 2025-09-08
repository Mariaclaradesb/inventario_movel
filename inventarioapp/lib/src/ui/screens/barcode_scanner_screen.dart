import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class BarcodeScannerScreen extends StatefulWidget {
  @override
  _BarcodeScannerScreenState createState() => _BarcodeScannerScreenState();
}

class _BarcodeScannerScreenState extends State<BarcodeScannerScreen> {
  bool isScanned = false;
  bool isTorchOn = false;
  MobileScannerController cameraController = MobileScannerController();

  void toggleTorch() {
    cameraController.toggleTorch();
    setState(() {
      isTorchOn = !isTorchOn;
    });
  }

  void onBarcodeDetected(BarcodeCapture barcodeCapture) {
    if (!isScanned) {
      isScanned = true;
      final barcode = barcodeCapture.barcodes.first.rawValue;
      if (barcode != null) {
        debugPrint("Código escaneado: $barcode");

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Código: $barcode")),
        );

        Future.delayed(Duration(milliseconds: 500), () {
          Navigator.pop(context, barcode);
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Leia o código de barras do produto!")),
      body: Stack(
        children: [
          MobileScanner(
            controller: cameraController,
            onDetect: onBarcodeDetected,
          ),
          Positioned(
            bottom: 20,
            right: 20,
            child: FloatingActionButton(
              onPressed: toggleTorch,
              child: Icon(isTorchOn ? Icons.flashlight_off : Icons.flashlight_on),
            ),
          ),
        ],
      ),
    );
  }
}
