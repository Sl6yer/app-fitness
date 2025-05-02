import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class WeightHistory extends StatelessWidget {
  const WeightHistory({
    super.key,
    required this.showBorder,
    required this.showTiles,
    required this.width,
  });

  final bool showBorder;
  final bool showTiles;
  final int width;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border:
            showBorder
                ? Border.all(color: Colors.grey.withOpacity(0.4), width: 1.5)
                : null,
        borderRadius: BorderRadius.circular(20),
      ),
      child: SizedBox(
        height: 150,
        width: width.toDouble(),
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
                  showTitles: showTiles,
                  reservedSize: 50,
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
                    return Padding(
                      padding: const EdgeInsets.all(16),
                      child: Text(
                        days[value.toInt()],
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                    );
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
