import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ModalHome extends StatelessWidget {
  const ModalHome({
    super.key,
    required this.iconData,
    required this.title,
    required this.subTitle,
    required this.iconSize,
  });

  final IconData iconData;
  final String title;
  final String subTitle;
  final int iconSize;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          FaIcon(
            iconData,
            color: Color.fromRGBO(254, 85, 48, 1),
            size: iconSize.toDouble(),
          ),
          const SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),

              Text(subTitle, style: TextStyle(color: Colors.grey[600])),
            ],
          ),
        ],
      ),
    );
  }
}
