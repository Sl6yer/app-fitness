import 'package:fitness_app/Screens/goals/steps_screen.dart';
import 'package:flutter/material.dart';
import 'package:fitness_app/store/goals/goals_store_singleton.dart';
import 'package:google_fonts/google_fonts.dart';

class GoalsInitial extends StatelessWidget {
  const GoalsInitial({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'What is your daily \ncalorie goal?',
              style: GoogleFonts.poppins(
                fontSize: 25,
                fontWeight: FontWeight.w500,
                color: const Color.fromARGB(255, 70, 69, 69),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            Container(
              width: 200,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  goalsStore.setCaloriesGoals1k();
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => StepsScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  backgroundColor: Color.fromRGBO(255, 111, 111, 1),
                ),
                child: Text('1000 Kcal', style: TextStyle(color: Colors.white)),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              width: 200,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  goalsStore.setCaloriesGoals18k();
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => StepsScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  backgroundColor: Color.fromRGBO(123, 229, 217, 1),
                ),
                child: Text('1800 Kcal', style: TextStyle(color: Colors.white)),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              width: 200,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  goalsStore.setCaloriesGoals22k();
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => StepsScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  backgroundColor: Color.fromRGBO(162, 72, 255, 1),
                ),
                child: Text('2200 Kcal', style: TextStyle(color: Colors.white)),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              width: 200,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  goalsStore.setCaloriesGoals25k();
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => StepsScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  backgroundColor: Color.fromRGBO(108, 216, 103, 1),
                ),
                child: Text('2500 Kcal', style: TextStyle(color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
