import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fl_chart/fl_chart.dart';

class FirebaseService {
  static Future<void> salvarOuAtualizarDados(
    double calorias,
    double proteinas,
    double agua,
  ) async {
    try {
      final dataHoje = DateTime.now();
      final dataFormatada =
          '${dataHoje.year}-${dataHoje.month.toString().padLeft(2, '0')}-${dataHoje.day.toString().padLeft(2, '0')}';

      final docRef = FirebaseFirestore.instance
          .collection('dados_diarios')
          .doc(dataFormatada);

      final docSnapshot = await docRef.get();

      if (docSnapshot.exists) {
        await docRef.update({
          'calorias': calorias,
          'proteinas': proteinas,
          'agua': agua,
          'hora_atualização': Timestamp.now(),
        });
        print('Dados atualizado com sucesso');
      } else {
        await docRef.set({
          'calorias': calorias,
          'proteinas': proteinas,
          'agua': agua,
          'data': Timestamp.now(),
        });
        print('Dados salvos com sucesso!');
      }
    } catch (e) {
      print('Erro ao salvar ou atualizar os dados: $e');
    }
  }

  static Future<void> salvarOuAtualizarNotificacaoAgua(
    DateTime horaNotificacaoAgua,
    bool ativo,
  ) async {
    try {
      final docRef = FirebaseFirestore.instance
          .collection('notificacoes')
          .doc('agua');

      final docSnapshot = await docRef.get();

      if (docSnapshot.exists) {
        // Recupera os horários atuais e adiciona o novo horário
        var data = docSnapshot.data() as Map<String, dynamic>;
        List<Map<String, dynamic>> horarios = List<Map<String, dynamic>>.from(
          data['horarios'] ?? [],
        );

        horarios.add({
          'hora_notificacao_agua': Timestamp.fromDate(horaNotificacaoAgua),
          'ativo': ativo,
        });

        await docRef.update({
          'horarios': horarios,
          'hora_atualizacao': Timestamp.now(),
        });

        print('Horário de notificação atualizado com sucesso');
      } else {
        await docRef.set({
          'horarios': [
            {
              'hora_notificacao_agua': Timestamp.fromDate(horaNotificacaoAgua),
              'ativo': ativo,
            },
          ],
          'hora_criacao': Timestamp.now(),
        });

        print('Notificação salva com sucesso!');
      }
    } catch (e) {
      print('Erro ao salvar ou atualizar notificação: $e');
    }
  }

  static Future<DateTime?> obterHoraNotificacaoAgua() async {
    try {
      final docRef = FirebaseFirestore.instance
          .collection('notificacoes')
          .doc('agua');

      final docSnapshot = await docRef.get();

      if (docSnapshot.exists) {
        var data = docSnapshot.data() as Map<String, dynamic>;
        if (data['hora_notificacao_agua'] != null) {
          return (data['hora_notificacao_agua'] as Timestamp).toDate();
        }
      }
      return null;
    } catch (e) {
      print('Erro ao obter hora de notificação: $e');
      return null;
    }
  }
}
