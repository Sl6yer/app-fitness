import 'package:fitness_app/store/date_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:fitness_app/store/goals_store_singleton.dart';

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
            Observer(
              builder: (_) {
                return Text(
                  goalsStore.caloriesGoal.toString(),
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Gotham',
                    fontWeight: FontWeight.bold,
                  ),
                );
              },
            ),
            Text(
              'Calories',
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
            Observer(
              builder: (_) {
                return Text(
                  goalsStore.stepsGoal.toString(),
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Gotham',
                    fontWeight: FontWeight.bold,
                  ),
                );
              },
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
              '${goalsStore.waterGoal} ml',
              style: TextStyle(
                fontSize: 16,
                fontFamily: 'Gotham',
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Water',
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
