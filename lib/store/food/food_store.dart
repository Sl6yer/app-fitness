import 'package:mobx/mobx.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

part 'food_store.g.dart';

class FoodStore = _FoodStoreBase with _$FoodStore;

abstract class _FoodStoreBase with Store {
  @observable
  String query = '';

  @observable
  bool isLoading = false;

  @observable
  ObservableList<Map<String, dynamic>> searchResults = ObservableList();

  @action
  Future<void> searchFood() async {
    isLoading = true;

    try {
      final token = await getAcessToken();
      final results = await searchFoods(token, query);

      final detailedResults = <Map<String, dynamic>>[];

      for (var food in results) {
        try {
          final details = await getFoodDetails(
            token,
            food['food_id'].toString(),
          );
          detailedResults.add(details!);
        } catch (e) {
          print('Erro ao buscar detalhes: $e');
        }
      }

      searchResults
        ..clear()
        ..addAll(detailedResults);
    } catch (e) {
      print('Error: $e');
    } finally {
      isLoading = false;
    }
  }

  @action
  void setQuery(String value) {
    query = value;
  }

  Future<String> getAcessToken() async {
    final response = await http.post(
      Uri.parse('https://oauth.fatsecret.com/connect/token'),
      headers: {
        'Authorization':
            'Basic ${base64Encode(utf8.encode('2617bd0ed0b24163a381168340c115e9:3072f25cd521457e96181684f7ac233c'))}',
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      body: {'grant_type': 'client_credentials', 'scope': 'basic'},
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data['access_token'];
    } else {
      throw Exception('Failed to load access token');
    }
  }

  Future<List<Map<String, dynamic>>> searchFoods(
    String token,
    String termo,
  ) async {
    final response = await http.get(
      Uri.parse(
        'https://platform.fatsecret.com/rest/server.api?method=foods.search&search_expression=$termo&format=json',
      ),
      headers: {'Authorization': 'Bearer $token'},
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final foods = data['foods']['food'] as List;
      return foods.map((food) => Map<String, dynamic>.from(food)).toList();
    } else {
      throw Exception('Failed to load food search');
    }
  }

  Future<Map<String, dynamic>?> getFoodDetails(
    String token,
    String foodId,
  ) async {
    final response = await http.get(
      Uri.parse(
        'https://platform.fatsecret.com/rest/server.api?method=food.get&food_id=$foodId&format=json',
      ),
      headers: {'Authorization': 'Bearer $token'},
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);

      if (data['food'] == null) {
        throw Exception('Food details not available.');
      }

      final food = data['food'];

      if (food['servings'] == null || food['servings']['serving'] == null) {
        return null;
      }

      final serving = food['servings']['serving'];

      final nutrients = serving is List ? serving[0] : serving;

      return {
        'name': food['food_name'] ?? 'Unknown',
        'type': food['food_type'] ?? 'Unknown',
        'calories': nutrients['calories'] ?? 0,
        'protein': nutrients['protein'] ?? 0,
        'fat': nutrients['fat'] ?? 0,
        'carbohydrate': nutrients['carbohydrate'] ?? 0,
      };
    } else {
      throw Exception('Failed to load food details');
    }
  }
}
