import 'dart:async';

import 'package:callmobile/core/model/business/gender_type.dart.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../../../core/model/enum/enum_role.dart';
import '../../../../core/model/response/model/user.dart';

import '../../../../utils/app_shared.dart';
import '../../../base/interactor/page_command.dart';
import '../../../base/interactor/page_states.dart';
import '../../../fan/main/interactor/main_bloc.dart';

part 'fan_profile_edit_event.dart';
part 'fan_profile_edit_state.dart';

class FanProfileEditBloc extends Bloc<FanProfileEditEvent, FanProfileEditState> {
  FanProfileEditBloc() : super(const FanProfileEditState(error: '', status: PageState.loading)) {
    on<Init>(_onInit);
    on<OnChangeGender>(_onChangeGender);
    on<OnChangeBirthDate>(_onChangeBirthDate);
  }

  FutureOr<void> _onInit(Init event, Emitter<FanProfileEditState> emit) async {
    final appShared = Get.find<AppShared>();
    emit(state.copyWith(
      user: event.user,
    ));
    if (event.user != null && event.user?.role == Role.creator) {
      // Listen to update creator state
      await emit.forEach(Get.find<MainBloc>().stream, onData: (mainBlocState) {
        if (mainBlocState.creatorUpdate?.creator != null &&
            mainBlocState.creatorUpdate?.creator.id == state.user?.id) {
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

  FutureOr<void> _onChangeGender(OnChangeGender event, Emitter<FanProfileEditState> emit) {
    emit(state.copyWith(
      gender: event.gender,
    ));
  }

  FutureOr<void> _onChangeBirthDate(OnChangeBirthDate event, Emitter<FanProfileEditState> emit) {
    emit(state.copyWith(
      birthDate: event.birthDate,
      validBirthDate: '',
    ));
  }
}
