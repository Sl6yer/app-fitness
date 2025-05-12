// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'barcode_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$BarCodeStore on _BarCodeStoreBase, Store {
  late final _$logsAtom =
      Atom(name: '_BarCodeStoreBase.logs', context: context);

  @override
  ObservableList<NutritionLog> get logs {
    _$logsAtom.reportRead();
    return super.logs;
  }

  @override
  set logs(ObservableList<NutritionLog> value) {
    _$logsAtom.reportWrite(value, super.logs, () {
      super.logs = value;
    });
  }

  late final _$isScanningAtom =
      Atom(name: '_BarCodeStoreBase.isScanning', context: context);

  @override
  bool get isScanning {
    _$isScanningAtom.reportRead();
    return super.isScanning;
  }

  @override
  set isScanning(bool value) {
    _$isScanningAtom.reportWrite(value, super.isScanning, () {
      super.isScanning = value;
    });
  }

  late final _$scannedCodeAtom =
      Atom(name: '_BarCodeStoreBase.scannedCode', context: context);

  @override
  String get scannedCode {
    _$scannedCodeAtom.reportRead();
    return super.scannedCode;
  }

  @override
  set scannedCode(String value) {
    _$scannedCodeAtom.reportWrite(value, super.scannedCode, () {
      super.scannedCode = value;
    });
  }

  late final _$productNameAtom =
      Atom(name: '_BarCodeStoreBase.productName', context: context);

  @override
  String get productName {
    _$productNameAtom.reportRead();
    return super.productName;
  }

  @override
  set productName(String value) {
    _$productNameAtom.reportWrite(value, super.productName, () {
      super.productName = value;
    });
  }

  late final _$proteinAtom =
      Atom(name: '_BarCodeStoreBase.protein', context: context);

  @override
  int get protein {
    _$proteinAtom.reportRead();
    return super.protein;
  }

  @override
  set protein(int value) {
    _$proteinAtom.reportWrite(value, super.protein, () {
      super.protein = value;
    });
  }

  late final _$carbsAtom =
      Atom(name: '_BarCodeStoreBase.carbs', context: context);

  @override
  int get carbs {
    _$carbsAtom.reportRead();
    return super.carbs;
  }

  @override
  set carbs(int value) {
    _$carbsAtom.reportWrite(value, super.carbs, () {
      super.carbs = value;
    });
  }

  late final _$caloriesAtom =
      Atom(name: '_BarCodeStoreBase.calories', context: context);

  @override
  int get calories {
    _$caloriesAtom.reportRead();
    return super.calories;
  }

  @override
  set calories(int value) {
    _$caloriesAtom.reportWrite(value, super.calories, () {
      super.calories = value;
    });
  }

  late final _$_BarCodeStoreBaseActionController =
      ActionController(name: '_BarCodeStoreBase', context: context);

  @override
  void startScanning() {
    final _$actionInfo = _$_BarCodeStoreBaseActionController.startAction(
        name: '_BarCodeStoreBase.startScanning');
    try {
      return super.startScanning();
    } finally {
      _$_BarCodeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void stopScanning() {
    final _$actionInfo = _$_BarCodeStoreBaseActionController.startAction(
        name: '_BarCodeStoreBase.stopScanning');
    try {
      return super.stopScanning();
    } finally {
      _$_BarCodeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setScannedCode(String code) {
    final _$actionInfo = _$_BarCodeStoreBaseActionController.startAction(
        name: '_BarCodeStoreBase.setScannedCode');
    try {
      return super.setScannedCode(code);
    } finally {
      _$_BarCodeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setProductName(String newproductName) {
    final _$actionInfo = _$_BarCodeStoreBaseActionController.startAction(
        name: '_BarCodeStoreBase.setProductName');
    try {
      return super.setProductName(newproductName);
    } finally {
      _$_BarCodeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setProtein(int newProtein) {
    final _$actionInfo = _$_BarCodeStoreBaseActionController.startAction(
        name: '_BarCodeStoreBase.setProtein');
    try {
      return super.setProtein(newProtein);
    } finally {
      _$_BarCodeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCarbs(int newCarbs) {
    final _$actionInfo = _$_BarCodeStoreBaseActionController.startAction(
        name: '_BarCodeStoreBase.setCarbs');
    try {
      return super.setCarbs(newCarbs);
    } finally {
      _$_BarCodeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCalories(int newCalories) {
    final _$actionInfo = _$_BarCodeStoreBaseActionController.startAction(
        name: '_BarCodeStoreBase.setCalories');
    try {
      return super.setCalories(newCalories);
    } finally {
      _$_BarCodeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void logProduct() {
    final _$actionInfo = _$_BarCodeStoreBaseActionController.startAction(
        name: '_BarCodeStoreBase.logProduct');
    try {
      return super.logProduct();
    } finally {
      _$_BarCodeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
logs: ${logs},
isScanning: ${isScanning},
scannedCode: ${scannedCode},
productName: ${productName},
protein: ${protein},
carbs: ${carbs},
calories: ${calories}
    ''';
  }
}
