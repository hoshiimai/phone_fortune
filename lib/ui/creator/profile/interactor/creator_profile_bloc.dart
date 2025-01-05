import 'dart:async';

import 'package:callmobile/core/repository/interface/i_call_repository.dart';
import 'package:callmobile/ui/widgets/base/toast/app_toast.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../../../core/model/enum/enum_role.dart';
import '../../../../core/model/response/model/user.dart';

import '../../../../core/repository/interface/i_auth_repository.dart';
import '../../../../utils/app_shared.dart';
import '../../../base/interactor/page_command.dart';
import '../../../base/interactor/page_states.dart';

part 'creator_profile_event.dart';
part 'creator_profile_state.dart';

class CreatorProfileBloc extends Bloc<CreatorProfileEvent, CreatorProfileState> {
  final IAuthRepository authRepository;
  final ICallRepository callRepository;

  CreatorProfileBloc({required this.authRepository, required this.callRepository})
      : super(const CreatorProfileState(error: '', status: PageState.loading)) {
    on<Init>(_onInit);
    on<OnGetCreatorDetail>(_onGetCreatorDetail);
    on<OnRegisterCall>(_onRegisterCall);
  }

  FutureOr<void> _onInit(Init event, Emitter<CreatorProfileState> emit) async {
    final appShared = Get.find<AppShared>();
    emit(state.copyWith(
      creator: event.creator ?? appShared.getUser(),
      currentLoginUser: appShared.getUser(),
    ));
    if ( appShared.getUser()?.role == Role.creator) {
      // Listen to update current logged in user
      await emit.forEach(appShared.watchUser(), onData: (user) {
        return state.copyWith(currentLoginUser: user, creator: user);
      });
    } else {
      add(OnGetCreatorDetail(creatorId: event.creator!.id));
    }
  }

  FutureOr<void> _onGetCreatorDetail(OnGetCreatorDetail event, Emitter<CreatorProfileState> emit) async {
    final response = await authRepository.getCreatorDetail(creatorId: event.creatorId);
    response.fold((error) {}, (creator) {
      emit(state.copyWith(
        creator: creator,
      ));
    });
  }

  FutureOr<void> _onRegisterCall(OnRegisterCall event, Emitter<CreatorProfileState> emit) async {
    emit(state.copyWith(status: PageState.loadingFull));
    final response = await callRepository.registerCall(creatorId: event.creatorId);
    response.fold((error) {
      showErrorToast(error.message!);
      emit(state.copyWith(status: PageState.failure));
    }, (message) {
      showSuccessToast(message);
      emit(state.copyWith(status: PageState.success));
      event.onRegisterSuccess.call();
    });
  }
}
