// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$FoodStore on _FoodStoreBase, Store {
  late final _$queryAtom = Atom(name: '_FoodStoreBase.query', context: context);

  @override
  String get query {
    _$queryAtom.reportRead();
    return super.query;
  }

  @override
  set query(String value) {
    _$queryAtom.reportWrite(value, super.query, () {
      super.query = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_FoodStoreBase.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$searchResultsAtom =
      Atom(name: '_FoodStoreBase.searchResults', context: context);

  @override
  ObservableList<Map<String, dynamic>> get searchResults {
    _$searchResultsAtom.reportRead();
    return super.searchResults;
  }

  @override
  set searchResults(ObservableList<Map<String, dynamic>> value) {
    _$searchResultsAtom.reportWrite(value, super.searchResults, () {
      super.searchResults = value;
    });
  }

  late final _$searchFoodAsyncAction =
      AsyncAction('_FoodStoreBase.searchFood', context: context);

  @override
  Future<void> searchFood() {
    return _$searchFoodAsyncAction.run(() => super.searchFood());
  }

  late final _$_FoodStoreBaseActionController =
      ActionController(name: '_FoodStoreBase', context: context);

  @override
  void setQuery(String value) {
    final _$actionInfo = _$_FoodStoreBaseActionController.startAction(
        name: '_FoodStoreBase.setQuery');
    try {
      return super.setQuery(value);
    } finally {
      _$_FoodStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
query: ${query},
isLoading: ${isLoading},
searchResults: ${searchResults}
    ''';
  }
}
