import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fitness_app/store/goals/goals_store.dart';

class GoalsProfile extends StatefulWidget {
  const GoalsProfile({
    super.key,
    required this.title,
    required this.iconData,
    required this.goalsStore,
    required this.onsetGoal,
  });

  final String title;
  final IconData iconData;
  final GoalsStore goalsStore;
  final Function(int) onsetGoal;

  @override
  State<GoalsProfile> createState() => _GoalsProfileState();
}

class _GoalsProfileState extends State<GoalsProfile> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(13.0),
      child: Container(
        height: 150,
        width: 150,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey[300]!),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FaIcon(widget.iconData, color: Colors.orange),
                const SizedBox(width: 15),
                Text(
                  widget.title,
                  style: const TextStyle(fontWeight: FontWeight.w500),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                const SizedBox(width: 10),
                Expanded(
                  child: Container(
                    height: 40,
                    child: TextField(
                      controller: _controller,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 12,
                          horizontal: 16,
                        ),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    final int? value = int.tryParse(_controller.text);
                    if (value != null) {
                      widget.onsetGoal(value);
                    }
                  },
                  icon: const Icon(Icons.add),
                ),
                const SizedBox(width: 10),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
