import 'package:fitness_app/Screens/barcode/barcode_scanner_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:fitness_app/store/barcode/barcode_store_singleton.dart';
import 'package:google_fonts/google_fonts.dart';

class LogsScreen extends StatelessWidget {
  const LogsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Observer(
        builder: (_) {
          if (barCodeStore.logs.isEmpty) {
            return Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(254, 86, 48, 1),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(Icons.block, size: 80, color: Colors.white),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    'Your list is empty',
                    style: GoogleFonts.poppins(fontSize: 25),
                  ),
                  Text(
                    'Start by adding something',
                    style: TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(height: 15),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => BarcodeScannerScreen(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromRGBO(254, 86, 48, 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(
                      'Add a Product',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            );
          }
          return ListView.builder(
            reverse: true,
            itemBuilder: (context, index) {
              final log = barCodeStore.logs[index];
              return Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 50,
                  vertical: 20,
                ),
                decoration: BoxDecoration(
                  color: Color.fromRGBO(228, 225, 225, 0.3),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(254, 86, 48, 1),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Icon(
                                Icons.qr_code_scanner,
                                color: Colors.white,
                                size: 35,
                              ),
                            ),
                          ),
                          Text(
                            log.dateTime,
                            style: GoogleFonts.poppins(
                              fontSize: 15,
                              color: const Color.fromARGB(255, 102, 101, 101),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),
                      Text(
                        log.productName,
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 15),
                      Text(
                        'Calories: ${log.calories} g \nCarboidratos: ${log.carbs} g \nProteina: ${log.protein}',
                        style: GoogleFonts.poppins(),
                      ),
                    ],
                  ),
                ),
              );
            },
            itemCount: barCodeStore.logs.length,
          );
        },
      ),
    );
  }
}
