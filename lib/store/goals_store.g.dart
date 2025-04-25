// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'goals_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$GoalsStore on _GoalsStoreBase, Store {
  Computed<double>? _$stepsProgressComputed;

  @override
  double get stepsProgress =>
      (_$stepsProgressComputed ??= Computed<double>(() => super.stepsProgress,
              name: '_GoalsStoreBase.stepsProgress'))
          .value;
  Computed<double>? _$caloriesProgressComputed;

  @override
  double get caloriesProgress => (_$caloriesProgressComputed ??=
          Computed<double>(() => super.caloriesProgress,
              name: '_GoalsStoreBase.caloriesProgress'))
      .value;
  Computed<double>? _$waterProgressComputed;

  @override
  double get waterProgress =>
      (_$waterProgressComputed ??= Computed<double>(() => super.waterProgress,
              name: '_GoalsStoreBase.waterProgress'))
          .value;

  late final _$caloriesGoalAtom =
      Atom(name: '_GoalsStoreBase.caloriesGoal', context: context);

  @override
  int get caloriesGoal {
    _$caloriesGoalAtom.reportRead();
    return super.caloriesGoal;
  }

  @override
  set caloriesGoal(int value) {
    _$caloriesGoalAtom.reportWrite(value, super.caloriesGoal, () {
      super.caloriesGoal = value;
    });
  }

  late final _$proteinGoalAtom =
      Atom(name: '_GoalsStoreBase.proteinGoal', context: context);

  @override
  int get proteinGoal {
    _$proteinGoalAtom.reportRead();
    return super.proteinGoal;
  }

  @override
  set proteinGoal(int value) {
    _$proteinGoalAtom.reportWrite(value, super.proteinGoal, () {
      super.proteinGoal = value;
    });
  }

  late final _$stepsGoalAtom =
      Atom(name: '_GoalsStoreBase.stepsGoal', context: context);

  @override
  int get stepsGoal {
    _$stepsGoalAtom.reportRead();
    return super.stepsGoal;
  }

  @override
  set stepsGoal(int value) {
    _$stepsGoalAtom.reportWrite(value, super.stepsGoal, () {
      super.stepsGoal = value;
    });
  }

  late final _$stepsCurrentAtom =
      Atom(name: '_GoalsStoreBase.stepsCurrent', context: context);

  @override
  int get stepsCurrent {
    _$stepsCurrentAtom.reportRead();
    return super.stepsCurrent;
  }

  @override
  set stepsCurrent(int value) {
    _$stepsCurrentAtom.reportWrite(value, super.stepsCurrent, () {
      super.stepsCurrent = value;
    });
  }

  late final _$caloriesCurrentAtom =
      Atom(name: '_GoalsStoreBase.caloriesCurrent', context: context);

  @override
  int get caloriesCurrent {
    _$caloriesCurrentAtom.reportRead();
    return super.caloriesCurrent;
  }

  @override
  set caloriesCurrent(int value) {
    _$caloriesCurrentAtom.reportWrite(value, super.caloriesCurrent, () {
      super.caloriesCurrent = value;
    });
  }

  late final _$waterCurrentAtom =
      Atom(name: '_GoalsStoreBase.waterCurrent', context: context);

  @override
  int get waterCurrent {
    _$waterCurrentAtom.reportRead();
    return super.waterCurrent;
  }

  @override
  set waterCurrent(int value) {
    _$waterCurrentAtom.reportWrite(value, super.waterCurrent, () {
      super.waterCurrent = value;
    });
  }

  late final _$waterGoalAtom =
      Atom(name: '_GoalsStoreBase.waterGoal', context: context);

  @override
  int get waterGoal {
    _$waterGoalAtom.reportRead();
    return super.waterGoal;
  }

  @override
  set waterGoal(int value) {
    _$waterGoalAtom.reportWrite(value, super.waterGoal, () {
      super.waterGoal = value;
    });
  }

  late final _$_GoalsStoreBaseActionController =
      ActionController(name: '_GoalsStoreBase', context: context);

  @override
  void setCalories(int newGoal) {
    final _$actionInfo = _$_GoalsStoreBaseActionController.startAction(
        name: '_GoalsStoreBase.setCalories');
    try {
      return super.setCalories(newGoal);
    } finally {
      _$_GoalsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setProtein(int newGoal) {
    final _$actionInfo = _$_GoalsStoreBaseActionController.startAction(
        name: '_GoalsStoreBase.setProtein');
    try {
      return super.setProtein(newGoal);
    } finally {
      _$_GoalsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSteps(int newGoal) {
    final _$actionInfo = _$_GoalsStoreBaseActionController.startAction(
        name: '_GoalsStoreBase.setSteps');
    try {
      return super.setSteps(newGoal);
    } finally {
      _$_GoalsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setWater(int newGoal) {
    final _$actionInfo = _$_GoalsStoreBaseActionController.startAction(
        name: '_GoalsStoreBase.setWater');
    try {
      return super.setWater(newGoal);
    } finally {
      _$_GoalsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
caloriesGoal: ${caloriesGoal},
proteinGoal: ${proteinGoal},
stepsGoal: ${stepsGoal},
stepsCurrent: ${stepsCurrent},
caloriesCurrent: ${caloriesCurrent},
waterCurrent: ${waterCurrent},
waterGoal: ${waterGoal},
stepsProgress: ${stepsProgress},
caloriesProgress: ${caloriesProgress},
waterProgress: ${waterProgress}
    ''';
  }
}
