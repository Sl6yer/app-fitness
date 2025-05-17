import 'package:mobx/mobx.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
part 'notification_store.g.dart';

class NotificationStore = _NotificationStoreBase with _$NotificationStore;

abstract class _NotificationStoreBase with Store {
  @observable
  List<Map<String, dynamic>> horarios = [];

  @action
  Future<void> carregarHorarios() async {
    try {
      final docRef = FirebaseFirestore.instance
          .collection('notificacoes')
          .doc('agua');
      final docSnapshot = await docRef.get();

      if (docSnapshot.exists) {
        var data = docSnapshot.data() as Map<String, dynamic>;
        horarios = List<Map<String, dynamic>>.from(data['horarios'] ?? []);
      }
    } catch (e) {
      print('Erro ao carregar os horários: $e');
    }
  }

  @action
  Future<void> adicionarHorario(
    DateTime horaNotificacaoAgua,
    bool ativo,
  ) async {
    final novoHorario = {
      'hora_notificacao_agua': Timestamp.fromDate(horaNotificacaoAgua),
      'ativo': ativo,
    };

    horarios.add(novoHorario);

    try {
      final docRef = FirebaseFirestore.instance
          .collection('notificacoes')
          .doc('agua');
      await docRef.update({
        'horarios': horarios,
        'hora_atualizacao': Timestamp.now(),
      });
    } catch (e) {
      print('Erro ao adicionar horário: $e');
    }
  }

  @action
  Future<void> alternarAtivo(int index, bool ativo) async {
    horarios[index]['ativo'] = ativo;

    try {
      final docRef = FirebaseFirestore.instance
          .collection('notificacoes')
          .doc('agua');
      await docRef.update({
        'horarios': horarios,
        'hora_atualizacao': Timestamp.now(),
      });
    } catch (e) {
      print('Erro ao alterar o estado ativo: $e');
    }
  }
}
