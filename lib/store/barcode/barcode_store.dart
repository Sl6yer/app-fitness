import 'package:fitness_app/services/log_class.dart';
import 'package:mobx/mobx.dart';
import 'package:intl/intl.dart';
part 'barcode_store.g.dart';

class BarCodeStore = _BarCodeStoreBase with _$BarCodeStore;

abstract class _BarCodeStoreBase with Store {
  @observable
  ObservableList<NutritionLog> logs = ObservableList<NutritionLog>();

  @observable
  bool isScanning = false;

  @observable
  String scannedCode = '';

  @observable
  String productName = '';

  @observable
  int protein = 0;

  @observable
  int carbs = 0;

  @observable
  int calories = 0;

  @action
  void startScanning() {
    isScanning = true;
  }

  @action
  void stopScanning() {
    isScanning = false;
  }

  @action
  void setScannedCode(String code) {
    scannedCode = code;
  }

  @action
  void setProductName(String newproductName) {
    productName = newproductName;
    print('O nome do produto é: $productName');
  }

  @action
  void setProtein(int newProtein) {
    protein = newProtein;
    print('Proteinas: $protein');
  }

  @action
  void setCarbs(int newCarbs) {
    carbs = newCarbs;
    print('Carboidratos: $carbs');
  }

  @action
  void setCalories(int newCalories) {
    calories = newCalories;
    print('Calorias: $calories');
  }

  @action
  void logProduct() {
    final now = DateTime.now();
    final formatted = formatDateTime(now);
    print(
      'Valores antes de log: Produto: $productName, Proteínas: $protein, Carboidratos: $carbs, Calorias: $calories',
    );
    logs.add(
      NutritionLog(
        dateTime: formatted,
        productName: productName,
        protein: protein,
        carbs: carbs,
        calories: calories,
      ),
    );
    print(
      'infos adicionados: [$now] $productName | Proteína: $protein g | Carboidrato: $carbs g | Calorias: $calories kcal',
    );
  }

  String formatDateTime(DateTime dateTime) {
    final DateFormat formatter = DateFormat('dd/MM HH:mm');
    return formatter.format(dateTime);
  }
}
