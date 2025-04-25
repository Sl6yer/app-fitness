import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class WeightHistory extends StatelessWidget {
  const WeightHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.withOpacity(0.4), width: 1.5),
        borderRadius: BorderRadius.circular(20),
      ),
      child: SizedBox(
        height: 150,
        width: 230,
        child: LineChart(
          LineChartData(
            minX: 0,
            maxX: 6,
            minY: 40,
            maxY: 80,

            gridData: FlGridData(
              show: false,
              drawVerticalLine: true,
              getDrawingHorizontalLine: (value) {
                return FlLine(
                  color: const Color.fromARGB(255, 238, 101, 70),
                  strokeWidth: 1,
                );
              },
              getDrawingVerticalLine: (value) {
                return FlLine(
                  color: const Color.fromARGB(255, 238, 101, 70),
                  strokeWidth: 1,
                );
              },
            ),

            titlesData: FlTitlesData(
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: false,
                  reservedSize: 30,
                  getTitlesWidget: (value, meta) {
                    final days = [
                      'Mon',
                      'Tue',
                      'Wed',
                      'Thu',
                      'Fri',
                      'Sat',
                      'Sun',
                    ];
                    return Text(days[value.toInt()]);
                  },
                ),
              ),
              leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
              topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
              rightTitles: AxisTitles(
                sideTitles: SideTitles(showTitles: false),
              ),
            ),
            borderData: FlBorderData(show: false),
            lineBarsData: [
              LineChartBarData(
                spots: [
                  FlSpot(0, 40),
                  FlSpot(1, 50.2),
                  FlSpot(2, 49.5),
                  FlSpot(3, 56),
                  FlSpot(4, 57.5),
                  FlSpot(5, 59),
                  FlSpot(6, 74.8),
                ],
                isCurved: true,
                color: Colors.orange,
                barWidth: 4,
                dotData: FlDotData(show: false),
                belowBarData: BarAreaData(
                  show: true,
                  color: Colors.orange.withOpacity(0.1),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
