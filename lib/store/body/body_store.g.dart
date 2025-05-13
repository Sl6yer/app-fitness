// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'body_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$BodyStore on _BodyStoreBase, Store {
  late final _$weightAtom =
      Atom(name: '_BodyStoreBase.weight', context: context);

  @override
  int get weight {
    _$weightAtom.reportRead();
    return super.weight;
  }

  @override
  set weight(int value) {
    _$weightAtom.reportWrite(value, super.weight, () {
      super.weight = value;
    });
  }

  late final _$heightAtom =
      Atom(name: '_BodyStoreBase.height', context: context);

  @override
  int get height {
    _$heightAtom.reportRead();
    return super.height;
  }

  @override
  set height(int value) {
    _$heightAtom.reportWrite(value, super.height, () {
      super.height = value;
    });
  }

  late final _$bmiAtom = Atom(name: '_BodyStoreBase.bmi', context: context);

  @override
  int get bmi {
    _$bmiAtom.reportRead();
    return super.bmi;
  }

  @override
  set bmi(int value) {
    _$bmiAtom.reportWrite(value, super.bmi, () {
      super.bmi = value;
    });
  }

  late final _$_BodyStoreBaseActionController =
      ActionController(name: '_BodyStoreBase', context: context);

  @override
  void setWeight(String value) {
    final _$actionInfo = _$_BodyStoreBaseActionController.startAction(
        name: '_BodyStoreBase.setWeight');
    try {
      return super.setWeight(value);
    } finally {
      _$_BodyStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setHeight(String value) {
    final _$actionInfo = _$_BodyStoreBaseActionController.startAction(
        name: '_BodyStoreBase.setHeight');
    try {
      return super.setHeight(value);
    } finally {
      _$_BodyStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setBmi(int weightCalculator, int heightCalculator) {
    final _$actionInfo = _$_BodyStoreBaseActionController.startAction(
        name: '_BodyStoreBase.setBmi');
    try {
      return super.setBmi(weightCalculator, heightCalculator);
    } finally {
      _$_BodyStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
weight: ${weight},
height: ${height},
bmi: ${bmi}
    ''';
  }
}
