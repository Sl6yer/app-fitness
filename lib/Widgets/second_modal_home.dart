import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SecondModalHome extends StatelessWidget {
  const SecondModalHome({
    super.key,
    required this.title,
    required this.iconData,
    required this.bgContainerColor,
    required this.ontap,
  });

  final String title;
  final IconData iconData;
  final Color bgContainerColor;
  final VoidCallback? ontap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: ontap,
        child: Card(
          elevation: 0,
          color: Color.fromRGBO(228, 225, 225, 0.3),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 25),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: bgContainerColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FaIcon(iconData, color: Colors.white, size: 20),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  title,
                  style: GoogleFonts.poppins(fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
