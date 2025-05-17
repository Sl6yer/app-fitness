import 'package:fitness_app/Screens/home/home_screen.dart';
import 'package:fitness_app/Screens/others/initial_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fitness_app/services/notification_service.dart';
import 'package:fitness_app/store/goals/goals_store.dart';
import 'package:fitness_app/store/goals/goals_store_singleton.dart';
import 'package:flutter/services.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:permission_handler/permission_handler.dart'; // Importando a biblioteca

// Função para solicitar permissão para agendar alarmes exatos
Future<void> requestExactAlarmPermission() async {
  try {
    final status = await Permission.notification.status;
    if (status.isDenied || status.isPermanentlyDenied) {
      // Permissão negada ou permanentemente negada
      openAppSettings();
    } else if (status.isGranted) {
      print("Permissão para notificações já concedida.");
    } else {
      // Solicitar permissão
      final permissionStatus = await Permission.notification.request();
      if (permissionStatus.isGranted) {
        print("Permissão concedida.");
      } else {
        print("Permissão não concedida.");
      }
    }

    if (await Permission.scheduleExactAlarm.isDenied) {
      // Solicitar permissão para agendar alarmes exatos
      await Permission.scheduleExactAlarm.request();
    }
  } on PlatformException catch (e) {
    print("Erro ao verificar ou solicitar permissão: $e");
  }
}

Future<bool> hasGoals() async {
  final prefs = await SharedPreferences.getInstance();
  final caloriesGoal = prefs.getInt('caloriesGoal') ?? 0;
  return caloriesGoal > 0;
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // garante que o Flutter inicializou
  await Firebase.initializeApp();
  await goalsStore.loadGoalsFromPrefs();
  tz.initializeTimeZones();
  await NotificationService.initialize();

  try {
    await requestExactAlarmPermission();
  } catch (e) {
    print('Erro ao solicitar permissão ou agendar notificação: $e');
  }

  final doc =
      await FirebaseFirestore.instance
          .collection('notificacoes')
          .doc('agua')
          .get();
  if (doc.exists && doc.data()?['hora_notificacao_agua'] != null) {
    final timestamp = doc.data()!['hora_notificacao_agua'] as Timestamp;
    final horaSalva = timestamp.toDate();
    await NotificationService.scheduleDailyNotification(horaSalva);
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: FutureBuilder(
        future: hasGoals(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Scaffold(body: Center(child: CircularProgressIndicator()));
          } else if (snapshot.hasError) {
            return Scaffold(body: Center(child: Text('Erro ao carregar')));
          } else if (snapshot.data == true) {
            return HomeScreen();
          } else {
            return const InitialScreen();
          }
        },
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
