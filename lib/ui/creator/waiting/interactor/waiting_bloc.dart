import 'dart:async';

import 'package:callmobile/core/model/response/model/creator.dart';
import 'package:callmobile/ui/creator/main/interactor/main_creator_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../../../core/model/business/call_history.dart';
import '../../../../core/model/business/creator_status.dart';
import '../../../../core/model/business/fan_waiting_info.dart';
import '../../../../core/model/response/model/user.dart';
import '../../../../core/repository/interface/i_auth_repository.dart';
import '../../../base/interactor/page_command.dart';
import '../../../base/interactor/page_states.dart';

part 'waiting_event.dart';
part 'waiting_state.dart';

class WaitingBloc extends Bloc<WaitingEvent, WaitingState> {
  final IAuthRepository authRepository;
  WaitingBloc({required this.authRepository,})
      : super(const WaitingState(error: '', status: PageState.initial)) {
    on<Init>(_onInit);
    on<OnGetWaitingFans>(_onGetWaitingFans);
  }

  FutureOr<void> _onInit(Init event, Emitter<WaitingState> emit) async {
    add(const OnGetWaitingFans());
  }

  FutureOr<void> _onGetWaitingFans(OnGetWaitingFans event, Emitter<WaitingState> emit) async {
    emit(state.copyWith(
      status: PageState.loading,
    ));
    final response = await authRepository.getWaitingFans();
    response.fold((error) {
      emit(state.copyWith(fans: [], status: PageState.failure));
    }, (fans) {
      fans.sort((fan1, fan2) => (fan2.timeWaiting ?? 0) - (fan1.timeWaiting ?? 0));
      emit(state.copyWith(fans: fans, status: PageState.success));
      Get.find<MainCreatorBloc>().add(OnUpdateWaitingCount(fans.isNotEmpty ? fans.length : null));
    });
  }

}
