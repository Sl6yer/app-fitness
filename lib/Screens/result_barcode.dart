import 'package:fitness_app/Screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class ResultBarcode extends StatelessWidget {
  const ResultBarcode({
    super.key,
    required this.productName,
    required this.barcode,
  });

  final String productName;
  final String barcode;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Result Barcode')),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(productName),
            Text(barcode),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (_) => HomeScreen()),
                );
              },
              child: Text('Back to home'),
            ),
          ],
        ),
      ),
    );
  }
}
