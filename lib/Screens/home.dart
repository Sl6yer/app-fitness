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
                      CircleAvatar(
                        radius: 50,
                        backgroundColor: Colors.white,
                        child: Image.asset('assets/image.png'),
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
            Text(
              '1 883 Kcal',
              style: TextStyle(
                fontSize: 35,
                fontFamily: 'Gotham',
                fontWeight: FontWeight.bold,
              ),
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
              child: BarChart(
                BarChartData(
                  barGroups: [
                    BarChartGroupData(
                      x: 0,
                      barRods: [
                        BarChartRodData(toY: 8, color: Colors.red, width: 17),
                      ],
                    ),
                    BarChartGroupData(
                      x: 1,
                      barRods: [
                        BarChartRodData(toY: 6, color: Colors.blue, width: 17),
                      ],
                    ),
                    BarChartGroupData(
                      x: 2,
                      barRods: [
                        BarChartRodData(
                          toY: 7,
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
                        double percentage = (rod.toY / 10) * 100; // 20 é o maxY
                        return BarTooltipItem(
                          '${percentage.toStringAsFixed(0)}%', // Ex: 75%
                          const TextStyle(color: Colors.white),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 60),
          ],
        ),
      ),
    );
  }
}
