import 'package:fitness_app/Screens/goals/water_screen.dart';
import 'package:flutter/material.dart';
import 'package:fitness_app/store/goals/goals_store_singleton.dart';

class StepsScreen extends StatelessWidget {
  const StepsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'What is your daily \nsteps goal?',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                fontFamily: 'Gotham',
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            Container(
              width: 200,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  goalsStore.setStepsGoals4k();
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => WaterScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  backgroundColor: Color.fromRGBO(255, 125, 125, 1),
                ),
                child: Text('4k Steps', style: TextStyle(color: Colors.white)),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              width: 200,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  goalsStore.setStepsGoals6k();
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => WaterScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  backgroundColor: Color.fromRGBO(105, 224, 199, 1),
                ),
                child: Text('6k Steps', style: TextStyle(color: Colors.white)),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              width: 200,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  goalsStore.setStepsGoals8k();
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => WaterScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  backgroundColor: Color.fromRGBO(138, 36, 255, 1),
                ),
                child: Text('8k Steps', style: TextStyle(color: Colors.white)),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              width: 200,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  goalsStore.setStepsGoals10k();
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => WaterScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  backgroundColor: Color.fromRGBO(101, 207, 88, 1),
                ),
                child: Text('10k Steps', style: TextStyle(color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
