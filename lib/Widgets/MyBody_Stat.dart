import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MybodyStat extends StatelessWidget {
  const MybodyStat({
    super.key,
    required this.iconData,
    required this.title,
    required this.value,
  });

  final IconData iconData;
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 260,
      height: 60,
      decoration: BoxDecoration(
        border: Border.all(color: Color.fromRGBO(235, 235, 248, 1)),
        borderRadius: BorderRadius.circular(15),
        color: Color.fromRGBO(238, 101, 70, 1),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                FaIcon(iconData, color: Colors.white),
                const SizedBox(width: 10),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            Text(
              value,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
