import 'package:fitness_app/services/firebase_service.dart';
import 'package:fitness_app/store/notification/notification_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:time_picker_spinner/time_picker_spinner.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class WaterNotificationScreen extends StatelessWidget {
  WaterNotificationScreen({super.key});

  final NotificationStore store = NotificationStore();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Observer(
        builder: (_) {
          return ListView.builder(
            itemCount: store.horarios.length,
            itemBuilder: (context, index) {
              DateTime horario =
                  (store.horarios[index]['hora_notificacao_agua'] as Timestamp)
                      .toDate();
              bool ativo = store.horarios[index]['ativo'];

              return ListTile(
                title: Text('Hora: ${horario.hour}:${horario.minute}'),
                subtitle: Text('Status: ${ativo ? 'Ativo' : 'Desativado'}'),
                trailing: Switch(
                  value: ativo,
                  onChanged: (value) {
                    store.alternarAtivo(index, ativo);
                  },
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(right: 20, bottom: 20),
        child: FloatingActionButton(
          elevation: 0,
          backgroundColor: Colors.blue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(28),
          ),
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                DateTime selectedTime = DateTime.now();
                return AlertDialog(
                  title: Column(
                    children: [
                      Icon(Icons.water_drop, size: 80, color: Colors.blue),
                      Text('Water Reminder'),
                    ],
                  ),
                  content: Container(
                    height: 200,
                    child: Column(
                      children: [
                        Text(
                          'choose a time to be \nreminded to drink water',
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 20),
                        TimePickerSpinner(
                          is24HourMode: false,
                          normalTextStyle: const TextStyle(
                            fontSize: 20,
                            color: Colors.grey,
                          ),
                          highlightedTextStyle: const TextStyle(
                            fontSize: 22,
                            color: Colors.black,
                          ),
                          spacing: 40,
                          itemHeight: 40,
                          isForce2Digits: true,
                          onTimeChange: (time) {
                            selectedTime = time;
                          },
                        ),
                      ],
                    ),
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        'Cancel',
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        await FirebaseService.salvarOuAtualizarNotificacaoAgua(
                          selectedTime,
                          true,
                        );
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                      ),
                      child: const Text(
                        'Save',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                );
              },
            );
          },
          child: Icon(Icons.add, color: Colors.white),
        ),
      ),
    );
  }
}
