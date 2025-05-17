// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$NotificationStore on _NotificationStoreBase, Store {
  late final _$horariosAtom =
      Atom(name: '_NotificationStoreBase.horarios', context: context);

  @override
  List<Map<String, dynamic>> get horarios {
    _$horariosAtom.reportRead();
    return super.horarios;
  }

  @override
  set horarios(List<Map<String, dynamic>> value) {
    _$horariosAtom.reportWrite(value, super.horarios, () {
      super.horarios = value;
    });
  }

  late final _$carregarHorariosAsyncAction =
      AsyncAction('_NotificationStoreBase.carregarHorarios', context: context);

  @override
  Future<void> carregarHorarios() {
    return _$carregarHorariosAsyncAction.run(() => super.carregarHorarios());
  }

  late final _$adicionarHorarioAsyncAction =
      AsyncAction('_NotificationStoreBase.adicionarHorario', context: context);

  @override
  Future<void> adicionarHorario(DateTime horaNotificacaoAgua, bool ativo) {
    return _$adicionarHorarioAsyncAction
        .run(() => super.adicionarHorario(horaNotificacaoAgua, ativo));
  }

  late final _$alternarAtivoAsyncAction =
      AsyncAction('_NotificationStoreBase.alternarAtivo', context: context);

  @override
  Future<void> alternarAtivo(int index, bool ativo) {
    return _$alternarAtivoAsyncAction
        .run(() => super.alternarAtivo(index, ativo));
  }

  @override
  String toString() {
    return '''
horarios: ${horarios}
    ''';
  }
}
