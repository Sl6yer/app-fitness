import 'package:flutter/material.dart';

class DadosWidget extends StatelessWidget {
  const DadosWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            Text(
              '7580',
              style: TextStyle(
                fontSize: 16,
                fontFamily: 'Gotham',
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Distance',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 13,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
        const SizedBox(width: 55),
        Column(
          children: [
            Text(
              '9832',
              style: TextStyle(
                fontSize: 16,
                fontFamily: 'Gotham',
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Steps',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 13,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
        const SizedBox(width: 55),
        Column(
          children: [
            Text(
              '1248',
              style: TextStyle(
                fontSize: 16,
                fontFamily: 'Gotham',
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Points',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 13,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
