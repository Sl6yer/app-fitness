import 'package:fitness_app/Screens/goals/water_screen.dart';
import 'package:flutter/material.dart';
import 'package:fitness_app/store/goals/goals_store_singleton.dart';
import 'package:google_fonts/google_fonts.dart';

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
                  goalsStore.setStepsGoals4k();
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => WaterScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  backgroundColor: Color.fromRGBO(255, 111, 111, 1),
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
                  backgroundColor: Color.fromRGBO(123, 229, 217, 1),
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
                  backgroundColor: Color.fromRGBO(162, 72, 255, 1),
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
                  backgroundColor: Color.fromRGBO(108, 216, 103, 1),
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
