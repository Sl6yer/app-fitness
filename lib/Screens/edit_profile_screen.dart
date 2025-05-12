import 'package:fitness_app/Screens/home_screen.dart';
import 'package:fitness_app/Widgets/avatar_profile.dart';
import 'package:fitness_app/Widgets/textField_name.dart';

import 'package:fitness_app/store/profile_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:fitness_app/store/profile_store_singleton.dart';

class EditProfileScreen extends StatelessWidget {
  EditProfileScreen({super.key});

  final TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Edit Profile',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 30),
              Stack(
                children: [
                  GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        builder:
                            (context) => Container(
                              height: MediaQuery.of(context).size.height * 0.25,
                              width: MediaQuery.of(context).size.width * 1,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    'Selecione uma imagem',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      children: [
                                        AvatarProfile(
                                          id: '1',
                                          avatar: 'assets/avatar1.png',
                                        ),
                                        AvatarProfile(
                                          id: '2',
                                          avatar: 'assets/image2.png',
                                        ),
                                        AvatarProfile(
                                          id: '3',
                                          avatar: 'assets/image3.png',
                                        ),
                                        AvatarProfile(
                                          id: '4',
                                          avatar: 'assets/image4.png',
                                        ),
                                        AvatarProfile(
                                          id: '5',
                                          avatar: 'assets/image5.png',
                                        ),
                                        AvatarProfile(
                                          id: '6',
                                          avatar: 'assets/image6.png',
                                        ),
                                        AvatarProfile(
                                          id: '7',
                                          avatar: 'assets/image7.png',
                                        ),
                                        AvatarProfile(
                                          id: '8',
                                          avatar: 'assets/image8.png',
                                        ),
                                        AvatarProfile(
                                          id: '9',
                                          avatar: 'assets/image9.png',
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                ],
                              ),
                            ),
                      );
                    },
                    child: Observer(
                      builder: (_) {
                        print('imagem alterada');
                        return CircleAvatar(
                          radius: 50,
                          backgroundColor: Colors.transparent,
                          child: Image.asset(
                            'assets/image${profileStore.id}.png',
                          ),
                        );
                      },
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      padding: EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 4),
                      ),
                      child: Icon(Icons.edit, color: Colors.white, size: 20),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Observer(
                builder: (_) {
                  return Text(
                    profileStore.name,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                  );
                },
              ),
              const SizedBox(height: 50),
              Divider(color: Colors.grey[300]),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Full name',
                          style: TextStyle(
                            color: const Color.fromARGB(255, 107, 106, 106),
                          ),
                        ),
                        const SizedBox(height: 10),
                        TextfieldName(nameController: nameController),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Date of Birth',
                          style: TextStyle(
                            color: const Color.fromARGB(255, 107, 106, 106),
                          ),
                        ),
                        const SizedBox(height: 10),
                        TextField(
                          cursorColor: const Color.fromRGBO(254, 85, 48, 1),
                          decoration: InputDecoration(
                            labelStyle: TextStyle(fontWeight: FontWeight.w600),
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey[400] ?? Colors.orange,
                              ),
                              borderRadius: BorderRadius.circular(17),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                              borderRadius: BorderRadius.circular(17),
                            ),
                            suffixIcon: Padding(
                              padding: const EdgeInsets.only(
                                top: 10,
                                bottom: 10,
                              ),
                              child: FaIcon(
                                FontAwesomeIcons.calendarDays,
                                color: const Color.fromRGBO(254, 85, 48, 1),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 70),
                        Container(
                          width: double.infinity,
                          height: 60,
                          child: ElevatedButton(
                            onPressed: () {
                              final name = nameController.text;

                              if (name.length > 1) {
                                profileStore.setName(name);
                              } else {
                                print('Nome invalido');
                              }

                              profileStore.setId();

                              Navigator.of(context).push(
                                MaterialPageRoute(builder: (_) => HomeScreen()),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color.fromRGBO(
                                254,
                                85,
                                48,
                                1,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            child: Text(
                              'Save',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
