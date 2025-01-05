import 'dart:async';

import 'package:callmobile/core/model/business/creator_status.dart';
import 'package:callmobile/core/model/response/error_from_server.dart';
import 'package:callmobile/ui/creator/main/interactor/main_creator_bloc.dart';
import 'package:callmobile/ui/widgets/base/toast/app_toast.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import '../../../../core/model/response/model/user.dart';
import '../../../../core/repository/interface/i_auth_repository.dart';
import '../../../../utils/app_shared.dart';
import '../../../base/interactor/page_command.dart';
import '../../../base/interactor/page_states.dart';

part 'creator_home_event.dart';
part 'creator_home_state.dart';

class CreatorHomeBloc extends Bloc<CreatorHomeEvent, CreatorHomeState> {
  final IAuthRepository authRepository;
  final MainCreatorBloc mainBloc;
  CreatorHomeBloc({required this.mainBloc, required this.authRepository})
      : super(const CreatorHomeState(error: '', status: PageState.initial)) {
    on<Init>(_onInit);
    on<OnUpdateStatus>(_onUpdateStatus);
    on<OnGetWaitingFans>(_onGetWaitingFans);
  }

  FutureOr<void> _onInit(Init event, Emitter<CreatorHomeState> emit) async {
    add(OnGetWaitingFans(isRefresh: event.isRefresh));
    if(!event.isRefresh) {
      final appShared = Get.find<AppShared>();
      await emit.forEach(appShared.watchUser(), onData: (user) {
        return state.copyWith(currentLoggedInUser: user, currentStatus: user?.status ?? Status.offline);
      });
    }
  }

  FutureOr<void> _onUpdateStatus(OnUpdateStatus event, Emitter<CreatorHomeState> emit) async {
    final currentState = state.currentStatus;
    emit(state.copyWith(
      currentStatus: event.status,
    ));
    final response = await authRepository.updateStatus(status: event.status);
    response.fold((error) {
      showErrorToast(error.message);
      emit(state.copyWith(currentStatus: currentState));
    }, (message) {
      Get.find<AppShared>().setUser(state.currentLoggedInUser?.copyWith(status: event.status));
    });
  }

  FutureOr<void> _onGetWaitingFans(OnGetWaitingFans event, Emitter<CreatorHomeState> emit) async {
    emit(state.copyWith(
      status: event.isRefresh ? state.status : PageState.loading, waitingFans: [],
    ));
    final responses = await Future.wait([authRepository.getWaitingFans(), authRepository.getRecentCallFan()]) ;

    final waitingFansResponse = responses[0] as Either<ErrorFromServer, List<User>>;
    waitingFansResponse.fold((error) {
      emit(state.copyWith(waitingFans: [], status: PageState.failure));
    }, (fans) {
      fans.sort((fan1, fan2) => (fan2.timeWaiting ?? 0) - (fan1.timeWaiting ?? 0));
      emit(state.copyWith(waitingFans: fans, status: PageState.success));
      Get.find<MainCreatorBloc>().add(OnUpdateWaitingCount(fans.isNotEmpty ? fans.length : null));
    });

    final recentCallFan = responses[1] as Either<ErrorFromServer, User>;
    recentCallFan.fold((error) {
    }, (fan) {
      emit(state.copyWith(recentCallFan: fan));
    });
  }
}
