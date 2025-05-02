import 'package:fitness_app/Screens/home_screen.dart';
import 'package:fitness_app/Screens/initial_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // garante que o Flutter inicializou
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: InitialScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
