import 'package:fitness_app/Widgets/container_information.dart';
import 'package:fitness_app/Widgets/heart_information.dart';
import 'package:fitness_app/Widgets/water_information.dart';
import 'package:fitness_app/store/firebase/daily_calories_store.dart';
import 'package:fitness_app/store/goals_store_singleton.dart';
import 'package:fitness_app/store/profile_store_singleton.dart';
import 'package:flutter/material.dart';
import 'package:fitness_app/Screens/home.dart';
import 'package:fitness_app/Widgets/Date_Navigator.dart';

import 'package:fitness_app/Widgets/topCurve_clipper.dart';
import 'package:fitness_app/store/bottom_nav_store.dart';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:intl/intl.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Home extends StatelessWidget {
  Home({super.key});

  final DailyCaloriesStore dailyCaloriesStore = DailyCaloriesStore();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ClipPath(
              clipper: TopcurveClipper(),
              child: Container(
                height: 200,
                width: double.infinity,
                color: Color.fromARGB(255, 255, 222, 228),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Observer(
                        builder: (_) {
                          return Image.asset(
                            'assets/image${profileStore.id}.png',
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Text('Today,', style: TextStyle(color: Colors.grey, fontSize: 15)),
            const SizedBox(height: 10),
            Text(
              'Your Activies',
              style: TextStyle(
                fontSize: 27,
                fontFamily: 'Gotham',
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 30),
            DateNavigator(store: dailyCaloriesStore),
            const SizedBox(height: 40),
            Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        ContainerInformation(
                          title: 'Calories',
                          iconData: FontAwesomeIcons.droplet,
                          iconColor: Color.fromRGBO(254, 85, 48, 1),
                          store: dailyCaloriesStore,
                          subText: 'Kcal',
                        ),
                        const SizedBox(height: 20),
                        ContainerInformation(
                          title: 'Steps',
                          iconData: FontAwesomeIcons.shoePrints,
                          iconColor: Color.fromRGBO(96, 80, 206, 1),
                          store: dailyCaloriesStore,
                          subText: 'Steps',
                        ),
                      ],
                    ),
                    const SizedBox(width: 20),
                    HeartInformation(),
                  ],
                ),
                const SizedBox(height: 20),
                WaterInformation(
                  title: 'Water',
                  iconData: FontAwesomeIcons.glassWater,
                  subText: 'Glass',
                  iconColor: Colors.blue,
                  store: dailyCaloriesStore,
                ),
              ],
            ),
            const SizedBox(height: 60),
          ],
        ),
      ),
    );
  }
}
