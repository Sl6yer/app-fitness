import 'package:mobx/mobx.dart';
part 'date_store.g.dart';

class DateStore = _DateStoreBase with _$DateStore;

abstract class _DateStoreBase with Store {
  @observable
  DateTime selectedDate = DateTime.now();

  @action
  void nextDay() {
    selectedDate = selectedDate.add(const Duration(days: 1));
  }

  @action
  void previousDay() {
    selectedDate = selectedDate.subtract(const Duration(days: 1));
  }

  @action
  void setDate(DateTime date) {
    selectedDate = date;
  }
}
