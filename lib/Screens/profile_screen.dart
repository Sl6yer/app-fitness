import 'package:fitness_app/Screens/body_screen.dart';
import 'package:fitness_app/Screens/goals_screen.dart';
import 'package:fitness_app/Screens/settings_screen.dart';
import 'package:fitness_app/Widgets/row_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fitness_app/store/profile_store_singleton.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Account', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 60,
            backgroundColor: Colors.white,
            child: Image.asset('assets/image.png'),
          ),
          const SizedBox(height: 25),
          Observer(
            builder: (_) {
              return Text(
                '${profileStore.name}',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Gotham',
                  fontSize: 25,
                ),
              );
            },
          ),
          const SizedBox(height: 10),
          Text(
            'Pro',
            style: TextStyle(
              color: Color.fromRGBO(254, 85, 48, 1),
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
          const SizedBox(height: 30),
          Divider(color: Colors.grey[300]),
          const SizedBox(height: 30),
          RowProfile(
            title: 'Goals',
            iconData: FontAwesomeIcons.bullseye,
            iconBgColor: Color.fromRGBO(254, 85, 48, 0.3),
            iconColor: Color.fromRGBO(254, 85, 48, 1),
            onTap: () {
              Navigator.of(
                context,
              ).push(MaterialPageRoute(builder: (_) => GoalsScreen()));
            },
          ),
          RowProfile(
            title: 'My Body',
            iconData: FontAwesomeIcons.person,
            iconBgColor: Color.fromRGBO(80, 65, 171, 0.3),
            iconColor: Color.fromRGBO(80, 65, 171, 1),
            onTap: () {
              Navigator.of(
                context,
              ).push(MaterialPageRoute(builder: (_) => BodyScreen()));
            },
          ),
          RowProfile(
            title: 'Settings',
            iconData: FontAwesomeIcons.gear,
            iconBgColor: Color.fromRGBO(105, 224, 199, 0.3),
            iconColor: Color.fromRGBO(105, 224, 199, 1),
            onTap: () {
              Navigator.of(
                context,
              ).push(MaterialPageRoute(builder: (_) => SettingsScreen()));
            },
          ),
        ],
      ),
    );
  }
}
