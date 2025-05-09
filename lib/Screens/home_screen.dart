import 'package:fitness_app/Screens/barcode_scanner_screen.dart';
import 'package:fitness_app/Screens/body_screen.dart';
import 'package:fitness_app/Screens/calories_screen.dart';
import 'package:fitness_app/Screens/home.dart';
import 'package:fitness_app/Screens/logs_screen.dart';
import 'package:fitness_app/Screens/profile_screen.dart';
import 'package:fitness_app/Screens/set_water_screen.dart';
import 'package:fitness_app/Widgets/Date_Navigator.dart';
import 'package:fitness_app/Widgets/dados_widget.dart';
import 'package:fitness_app/Widgets/modal_home.dart';
import 'package:fitness_app/Widgets/second_modal_home.dart';
import 'package:fitness_app/Widgets/topCurve_clipper.dart';
import 'package:fitness_app/store/bottom_nav_store.dart';
import 'package:fitness_app/store/date_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_fonts/google_fonts.dart';
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
    LogsScreen(),
    ProfileScreen(),
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
                color: Colors.transparent,
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
                                ? Color.fromRGBO(254, 85, 48, 1)
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
                                ? Color.fromRGBO(254, 85, 48, 1)
                                : Colors.grey,
                      ),
                      onPressed: () {
                        navStore.setIndex(1);
                      },
                    ),
                    SizedBox(width: 40), // espaço para o botão central
                    IconButton(
                      icon: Icon(
                        Icons.qr_code,
                        color:
                            navStore.selectedIndex == 2
                                ? Color.fromRGBO(254, 85, 48, 1)
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
                                ? Color.fromRGBO(254, 85, 48, 1)
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
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xFFFF5A1F),
                    Color.fromARGB(255, 247, 150, 98),
                  ],
                ),
              ),
              child: FloatingActionButton(
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    builder:
                        (context) => Container(
                          height: MediaQuery.of(context).size.height * 0.35,
                          width: MediaQuery.of(context).size.width * 1,
                          padding: EdgeInsets.all(20),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  SecondModalHome(
                                    title: 'Track Food',
                                    iconData: FontAwesomeIcons.magnifyingGlass,
                                    bgContainerColor: Color.fromRGBO(
                                      254,
                                      85,
                                      48,
                                      1,
                                    ),
                                    ontap: () {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (_) => CaloriesScreen(),
                                        ),
                                      );
                                    },
                                  ),
                                  SecondModalHome(
                                    title: 'Barcode Scanner',
                                    iconData: FontAwesomeIcons.barcode,
                                    bgContainerColor: Colors.pink,
                                    ontap: () {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder:
                                              (_) => BarcodeScannerScreen(),
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              ),
                              Card(
                                elevation: 0,
                                color: Color.fromRGBO(228, 225, 225, 0.3),
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Column(
                                    children: [
                                      ModalHome(
                                        iconData: FontAwesomeIcons.glassWater,
                                        title: 'Water',
                                        iconColor: Colors.blue,
                                        ontap: () {
                                          Navigator.of(context).push(
                                            MaterialPageRoute(
                                              builder: (_) => SetWaterScreen(),
                                            ),
                                          );
                                        },
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 16,
                                          vertical: 8,
                                        ),
                                        child: Divider(color: Colors.grey[400]),
                                      ),
                                      ModalHome(
                                        iconData: FontAwesomeIcons.weightScale,
                                        title: 'Weight',
                                        iconColor: Colors.lightGreen,
                                        ontap: () {
                                          Navigator.of(context).push(
                                            MaterialPageRoute(
                                              builder: (_) => BodyScreen(),
                                            ),
                                          );
                                        },
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 16,
                                          vertical: 8,
                                        ),
                                        child: Divider(color: Colors.grey[400]),
                                      ),
                                      ModalHome(
                                        iconData: FontAwesomeIcons.fire,
                                        title: 'Exercise',
                                        iconColor: Colors.orange,
                                        ontap: () {},
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                  );
                },
                shape: const CircleBorder(),
                backgroundColor: Colors.transparent,
                elevation: 0,
                child: FaIcon(
                  FontAwesomeIcons.play,
                  color: Colors.white,
                  size: 20,
                ),
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
