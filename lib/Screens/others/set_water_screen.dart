import 'package:fitness_app/Widgets/water_img.dart';
import 'package:fitness_app/services/firebase_service.dart';
import 'package:fitness_app/store/firebase/daily_calories_store.dart';
import 'package:fitness_app/store/goals/goals_store_singleton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_fonts/google_fonts.dart';

class SetWaterScreen extends StatelessWidget {
  const SetWaterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              Text(
                'Track your water intake.',
                style: GoogleFonts.poppins(fontSize: 25),
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 16,
                  horizontal: 80,
                ),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  children: [
                    Text(
                      'Total Volume',
                      style: GoogleFonts.poppins(fontSize: 17),
                    ),
                    Observer(
                      builder: (_) {
                        return Text(
                          '${goalsStore.selectedWaterGlass} Glass',
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w700,
                            color: Colors.blue,
                            fontSize: 30,
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Your daily goal: ${goalsStore.waterGoal} glass',
                style: GoogleFonts.poppins(fontWeight: FontWeight.w500),
              ),
            ],
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    WaterImg(
                      pathImg: 'assets/water1.png',
                      title: '1 Glass',
                      onTap: () {
                        goalsStore.setSelectedWater(1);
                      },
                    ),
                    WaterImg(
                      pathImg: 'assets/water2.png',
                      title: '2 Glass',
                      onTap: () {
                        goalsStore.setSelectedWater(2);
                      },
                    ),
                    WaterImg(
                      pathImg: 'assets/water3.png',
                      title: '3 Glass',
                      onTap: () {
                        goalsStore.setSelectedWater(3);
                      },
                    ),
                    WaterImg(
                      pathImg: 'assets/water4.png',
                      title: '4 Glass',
                      onTap: () {
                        goalsStore.setSelectedWater(4);
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 42,
                ),
                child: Container(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () async {
                      if (goalsStore.selectedWaterGlass == 0) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'Please select a water glass',
                              style: TextStyle(color: Colors.white),
                            ),
                            backgroundColor: Colors.red,
                          ),
                        );
                      } else {
                        goalsStore.setWaterCurrent();
                        await FirebaseService.salvarOuAtualizarDados(
                          goalsStore.caloriesCurrent.toDouble(),
                          goalsStore.proteinCurrent.toDouble(),
                          goalsStore.waterGlassCurrent.toDouble(),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'Water goal saved successfully',
                              style: TextStyle(color: Colors.white),
                            ),
                            backgroundColor: Colors.blue,
                          ),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: Text(
                      'Save',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
