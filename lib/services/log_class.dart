class NutritionLog {
  final String dateTime;
  final String productName;
  final int protein;
  final int carbs;
  final int calories;

  NutritionLog({
    required this.dateTime,
    required this.productName,
    required this.protein,
    required this.carbs,
    required this.calories,
  });
}
