// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'date_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$DateStore on _DateStoreBase, Store {
  late final _$selectedDateAtom =
      Atom(name: '_DateStoreBase.selectedDate', context: context);

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

  late final _$dateProfileAtom =
      Atom(name: '_DateStoreBase.dateProfile', context: context);

  @override
  String get dateProfile {
    _$dateProfileAtom.reportRead();
    return super.dateProfile;
  }

  @override
  set dateProfile(String value) {
    _$dateProfileAtom.reportWrite(value, super.dateProfile, () {
      super.dateProfile = value;
    });
  }

  late final _$_DateStoreBaseActionController =
      ActionController(name: '_DateStoreBase', context: context);

  @override
  void updateData() {
    final _$actionInfo = _$_DateStoreBaseActionController.startAction(
        name: '_DateStoreBase.updateData');
    try {
      return super.updateData();
    } finally {
      _$_DateStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void nextDay() {
    final _$actionInfo = _$_DateStoreBaseActionController.startAction(
        name: '_DateStoreBase.nextDay');
    try {
      return super.nextDay();
    } finally {
      _$_DateStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void previousDay() {
    final _$actionInfo = _$_DateStoreBaseActionController.startAction(
        name: '_DateStoreBase.previousDay');
    try {
      return super.previousDay();
    } finally {
      _$_DateStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDate(DateTime date) {
    final _$actionInfo = _$_DateStoreBaseActionController.startAction(
        name: '_DateStoreBase.setDate');
    try {
      return super.setDate(date);
    } finally {
      _$_DateStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
selectedDate: ${selectedDate},
dateProfile: ${dateProfile}
    ''';
  }
}
