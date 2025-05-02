import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Consumption extends StatelessWidget {
  const Consumption({
    super.key,
    required this.iconData,
    required this.title,
    required this.subTitle,
  });

  final IconData iconData;
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FaIcon(iconData, color: Color.fromRGBO(254, 85, 48, 1), size: 28),
        const SizedBox(height: 4),
        Text(
          title,
          style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
        ),
        Text(subTitle, style: TextStyle(color: Colors.grey[700])),
      ],
    );
  }
}
