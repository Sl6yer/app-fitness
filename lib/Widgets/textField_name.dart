import 'package:flutter/material.dart';
import 'package:fitness_app/store/profile_store_singleton.dart';

class TextfieldName extends StatelessWidget {
  const TextfieldName({super.key, required this.nameController});

  final TextEditingController nameController;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: nameController,
      cursorColor: const Color.fromRGBO(254, 85, 48, 1),
      decoration: InputDecoration(
        labelText: '${profileStore.name}',
        labelStyle: TextStyle(fontWeight: FontWeight.w600),
        floatingLabelBehavior: FloatingLabelBehavior.never,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey[400] ?? Colors.orange),
          borderRadius: BorderRadius.circular(17),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.circular(17),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(17),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(17),
        ),
      ),
      keyboardType: TextInputType.name,
    );
  }
}
