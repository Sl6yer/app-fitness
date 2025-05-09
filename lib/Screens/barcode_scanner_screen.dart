import 'dart:convert';

import 'package:fitness_app/Screens/result_barcode.dart';
import 'package:fitness_app/store/barcode_store.dart';
import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:http/http.dart' as http;
import 'package:fitness_app/store/barcode_store_singleton.dart';

class BarcodeScannerScreen extends StatelessWidget {
  BarcodeScannerScreen({super.key});

  final MobileScannerController controller = MobileScannerController();

  Future<Map<String, dynamic>?> buscarAlimento(
    String codigoBarras,
    BuildContext context,
  ) async {
    final url = Uri.parse(
      'https://world.openfoodfacts.org/api/v0/product/$codigoBarras.json',
    );

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      if (data['status'] == 1) {
        return data['product'];
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.red,
            content: Text(
              'product not found',
              style: TextStyle(color: Colors.white),
            ),
            duration: Duration(seconds: 5),
          ),
        );
        Navigator.pop(context);
      }
    } else {
      print('Erro ao buscar o produto');
    }

    return null;
  }

  void _handleBarcode(BuildContext context, code) async {
    if (barCodeStore.isScanning) return;

    barCodeStore.startScanning();
    controller.stop();

    final product = await buscarAlimento(code, context);
    if (product != null) {
      final productName = product['product_name'] ?? 'No name';
      final nutriments = product['nutriments'];

      final kcal = (nutriments['energy-kcal_100g'] ?? 0).toDouble().toInt();
      final protein = (nutriments['proteins_100g'] ?? 0).toDouble().toInt();
      final carbs = (nutriments['carbohydrates_100g'] ?? 0).toDouble().toInt();

      barCodeStore.setScannedCode(code);
      barCodeStore.setProductName(productName);
      barCodeStore.setCalories(kcal);
      barCodeStore.setProtein(protein);
      barCodeStore.setCarbs(carbs);

      barCodeStore.logProduct();

      Navigator.pop(context, code);
    }

    barCodeStore.stopScanning();
    controller.start();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('BarCode Scanner'), centerTitle: true),
      body: Stack(
        children: [
          MobileScanner(
            controller: controller,
            onDetect: (capture) {
              final code = capture.barcodes.first.rawValue;
              if (code != null) {
                _handleBarcode(context, code);
              }
            },
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              margin: EdgeInsets.only(top: 20),
              child: Text(
                'Aponte para o codigo de barras',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
