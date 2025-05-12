// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_calories_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$DailyCaloriesStore on _DailyCaloriesStoreBase, Store {
  late final _$selectedDateAtom =
      Atom(name: '_DailyCaloriesStoreBase.selectedDate', context: context);

  @override
  DateTime get selectedDate {
    _$selectedDateAtom.reportRead();
    return super.selectedDate;
  }

  @override
  set selectedDate(DateTime value) {
    _$selectedDateAtom.reportWrite(value, super.selectedDate, () {
      super.selectedDate = value;
    });
  }

  late final _$dailyCaloriesAtom =
      Atom(name: '_DailyCaloriesStoreBase.dailyCalories', context: context);

  @override
  int get dailyCalories {
    _$dailyCaloriesAtom.reportRead();
    return super.dailyCalories;
  }

  @override
  set dailyCalories(int value) {
    _$dailyCaloriesAtom.reportWrite(value, super.dailyCalories, () {
      super.dailyCalories = value;
    });
  }

  late final _$dailyProteinsAtom =
      Atom(name: '_DailyCaloriesStoreBase.dailyProteins', context: context);

  @override
  int get dailyProteins {
    _$dailyProteinsAtom.reportRead();
    return super.dailyProteins;
  }

  @override
  set dailyProteins(int value) {
    _$dailyProteinsAtom.reportWrite(value, super.dailyProteins, () {
      super.dailyProteins = value;
    });
  }

  late final _$dailyWaterAtom =
      Atom(name: '_DailyCaloriesStoreBase.dailyWater', context: context);

  @override
  int get dailyWater {
    _$dailyWaterAtom.reportRead();
    return super.dailyWater;
  }

  @override
  set dailyWater(int value) {
    _$dailyWaterAtom.reportWrite(value, super.dailyWater, () {
      super.dailyWater = value;
    });
  }

  late final _$fetchDailyDataAsyncAction =
      AsyncAction('_DailyCaloriesStoreBase.fetchDailyData', context: context);

  @override
  Future<void> fetchDailyData() {
    return _$fetchDailyDataAsyncAction.run(() => super.fetchDailyData());
  }

  late final _$_DailyCaloriesStoreBaseActionController =
      ActionController(name: '_DailyCaloriesStoreBase', context: context);

  @override
  void setSelectedDate(DateTime date) {
    final _$actionInfo = _$_DailyCaloriesStoreBaseActionController.startAction(
        name: '_DailyCaloriesStoreBase.setSelectedDate');
    try {
      return super.setSelectedDate(date);
    } finally {
      _$_DailyCaloriesStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
selectedDate: ${selectedDate},
dailyCalories: ${dailyCalories},
dailyProteins: ${dailyProteins},
dailyWater: ${dailyWater}
    ''';
  }
}
