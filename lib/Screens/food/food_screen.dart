import 'package:fitness_app/Widgets/food/food_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fitness_app/store/food/food_store.dart';

class FoodSearchScreen extends StatelessWidget {
  final FoodStore foodStore = FoodStore();
  final TextEditingController _controller = TextEditingController();

  FoodSearchScreen({super.key});

  void _search() {
    foodStore.setQuery(_controller.text);
    foodStore.searchFood();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
              child: TextField(
                controller: _controller,
                onSubmitted: (_) => _search(),
                decoration: InputDecoration(
                  hintText: 'Digite o nome do alimento',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: _search,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: Observer(
                builder: (_) {
                  if (foodStore.isLoading) {
                    return const Center(
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(
                          Colors.orange,
                        ),
                      ),
                    );
                  }

                  if (foodStore.searchResults.isEmpty) {
                    return const Center(
                      child: Text('Nenhum resultado encontrado.'),
                    );
                  }

                  return ListView.builder(
                    itemCount: foodStore.searchResults.length,
                    itemBuilder: (context, index) {
                      final item = foodStore.searchResults[index];

                      return Card(
                        elevation: 4,
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item['name'],
                                style: GoogleFonts.poppins(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'Tipo: ${item['type']}',
                                style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  color: Colors.grey,
                                ),
                              ),
                              const SizedBox(height: 16),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  FoodWidget(
                                    title: 'Calorias',
                                    iconData: Icons.local_fire_department,
                                    value: '${item['calories']} kcal',
                                  ),
                                  FoodWidget(
                                    title: 'Proteína',
                                    iconData: Icons.fitness_center,
                                    value: '${item['protein']} g',
                                  ),
                                  FoodWidget(
                                    title: 'Gordura',
                                    iconData: Icons.oil_barrel,
                                    value: '${item['fat']} g',
                                  ),
                                  FoodWidget(
                                    title: 'Carbo',
                                    iconData: Icons.bubble_chart,
                                    value: '${item['carbohydrate']} g',
                                  ),
                                ],
                              ),
                              const SizedBox(height: 16),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
