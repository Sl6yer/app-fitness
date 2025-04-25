import 'package:fitness_app/Screens/home_screen.dart';
import 'package:fitness_app/Widgets/goals_profile.dart';
import 'package:fitness_app/store/goals_store.dart';
import 'package:fitness_app/store/goals_store_singleton.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class GoalsScreen extends StatelessWidget {
  GoalsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Goals',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 80),
            Text(
              'Definir Metas',
              style: TextStyle(
                fontSize: 25,
                fontFamily: 'Gotham',
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GoalsProfile(
                  title: 'Meta de \nCalorias',
                  iconData: FontAwesomeIcons.fire,
                  goalsStore: goalsStore,
                  onsetGoal: goalsStore.setCalories,
                ),
                GoalsProfile(
                  title: 'Meta de \nProteinas',
                  iconData: FontAwesomeIcons.drumstickBite,
                  goalsStore: goalsStore,
                  onsetGoal: goalsStore.setProtein,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GoalsProfile(
                  title: 'Meta de \nPassos',
                  iconData: FontAwesomeIcons.personWalking,
                  goalsStore: goalsStore,
                  onsetGoal: goalsStore.setSteps,
                ),
                GoalsProfile(
                  title: 'Meta de \nAgua',
                  iconData: FontAwesomeIcons.bottleWater,
                  goalsStore: goalsStore,
                  onsetGoal: goalsStore.setWater,
                ),
              ],
            ),
            const SizedBox(height: 30),
            Container(
              width: 315,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(
                    context,
                  ).push(MaterialPageRoute(builder: (context) => HomeScreen()));
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  backgroundColor: Color.fromRGBO(238, 101, 70, 1),
                ),
                child: Text(
                  'Salvar Metas',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
