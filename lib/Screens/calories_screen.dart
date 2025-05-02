import 'package:firebase_core/firebase_core.dart';
import 'package:fitness_app/Widgets/calories_history.dart';
import 'package:fitness_app/Widgets/consumption.dart';
import 'package:fitness_app/services/firebase_service.dart';
import 'package:flutter/material.dart';
import 'package:fitness_app/store/goals_store_singleton.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CaloriesScreen extends StatelessWidget {
  CaloriesScreen({super.key});

  final caloriesController = TextEditingController();
  final proteinController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                'Adicionar Consumo',
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 25),
              ),
              const SizedBox(height: 15),
              Observer(
                builder: (_) {
                  return Text(
                    goalsStore.caloriesCurrent.toString(),
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.w500),
                  );
                },
              ),
              Text('Kcal', style: TextStyle(color: Colors.grey[600])),
              CaloriesHistory(showBorder: false, showTiles: true, width: 280),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Calorias',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Observer(
                            builder: (_) {
                              return TextField(
                                controller: caloriesController,
                                decoration: InputDecoration(
                                  labelText: 'Ex: 500 kcal',
                                  labelStyle: TextStyle(
                                    color: Colors.grey[700],
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey),
                                  ),
                                ),
                                keyboardType: TextInputType.number,
                                onChanged: goalsStore.setTextField,
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Proteinas',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const SizedBox(height: 10),
                          TextField(
                            controller: proteinController,
                            decoration: InputDecoration(
                              labelText: 'Ex: 30 g',
                              labelStyle: TextStyle(color: Colors.grey[700]),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                              ),
                            ),
                            keyboardType: TextInputType.number,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Text(
                'Resumo de Consumo',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 17),
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Observer(
                    builder: (_) {
                      return Consumption(
                        iconData: FontAwesomeIcons.fire,
                        title: '${goalsStore.valor7Dias} kcal',
                        subTitle: 'Ultimos 7 dias',
                      );
                    },
                  ),
                  Observer(
                    builder: (_) {
                      return Consumption(
                        iconData: FontAwesomeIcons.calendarDay,
                        title: '${goalsStore.valorTotal} kcal',
                        subTitle: 'Total',
                      );
                    },
                  ),
                  Consumption(
                    iconData: FontAwesomeIcons.bolt,
                    title: '${goalsStore.mediaSemanal} kcal',
                    subTitle: 'Média diaria',
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Container(
                height: 90,
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: ElevatedButton(
                    onPressed: () async {
                      await goalsStore.somarCalorias();
                      await goalsStore.last7Days();
                      await goalsStore.setMediaSemanal();

                      final calories = caloriesController.text;
                      final protein = proteinController.text;

                      final caloriesInt = int.tryParse(calories) ?? 0;
                      final proteinInt = int.tryParse(protein) ?? 0;

                      goalsStore.setCaloriesCurrent(caloriesInt);
                      goalsStore.setProteinCurrent(proteinInt);

                      await FirebaseService.salvarOuAtualizarDados(
                        caloriesInt.toDouble(),
                        proteinInt.toDouble(),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromRGBO(254, 85, 48, 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(13),
                      ),
                    ),
                    child: Text(
                      'Salvar Consumo',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
