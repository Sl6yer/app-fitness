import 'package:fitness_app/store/date_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:intl/intl.dart';

class DateNavigator extends StatelessWidget {
  const DateNavigator({super.key, required this.store});

  final DateStore store;

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();

    // Lista de datas (3 dias antes até 3 dias depois de hoje)
    final List<DateTime> days = List.generate(7, (index) {
      return now.subtract(Duration(days: 3 - index));
    });

    return SizedBox(
      height: 50,
      child: Observer(
        builder: (_) {
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: days.length,
            itemBuilder: (context, index) {
              final day = days[index];
              final isSelected =
                  store.selectedDate.day == day.day &&
                  store.selectedDate.month == day.month &&
                  store.selectedDate.year == day.year;

              final isToday =
                  DateTime.now().day == day.day &&
                  DateTime.now().month == day.month &&
                  DateTime.now().year == day.year;

              return GestureDetector(
                onTap: () {
                  store.setDate(day);
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  margin: EdgeInsets.symmetric(horizontal: 4),
                  decoration: BoxDecoration(
                    color:
                        isSelected
                            ? const Color.fromARGB(255, 255, 222, 228)
                            : Colors.transparent,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Text(
                      isToday
                          ? 'Today, ${DateFormat.MMMd().format(day)}'
                          : DateFormat.d().format(day),
                      style: TextStyle(
                        fontWeight:
                            isSelected ? FontWeight.bold : FontWeight.normal,
                        fontSize: 13,
                        color: isSelected ? Colors.black : Colors.grey[600],
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
