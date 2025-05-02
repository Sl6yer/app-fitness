import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ContainerInformation extends StatelessWidget {
  const ContainerInformation({
    super.key,
    required this.title,
    required this.iconData,
    required this.subText,
    required this.iconColor,
    required this.valor,
  });

  final String title;
  final IconData iconData;
  final Color iconColor;
  final String subText;
  final int valor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
      width: 160,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[400] ?? Colors.orange),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
                ),
                FaIcon(iconData, color: iconColor),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Observer(
                  builder: (_) {
                    return Text(
                      valor.toString(),
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    );
                  },
                ),
                Text(subText, style: TextStyle(color: Colors.grey)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
