import 'package:fitness_app/Widgets/container_information.dart';
import 'package:fitness_app/Widgets/heart_information.dart';
import 'package:fitness_app/Widgets/water_information.dart';
import 'package:fitness_app/store/goals_store_singleton.dart';
import 'package:fitness_app/store/profile_store_singleton.dart';
import 'package:flutter/material.dart';
import 'package:fitness_app/Screens/home.dart';
import 'package:fitness_app/Widgets/Date_Navigator.dart';
import 'package:fitness_app/Widgets/dados_widget.dart';
import 'package:fitness_app/Widgets/topCurve_clipper.dart';
import 'package:fitness_app/store/bottom_nav_store.dart';
import 'package:fitness_app/store/date_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:intl/intl.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Home extends StatelessWidget {
  Home({super.key});

  final dateStore = DateStore();

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
            Text(
              'Today, ${DateFormat.MMMd().format(dateStore.selectedDate)}',
              style: TextStyle(color: Colors.grey, fontSize: 15),
            ),
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
            DateNavigator(store: dateStore),
            const SizedBox(height: 40),
            Observer(
              builder: (_) {
                return Text(
                  '${goalsStore.caloriesCurrent} kcal',
                  style: TextStyle(
                    fontSize: 35,
                    fontFamily: 'Gotham',
                    fontWeight: FontWeight.bold,
                  ),
                );
              },
            ),
            const SizedBox(height: 5),
            Text(
              'Total Kilocalories',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 40),
            DadosWidget(),
            const SizedBox(height: 30),
            SizedBox(
              height: 200,
              child: Observer(
                builder: (_) {
                  return BarChart(
                    BarChartData(
                      barGroups: [
                        BarChartGroupData(
                          x: 0,
                          barRods: [
                            BarChartRodData(
                              toY: goalsStore.caloriesProgress,
                              color: Colors.red,
                              width: 17,
                            ),
                          ],
                        ),
                        BarChartGroupData(
                          x: 1,
                          barRods: [
                            BarChartRodData(
                              toY: goalsStore.stepsProgress,
                              color: Colors.blue,
                              width: 17,
                            ),
                          ],
                        ),
                        BarChartGroupData(
                          x: 2,
                          barRods: [
                            BarChartRodData(
                              toY: goalsStore.waterProgress,
                              color: Colors.lightGreen,
                              width: 17,
                            ),
                          ],
                        ),
                      ],

                      // showing border and grid
                      borderData: FlBorderData(show: false),
                      gridData: FlGridData(show: false),

                      // showing the titles on the x-axis
                      titlesData: FlTitlesData(
                        leftTitles: AxisTitles(
                          sideTitles: SideTitles(showTitles: false),
                        ),
                        rightTitles: AxisTitles(
                          sideTitles: SideTitles(showTitles: false),
                        ),
                        topTitles: AxisTitles(
                          sideTitles: SideTitles(showTitles: false),
                        ),
                        bottomTitles: AxisTitles(
                          sideTitles: SideTitles(showTitles: false),
                        ),
                      ),

                      barTouchData: BarTouchData(
                        enabled: true,
                        touchTooltipData: BarTouchTooltipData(
                          getTooltipItem: (group, groupIndex, rod, rodIndex) {
                            double percentage = (rod.toY / 10) * 100;
                            return BarTooltipItem(
                              '${percentage.toStringAsFixed(0)}%',
                              const TextStyle(color: Colors.white),
                            );
                          },
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 60),
            Text(
              'Today\'s Information',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 17,
                fontFamily: 'Gotham',
              ),
            ),
            const SizedBox(height: 5),
            Text(
              'Today, ${DateFormat.MMMd().format(dateStore.selectedDate)}',
              style: TextStyle(color: Colors.grey, fontSize: 13),
            ),
            const SizedBox(height: 30),
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
                          valor: goalsStore.caloriesCurrent,
                          subText: 'Kcal',
                        ),
                        const SizedBox(height: 20),
                        ContainerInformation(
                          title: 'Steps',
                          iconData: FontAwesomeIcons.shoePrints,
                          iconColor: Color.fromRGBO(96, 80, 206, 1),
                          valor: 1240,
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
                  subText: 'Liters',
                  iconColor: Colors.blue,
                  valor: 3,
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
