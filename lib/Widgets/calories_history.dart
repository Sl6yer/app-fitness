import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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

  Future<List<Map<String, dynamic>>> buscarUltimos7Dias() async {
    final agora = DateTime.now();
    final seteDiasAtras = agora.subtract(const Duration(days: 6));

    final snapshot =
        await FirebaseFirestore.instance
            .collection('dados_diarios')
            .where(
              'data',
              isGreaterThanOrEqualTo: Timestamp.fromDate(seteDiasAtras),
            )
            .orderBy('data')
            .get();

    // Mapa com as datas formatadas e calorias vindas do Firestore
    final dadosFirestore = {
      for (var doc in snapshot.docs)
        DateFormat('yyyy-MM-dd').format((doc['data'] as Timestamp).toDate()):
            (doc['calorias'] as num).toDouble(),
    };

    // Lista dos últimos 7 dias (mesmo que não tenham dado no Firebase)
    final List<Map<String, dynamic>> dadosCompletos = [];

    for (int i = 0; i < 7; i++) {
      final dia = seteDiasAtras.add(Duration(days: i));
      final chave = DateFormat('yyyy-MM-dd').format(dia);
      final calorias = dadosFirestore[chave] ?? 0.0;

      dadosCompletos.add({'data': dia, 'calorias': calorias});
    }

    return dadosCompletos;
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
        child: FutureBuilder<List<Map<String, dynamic>>>(
          future: buscarUltimos7Dias(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }

            if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(
                child: Text('Sem dados ainda. Adicione seus dados!'),
              );
            }

            final dados = snapshot.data!;
            final spots = <FlSpot>[];
            final labels = <String>[];

            for (int i = 0; i < dados.length; i++) {
              spots.add(FlSpot(i.toDouble(), dados[i]['calorias']));
              labels.add(DateFormat('dd/MM').format(dados[i]['data']));
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
                  getDrawingHorizontalLine:
                      (value) => FlLine(
                        color: const Color.fromARGB(255, 238, 101, 70),
                        strokeWidth: 1,
                      ),
                  getDrawingVerticalLine:
                      (value) => FlLine(
                        color: const Color.fromARGB(255, 238, 101, 70),
                        strokeWidth: 1,
                      ),
                ),
                titlesData: FlTitlesData(
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: showTiles,
                      reservedSize: 40,
                      getTitlesWidget: (value, meta) {
                        int index = value.toInt();
                        if (index >= 0 && index < labels.length) {
                          return Padding(
                            padding: const EdgeInsets.all(8),
                            child: Text(
                              labels[index],
                              style: TextStyle(
                                color: Colors.grey[600],
                                fontSize: 11,
                              ),
                            ),
                          );
                        }
                        return const SizedBox.shrink();
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
