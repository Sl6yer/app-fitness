import 'package:fitness_app/store/food/food_store.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FoodWidget extends StatelessWidget {
  const FoodWidget({
    super.key,
    required this.title,
    required this.iconData,
    required this.value,
  });

  final String title;
  final IconData iconData;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Color.fromRGBO(254, 86, 48, 1),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Icon(iconData, color: Colors.white, size: 25),
          ),
        ),
        Text(title, style: GoogleFonts.poppins(fontWeight: FontWeight.w500)),
        Text(value, style: GoogleFonts.poppins(color: Colors.grey)),
      ],
    );
  }
}
