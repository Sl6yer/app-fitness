import 'package:fitness_app/Widgets/MyBody_Stat.dart';
import 'package:fitness_app/Widgets/weight_history.dart';
import 'package:fitness_app/store/body_store.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BodyScreen extends StatelessWidget {
  BodyScreen({super.key});

  final bodyStore = BodyStore();
  final weightController = TextEditingController();
  final heightController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My Body',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Observer(
                builder: (_) {
                  return MybodyStat(
                    iconData: FontAwesomeIcons.weightScale,
                    title: 'Weight',
                    value: '${bodyStore.weight} Kg',
                  );
                },
              ),
              const SizedBox(height: 15),
              Observer(
                builder: (_) {
                  return MybodyStat(
                    iconData: FontAwesomeIcons.rulerVertical,
                    title: 'Height',
                    value: '${bodyStore.height} Cm',
                  );
                },
              ),
              const SizedBox(height: 15),
              Observer(
                builder: (_) {
                  return MybodyStat(
                    iconData: FontAwesomeIcons.person,
                    title: 'Body Mass Index',
                    value: '${bodyStore.bmi}',
                  );
                },
              ),
              const SizedBox(height: 20),
              Text(
                'Weight History',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
              ),
              const SizedBox(height: 20),
              WeightHistory(showBorder: true, showTiles: false, width: 230),
              const SizedBox(height: 20),
              Container(
                width: 260,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          title: Text(
                            'Edit Data',
                            style: TextStyle(
                              color: Color.fromRGBO(238, 101, 70, 1),
                            ),
                          ),
                          content: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Observer(
                                  builder: (_) {
                                    return TextField(
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.grey,
                                            width: 2,
                                          ),
                                        ),
                                        floatingLabelStyle: TextStyle(
                                          color: Colors.deepOrange,
                                        ),
                                        labelText: 'Weight',
                                        prefixIcon: Icon(
                                          Icons.fitness_center,
                                          color: Colors.deepOrange,
                                        ),
                                      ),
                                      keyboardType: TextInputType.number,
                                      controller: weightController,
                                    );
                                  },
                                ),
                                const SizedBox(height: 15),
                                TextField(
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.grey,
                                        width: 2,
                                      ),
                                    ),
                                    floatingLabelStyle: TextStyle(
                                      color: Colors.deepOrange,
                                    ),
                                    labelText: 'Height',
                                    prefixIcon: Icon(
                                      Icons.straighten,
                                      color: Colors.deepOrange,
                                    ),
                                  ),
                                  controller: heightController,
                                  keyboardType: TextInputType.number,
                                ),
                              ],
                            ),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.of(context).pop(),
                              child: Text(
                                'Cancel',
                                style: TextStyle(color: Colors.red),
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                final weight = weightController.text;
                                final height = heightController.text;

                                bodyStore.setWeight(weight);
                                bodyStore.setHeight(height);
                                bodyStore.setBmi(
                                  int.parse(weight),
                                  int.parse(height),
                                );
                                Navigator.of(context).pop();
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color.fromRGBO(
                                  238,
                                  101,
                                  70,
                                  1,
                                ),
                              ),
                              child: Text(
                                'Save',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Color.fromRGBO(254, 85, 48, 1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: Text('Edit', style: TextStyle(fontSize: 17)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
