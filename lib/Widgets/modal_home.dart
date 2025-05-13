import 'package:fitness_app/Screens/others/calories_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class ModalHome extends StatelessWidget {
  const ModalHome({
    super.key,
    required this.iconData,
    required this.title,
    required this.iconColor,
    required this.ontap,
  });

  final IconData iconData;
  final String title;
  final Color iconColor;
  final VoidCallback? ontap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Row(
        children: [
          FaIcon(iconData, color: iconColor),
          const SizedBox(width: 10),
          Text(title, style: GoogleFonts.poppins(fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }
}
