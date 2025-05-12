import 'package:mobx/mobx.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

part 'daily_calories_store.g.dart';

class DailyCaloriesStore = _DailyCaloriesStoreBase with _$DailyCaloriesStore;

abstract class _DailyCaloriesStoreBase with Store {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @observable
  DateTime selectedDate = DateTime.now();

  @observable
  int dailyCalories = 0;

  @observable
  int dailyProteins = 0;

  @observable
  int dailyWater = 0;

  @action
  void setSelectedDate(DateTime date) {
    selectedDate = date;
    fetchDailyData();
    print('Selected date: $selectedDate');
    print(dailyCalories);
  }

  @action
  Future<void> fetchDailyData() async {
    final String docId = DateFormat('yyyy-MM-dd').format(selectedDate);
    final doc = await _firestore.collection('dados_diarios').doc(docId).get();

    if (doc.exists) {
      final data = doc.data()!;
      dailyCalories = ((data['calorias'] ?? 0) as num).toInt();
      dailyProteins = ((data['proteinas'] ?? 0) as num).toInt();
      dailyWater = ((data['agua'] ?? 0) as num).toInt();
    } else {
      dailyCalories = 0;
      dailyProteins = 0;
      dailyWater = 0;
    }
  }
}
