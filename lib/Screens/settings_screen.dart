import 'package:fitness_app/Screens/edit_profile_screen.dart';
import 'package:fitness_app/Widgets/row_profile.dart';
import 'package:fitness_app/store/date_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fitness_app/store/profile_store_singleton.dart';

class SettingsScreen extends StatelessWidget {
  SettingsScreen({super.key});

  final DateStore store = DateStore();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Settings',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 8),
            child: Text(
              'Account',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => EditProfileScreen(store: store),
                  ),
                );
                store.updateData();
              },
              borderRadius: BorderRadius.circular(12),

              child: Padding(
                padding: const EdgeInsets.all(5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(shape: BoxShape.circle),
                          child: Center(
                            child: CircleAvatar(
                              radius: 50,
                              child: Observer(
                                builder: (_) {
                                  return Image.asset(
                                    'assets/image${profileStore.id}.png',
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 25),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Observer(
                              builder: (_) {
                                return Text(
                                  '${profileStore.name}',
                                  style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Gotham',
                                  ),
                                );
                              },
                            ),
                            Text(
                              'Pro',
                              style: TextStyle(
                                color: Color.fromRGBO(254, 85, 48, 1),
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    FaIcon(Icons.chevron_right),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 8),
            child: Text(
              'Settings',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
          ),
          RowProfile(
            title: 'Location',
            iconData: FontAwesomeIcons.locationDot,
            iconBgColor: Color.fromRGBO(254, 85, 48, 0.3),
            iconColor: Color.fromRGBO(254, 85, 48, 1),
            onTap: () {},
          ),
          RowProfile(
            title: 'Notification',
            iconData: FontAwesomeIcons.bell,
            iconBgColor: Color.fromRGBO(105, 224, 199, 0.3),
            iconColor: Color.fromRGBO(105, 224, 199, 1),
            onTap: () {},
          ),
          RowProfile(
            title: 'Close Friends',
            iconData: Icons.person_add,
            iconBgColor: Color.fromRGBO(96, 80, 206, 0.3),
            iconColor: Color.fromRGBO(96, 80, 206, 1),
            onTap: () {},
          ),
          RowProfile(
            title: 'Sounds',
            iconData: FontAwesomeIcons.volumeLow,
            iconBgColor: Color.fromRGBO(255, 125, 125, 0.3),
            iconColor: Color.fromRGBO(255, 125, 125, 1),
            onTap: () {},
          ),
          RowProfile(
            title: 'Privacy',
            iconData: Icons.lock,
            iconBgColor: Color.fromRGBO(101, 207, 88, 0.3),
            iconColor: Color.fromRGBO(101, 207, 88, 1),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
