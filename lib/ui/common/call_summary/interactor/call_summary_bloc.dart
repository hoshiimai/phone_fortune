import 'dart:async';

import 'package:callmobile/core/repository/interface/i_auth_repository.dart';
import 'package:callmobile/core/repository/interface/i_call_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/model/response/model/room.dart';
import '../../../base/interactor/page_command.dart';
import '../../../base/interactor/page_states.dart';

part 'call_summary_event.dart';
part 'call_summary_state.dart';

class CallSummaryBloc extends Bloc<CallSummaryEvent, CallSummaryState> {
  final ICallRepository callRepository;

  CallSummaryBloc({
    required this.callRepository,
  }) : super(const CallSummaryState(
          error: '',
          status: PageState.loading,
        )) {
    on<Init>(_init);
  }

  FutureOr<void> _init(Init event, Emitter<CallSummaryState> emit) async {
    final response = await callRepository.getRoomDetail(roomId: event.roomId);
    response.fold((error) {}, (room) {
      emit(state.copyWith(room: room));
    });
  }
}
