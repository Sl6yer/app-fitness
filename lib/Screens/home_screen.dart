import 'package:fitness_app/Screens/home.dart';
import 'package:fitness_app/Widgets/Date_Navigator.dart';
import 'package:fitness_app/Widgets/dados_widget.dart';
import 'package:fitness_app/Widgets/topCurve_clipper.dart';
import 'package:fitness_app/store/bottom_nav_store.dart';
import 'package:fitness_app/store/date_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:intl/intl.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final dateStore = DateStore();
  final BottomNavStore navStore = BottomNavStore();

  final List<Widget> pages = [
    Home(),
    const Center(child: Text('Favorites')),
    const Center(child: Text('History')),
    const Center(child: Text('Profile')),
  ];

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return Scaffold(
          body: pages[navStore.selectedIndex],

          bottomNavigationBar: Observer(
            builder: (_) {
              return BottomAppBar(
                shape: const CircularNotchedRectangle(),
                notchMargin: 8,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.home,
                        color:
                            navStore.selectedIndex == 0
                                ? Colors.orange
                                : Colors.grey,
                      ),
                      onPressed: () {
                        navStore.setIndex(0);
                      },
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.favorite_border,
                        color:
                            navStore.selectedIndex == 1
                                ? Colors.orange
                                : Colors.grey,
                      ),
                      onPressed: () {
                        navStore.setIndex(1);
                      },
                    ),
                    SizedBox(width: 40), // espaço para o botão central
                    IconButton(
                      icon: Icon(
                        Icons.access_time,
                        color:
                            navStore.selectedIndex == 2
                                ? Colors.orange
                                : Colors.grey,
                      ),
                      onPressed: () {
                        navStore.setIndex(2);
                      },
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.person_outline,
                        color:
                            navStore.selectedIndex == 3
                                ? Colors.orange
                                : Colors.grey,
                      ),
                      onPressed: () {
                        navStore.setIndex(3);
                      },
                    ),
                  ],
                ),
              );
            },
          ),
          floatingActionButton: SizedBox(
            height: 70,
            width: 70,
            child: FloatingActionButton(
              onPressed: () {},
              shape: const CircleBorder(),
              backgroundColor: Colors.orange,
              child: FaIcon(
                FontAwesomeIcons.play,
                color: Colors.white,
                size: 20,
              ),
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
        );
      },
    );
  }
}
