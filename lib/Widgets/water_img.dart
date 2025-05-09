import 'package:fitness_app/store/goals_store_singleton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_fonts/google_fonts.dart';

class WaterImg extends StatelessWidget {
  const WaterImg({
    super.key,
    required this.pathImg,
    required this.title,
    required this.onTap,
  });

  final String pathImg;
  final String title;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(height: 80, width: 80, child: Image.asset(pathImg)),
        const SizedBox(height: 10),
        Text(title, style: GoogleFonts.poppins(fontSize: 17)),
        const SizedBox(height: 10),
        GestureDetector(
          onTap: onTap,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Icon(Icons.add, color: Colors.white, size: 30),
          ),
        ),
      ],
    );
  }
}
