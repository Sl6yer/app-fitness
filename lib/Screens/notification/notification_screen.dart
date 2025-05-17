import 'package:fitness_app/Screens/notification/water_notification_screen.dart';
import 'package:fitness_app/Widgets/row_profile.dart';
import 'package:fitness_app/Widgets/water_information.dart';
import 'package:fitness_app/services/firebase_service.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Notification'), centerTitle: true),
      body: Column(
        children: [
          RowProfile(
            title: 'Water',
            iconData: Icons.water_drop,
            iconBgColor: const Color.fromARGB(31, 33, 149, 243),
            iconColor: Colors.blue,
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => WaterNotificationScreen()),
              );
            },
          ),
          RowProfile(
            title: 'Calories',
            iconData: Icons.local_fire_department,
            iconBgColor: Color.fromRGBO(254, 85, 48, 0.3),
            iconColor: Color.fromRGBO(254, 85, 48, 1),
            onTap: () {},
          ),
          RowProfile(
            title: 'Steps',
            iconData: Icons.directions_walk,
            iconBgColor: Color.fromRGBO(80, 65, 171, 0.3),
            iconColor: Color.fromRGBO(80, 65, 171, 1),
            onTap: () {},
          ),
          RowProfile(
            title: 'Proteins',
            iconData: Icons.fitness_center,
            iconBgColor: const Color.fromARGB(31, 244, 67, 54),
            iconColor: Colors.red,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
