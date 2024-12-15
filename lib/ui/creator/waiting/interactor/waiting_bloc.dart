import 'dart:async';

import 'package:callmobile/core/model/response/model/creator.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/model/business/call_history.dart';
import '../../../../core/model/business/creator_status.dart';
import '../../../../core/model/business/fan_waiting_info.dart';
import '../../../../core/model/response/model/user.dart';
import '../../../base/interactor/page_command.dart';
import '../../../base/interactor/page_states.dart';

part 'waiting_event.dart';
part 'waiting_state.dart';

class WaitingBloc extends Bloc<WaitingEvent, WaitingState> {
  final fans = [
    FanWaitingInfo(
        name: 'シルバーマン・サックス',
        title: 'ユーザーを覚えておいてください',
        description: 'こんにちは！テキストが入りますテキストが入りますテキストが入りますテキストが入ります',
        waitingInMinute: 40,
        historyCalls: [
          CallHistory(date: DateTime.now().subtract(const Duration(days: 1, hours: 2, minutes: 5)), durationInMin: 12),
          CallHistory(date: DateTime.now().subtract(const Duration(days: 3, hours: 4, minutes: 7)), durationInMin: 30),
          CallHistory(date: DateTime.now().subtract(const Duration(days: 5, hours: 1, minutes: 9)), durationInMin: 41)
        ]),
    FanWaitingInfo(
        name: 'へんべえ',
        title: 'ユーザーを覚えておいてください',
        description: 'こんにちは！テキストが入りますテキストが入りますテキストが入りますテキストが入ります',
        waitingInMinute: 33,
        historyCalls: [
          CallHistory(date: DateTime.now().subtract(const Duration(days: 1, hours: 2, minutes: 5)), durationInMin: 12),
          CallHistory(date: DateTime.now().subtract(const Duration(days: 3, hours: 4, minutes: 7)), durationInMin: 30),
          CallHistory(date: DateTime.now().subtract(const Duration(days: 5, hours: 1, minutes: 9)), durationInMin: 41)
        ]),
    FanWaitingInfo(
        name: 'へんべえ',
        title: 'ユーザーを覚えておいてください',
        description: 'こんにちは！テキストが入りますテキストが入りますテキストが入りますテキストが入ります',
        waitingInMinute: 32,
        historyCalls: [
          CallHistory(date: DateTime.now().subtract(const Duration(days: 1, hours: 2, minutes: 5)), durationInMin: 12),
          CallHistory(date: DateTime.now().subtract(const Duration(days: 3, hours: 4, minutes: 7)), durationInMin: 30),
          CallHistory(date: DateTime.now().subtract(const Duration(days: 5, hours: 1, minutes: 9)), durationInMin: 41)
        ]),
    FanWaitingInfo(
        name: 'シルバーマン・サックス',
        title: 'ユーザーを覚えておいてください',
        description: 'こんにちは！テキストが入りますテキストが入りますテキストが入りますテキストが入ります',
        waitingInMinute: 30,
        historyCalls: [
          CallHistory(date: DateTime.now().subtract(const Duration(days: 1, hours: 2, minutes: 5)), durationInMin: 12),
          CallHistory(date: DateTime.now().subtract(const Duration(days: 3, hours: 4, minutes: 7)), durationInMin: 30),
          CallHistory(date: DateTime.now().subtract(const Duration(days: 5, hours: 1, minutes: 9)), durationInMin: 41)
        ]),
    FanWaitingInfo(
        name: 'へんべえ',
        title: 'ユーザーを覚えておいてください',
        description: 'こんにちは！テキストが入りますテキストが入りますテキストが入りますテキストが入ります',
        waitingInMinute: 29,
        historyCalls: [
          CallHistory(date: DateTime.now().subtract(const Duration(days: 1, hours: 2, minutes: 5)), durationInMin: 12),
          CallHistory(date: DateTime.now().subtract(const Duration(days: 3, hours: 4, minutes: 7)), durationInMin: 30),
          CallHistory(date: DateTime.now().subtract(const Duration(days: 5, hours: 1, minutes: 9)), durationInMin: 41)
        ]),
    FanWaitingInfo(
        name: 'へんべえ',
        title: 'ユーザーを覚えておいてください',
        description: 'こんにちは！テキストが入りますテキストが入りますテキストが入りますテキストが入ります',
        waitingInMinute: 23,
        historyCalls: [
          CallHistory(date: DateTime.now().subtract(const Duration(days: 1, hours: 2, minutes: 5)), durationInMin: 12),
          CallHistory(date: DateTime.now().subtract(const Duration(days: 3, hours: 4, minutes: 7)), durationInMin: 30),
          CallHistory(date: DateTime.now().subtract(const Duration(days: 5, hours: 1, minutes: 9)), durationInMin: 41)
        ]),
    FanWaitingInfo(
        name: 'シルバーマン・サックス',
        title: 'ユーザーを覚えておいてください',
        description: 'こんにちは！テキストが入りますテキストが入りますテキストが入りますテキストが入ります',
        waitingInMinute: 21,
        historyCalls: [
          CallHistory(date: DateTime.now().subtract(const Duration(days: 1, hours: 2, minutes: 5)), durationInMin: 12),
          CallHistory(date: DateTime.now().subtract(const Duration(days: 3, hours: 4, minutes: 7)), durationInMin: 30),
          CallHistory(date: DateTime.now().subtract(const Duration(days: 5, hours: 1, minutes: 9)), durationInMin: 41)
        ]),
    FanWaitingInfo(
        name: 'へんべえ',
        title: 'ユーザーを覚えておいてください',
        description: 'こんにちは！テキストが入りますテキストが入りますテキストが入りますテキストが入ります',
        waitingInMinute: 15,
        historyCalls: [
          CallHistory(date: DateTime.now().subtract(const Duration(days: 1, hours: 2, minutes: 5)), durationInMin: 12),
          CallHistory(date: DateTime.now().subtract(const Duration(days: 3, hours: 4, minutes: 7)), durationInMin: 30),
          CallHistory(date: DateTime.now().subtract(const Duration(days: 5, hours: 1, minutes: 9)), durationInMin: 41)
        ]),
    FanWaitingInfo(
        name: 'へんべえ',
        title: 'ユーザーを覚えておいてください',
        description: 'こんにちは！テキストが入りますテキストが入りますテキストが入りますテキストが入ります',
        waitingInMinute: 5,
        historyCalls: [
          CallHistory(date: DateTime.now().subtract(const Duration(days: 1, hours: 2, minutes: 5)), durationInMin: 12),
          CallHistory(date: DateTime.now().subtract(const Duration(days: 3, hours: 4, minutes: 7)), durationInMin: 30),
          CallHistory(date: DateTime.now().subtract(const Duration(days: 5, hours: 1, minutes: 9)), durationInMin: 41)
        ]),
    FanWaitingInfo(
        name: 'シルバーマン・サックス',
        title: 'ユーザーを覚えておいてください',
        description: 'こんにちは！テキストが入りますテキストが入りますテキストが入りますテキストが入ります',
        waitingInMinute: 3,
        historyCalls: [
          CallHistory(date: DateTime.now().subtract(const Duration(days: 1, hours: 2, minutes: 5)), durationInMin: 12),
          CallHistory(date: DateTime.now().subtract(const Duration(days: 3, hours: 4, minutes: 7)), durationInMin: 30),
          CallHistory(date: DateTime.now().subtract(const Duration(days: 5, hours: 1, minutes: 9)), durationInMin: 41)
        ]),
    FanWaitingInfo(
        name: 'へんべえ',
        title: 'ユーザーを覚えておいてください',
        description: 'こんにちは！テキストが入りますテキストが入りますテキストが入りますテキストが入ります',
        waitingInMinute: 2,
        historyCalls: [
          CallHistory(date: DateTime.now().subtract(const Duration(days: 1, hours: 2, minutes: 5)), durationInMin: 12),
          CallHistory(date: DateTime.now().subtract(const Duration(days: 3, hours: 4, minutes: 7)), durationInMin: 30),
          CallHistory(date: DateTime.now().subtract(const Duration(days: 5, hours: 1, minutes: 9)), durationInMin: 41)
        ]),
    FanWaitingInfo(
        name: 'へんべえ',
        title: 'ユーザーを覚えておいてください',
        description: 'こんにちは！テキストが入りますテキストが入りますテキストが入りますテキストが入ります',
        waitingInMinute: 1,
        historyCalls: [
          CallHistory(date: DateTime.now().subtract(const Duration(days: 1, hours: 2, minutes: 5)), durationInMin: 12),
          CallHistory(date: DateTime.now().subtract(const Duration(days: 3, hours: 4, minutes: 7)), durationInMin: 30),
          CallHistory(date: DateTime.now().subtract(const Duration(days: 5, hours: 1, minutes: 9)), durationInMin: 41)
        ])
  ];

  WaitingBloc()
      : super(const WaitingState(error: '', loadingState: PageState.initial)) {
    on<Init>(_onInit);
  }

  FutureOr<void> _onInit(Init event, Emitter<WaitingState> emit) async {
    emit(state.copyWith(loadingState: PageState.loading));
    await Future.delayed(const Duration(seconds: 1));

      emit(state.copyWith(
        fans: fans,
        loadingState: PageState.success,));
  }

}
