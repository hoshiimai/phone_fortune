import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../../../core/model/enum/enum_role.dart';
import '../../../../core/model/response/model/user.dart';

import '../../../../utils/app_shared.dart';
import '../../../base/interactor/page_command.dart';
import '../../../base/interactor/page_states.dart';
import '../../../fan/main/interactor/main_bloc.dart';

part 'fan_profile_event.dart';
part 'fan_profile_state.dart';

class FanProfileBloc extends Bloc<FanProfileEvent, FanProfileState> {
  FanProfileBloc()
      : super(const FanProfileState(error: '', status: PageState.loading)) {
    on<Init>(_onInit);
  }

  FutureOr<void> _onInit(Init event, Emitter<FanProfileState> emit) async {
    final appShared = Get.find<AppShared>();
    emit(state.copyWith(
      user: event.user,
    ));
    if(event.user != null && event.user?.role == Role.creator) {
      // Listen to update creator state
      await emit.forEach(Get.find<MainBloc>().stream, onData: (mainBlocState) {
        if(mainBlocState.creatorUpdate?.creator != null && mainBlocState.creatorUpdate?.creator.id == state.user?.id) {
          return state.copyWith(user: mainBlocState.creatorUpdate?.creator);
        }
        return state;
      });
    } else {
      // Listen to update current logged in user
      await emit.forEach(appShared.watchUser(), onData: (user) {
        return state.copyWith(currentLoginUser: user);
      });
    }
  }
}
