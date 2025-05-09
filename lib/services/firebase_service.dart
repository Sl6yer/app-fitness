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
}
