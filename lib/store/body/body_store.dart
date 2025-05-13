import 'package:mobx/mobx.dart';
part 'body_store.g.dart';

class BodyStore = _BodyStoreBase with _$BodyStore;

abstract class _BodyStoreBase with Store {
  @observable
  int weight = 0;

  @observable
  int height = 0;

  @observable
  int bmi = 0;

  @action
  void setWeight(String value) {
    weight = int.tryParse(value) ?? 0;
  }

  @action
  void setHeight(String value) {
    height = int.tryParse(value) ?? 0;
  }

  @action
  void setBmi(int weightCalculator, int heightCalculator) {
    double heightInMeters = heightCalculator / 100;
    double bmiValue = weightCalculator / (heightInMeters * heightInMeters);
    bmi = bmiValue.toInt();
  }
}
