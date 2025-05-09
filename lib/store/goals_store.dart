import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'goals_store.g.dart';

class GoalsStore = _GoalsStoreBase with _$GoalsStore;

abstract class _GoalsStoreBase with Store {
  @observable
  int caloriesGoal = 0;

  @action
  void setCalories(int newGoal) {
    caloriesGoal = newGoal;
    print(caloriesGoal);
  }

  @observable
  int proteinGoal = 0;

  @action
  void setProtein(int newGoal) {
    proteinGoal = newGoal;
    print(proteinGoal);
  }

  @observable
  int stepsGoal = 1;

  @observable
  int stepsCurrent = 3000;

  @observable
  int caloriesCurrent = 0;

  @observable
  int proteinCurrent = 0;

  @observable
  int waterGlassCurrent = 0;

  @observable
  int selectedWaterGlass = 0;

  @observable
  int valorTotal = 0;

  @observable
  int valor7Dias = 0;

  @observable
  int mediaSemanal = 0;

  @action
  Future<void> somarCalorias() async {
    try {
      QuerySnapshot querySnapshot =
          await FirebaseFirestore.instance.collection('dados_diarios').get();

      int calorias = 0;

      for (var doc in querySnapshot.docs) {
        var caloriasValor = doc['calorias'];

        if (caloriasValor != null) {
          if (caloriasValor is num) {
            calorias += caloriasValor.toInt();
          } else {
            print('Valor de calorias não é numérico no documento: ${doc.id}');
          }
        } else {
          print('Campo "calorias" está nulo no documento: ${doc.id}');
        }
      }

      print('Total de calorias somadas: $calorias'); // Imprimir o total somado

      valorTotal = calorias;
    } catch (e) {
      print('Erro ao somar as calorias: $e');
    }
  }

  @action
  Future<void> last7Days() async {
    try {
      DateTime dataSetediasAtras = DateTime.now().subtract(Duration(days: 7));

      Timestamp timestampSeteDiasAtras = Timestamp.fromDate(dataSetediasAtras);

      QuerySnapshot querySnapshot =
          await FirebaseFirestore.instance
              .collection('dados_diarios')
              .where('data', isGreaterThanOrEqualTo: timestampSeteDiasAtras)
              .get();

      int calorias = 0;

      for (var doc in querySnapshot.docs) {
        var caloriasValor = doc['calorias'];

        if (caloriasValor != null) {
          if (caloriasValor is num) {
            calorias += caloriasValor.toInt();
          } else {
            print('Valor nao é numerico');
          }
        } else {
          print('Camo está nulo');
        }
      }

      print('Total de calorias nos últimos 7 dias: $calorias');

      valor7Dias = calorias;
    } catch (e) {
      print('Erro ao somar as calorias dos últimos 7 dias: $e');
    }
  }

  @action
  Future<void> setMediaSemanal() async {
    try {
      mediaSemanal = (valor7Dias / 7).toInt();
    } catch (e) {
      print('erro: $e');
    }

    return;
  }

  @action
  void setCaloriesCurrent(int newCalories) {
    caloriesCurrent = newCalories;
  }

  @action
  void setProteinCurrent(int newProtein) {
    proteinCurrent = newProtein;
  }

  @action
  void setSelectedWater(int selectedGlass) {
    selectedWaterGlass += selectedGlass;
  }

  @action
  void setWaterCurrent() {
    waterGlassCurrent = selectedWaterGlass;
    print(
      'Valor atual da agua: $waterGlassCurrent, Valor somado: $selectedWaterGlass',
    );
  }

  @observable
  String? textField;

  @action
  void setTextField(String value) {
    textField = value;
  }

  @observable
  int waterCurrent = 1;

  @action
  void setSteps(int newGoal) {
    stepsGoal = newGoal;
  }

  @observable
  int waterGoal = 0;

  @action
  void setWater(int newGoal) {
    waterGoal = newGoal;
  }

  @computed
  double get stepsProgress {
    if (stepsGoal <= 0) {
      return 0;
    }

    double progress = (stepsCurrent / stepsGoal) * 10;

    return progress.clamp(0, 10);
  }

  @computed
  double get caloriesProgress {
    if (caloriesGoal <= 0) {
      return 0;
    }

    double progress = (caloriesCurrent / caloriesGoal) * 10;

    return progress.clamp(0, 10);
  }

  @computed
  double get waterProgress {
    if (waterGoal <= 0) {
      return 0;
    }

    double progress = (waterCurrent / waterGoal) * 10;

    return progress.clamp(0, 10);
  }

  @action
  void setCaloriesGoals1k() {
    caloriesGoal = 1000;
  }

  @action
  void setCaloriesGoals18k() {
    caloriesGoal = 1800;
  }

  @action
  void setCaloriesGoals22k() {
    caloriesGoal = 2200;
  }

  @action
  void setCaloriesGoals25k() {
    caloriesGoal = 2500;
  }

  @action
  void setStepsGoals4k() {
    stepsGoal = 4000;
  }

  @action
  void setStepsGoals6k() {
    stepsGoal = 6000;
  }

  @action
  void setStepsGoals8k() {
    stepsGoal = 8000;
  }

  @action
  void setStepsGoals10k() {
    stepsGoal = 10000;
  }

  @action
  void setWaterGoals15() {
    waterGoal = 15;
  }

  @action
  void setWaterGoals2() {
    waterGoal = 2;
  }

  @action
  void setWaterGoals25() {
    waterGoal = 25;
  }

  @action
  void setWaterGoals3() {
    waterGoal = 3;
  }
}
