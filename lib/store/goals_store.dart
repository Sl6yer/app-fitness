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
  int stepsCurrent = 1;

  @observable
  int caloriesCurrent = 1;

  @observable
  int waterCurrent = 1;

  @action
  void setSteps(int newGoal) {
    stepsGoal = newGoal;
    print(stepsGoal);
  }

  @observable
  int waterGoal = 0;

  @action
  void setWater(int newGoal) {
    waterGoal = newGoal;
    print(waterGoal);
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
