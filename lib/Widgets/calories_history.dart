import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class CaloriesHistory extends StatelessWidget {
  const CaloriesHistory({
    super.key,
    required this.showBorder,
    required this.showTiles,
    required this.width,
  });

  final bool showBorder;
  final bool showTiles;
  final int width;

  Future<List<FlSpot>> buscarSpots() async {
    final snapshot =
        await FirebaseFirestore.instance
            .collection('dados_diarios')
            .orderBy('data')
            .get();

    return snapshot.docs.map((doc) {
      final data = (doc['data'] as Timestamp).toDate();
      final calorias = (doc['calorias'] as num).toDouble();

      final diaSemana = (data.weekday - 1).toDouble();

      return FlSpot(diaSemana, calorias);
    }).toList();
  }

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
        child: FutureBuilder<List<FlSpot>>(
          future: buscarSpots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }

            if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(
                child: Text('Sem dados ainda. Adicione seus dados!'),
              );
            }

            final spots = snapshot.data!;

            if (spots.length == 1) {
              spots.add(FlSpot((spots.first.x + 1).clamp(0, 6), spots.first.y));
            }

            return LineChart(
              LineChartData(
                minX: 0,
                maxX: 6,
                minY: 0,
                maxY: 3000,

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
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  topTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  rightTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                ),
                borderData: FlBorderData(show: false),
                lineBarsData: [
                  LineChartBarData(
                    spots: spots,
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
            );
          },
        ),
      ),
    );
  }
}
