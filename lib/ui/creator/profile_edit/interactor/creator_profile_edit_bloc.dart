import 'dart:async';
import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../../../core/model/response/model/user.dart';
import '../../../../core/repository/interface/i_auth_repository.dart';
import '../../../../utils/app_shared.dart';
import '../../../base/interactor/page_states.dart';

part 'creator_profile_edit_event.dart';
part 'creator_profile_edit_state.dart';

class CreatorProfileEditBloc extends Bloc<CreatorProfileEditEvent, CreatorProfileEditState> {
  final IAuthRepository authRepository;
  CreatorProfileEditBloc({required this.authRepository,}) : super(const CreatorProfileEditState(status: PageState.initial)) {
    on<Init>(_onInit);
    on<OnWelcomeMessageChanged>(_onWelcomeMessageChanged);
    on<OnNickNameChanged>(_onNickNameChanged);
    on<OnAvatarSelected>(_onAvatarSelected);
    on<OnCoverSelected>(_onCoverSelected);
    on<OnUpdateProfile>(_onUpdateProfile);
    on<OnGetUserDetail>(_onGetUserDetail);
  }

  FutureOr<void> _onInit(Init event, Emitter<CreatorProfileEditState> emit) {
    final appShared = Get.find<AppShared>();
    final user = appShared.getUser();
    emit(state.copyWith(
        user: user,
        welcomeMessages: user?.welcomeMessages ?? '',
        nickName: user?.nickname ?? '',));
  }

  FutureOr<void> _onWelcomeMessageChanged(OnWelcomeMessageChanged event, Emitter<CreatorProfileEditState> emit) {
    emit(state.copyWith(
      welcomeMessages: event.welcomeMessages,
    ));
  }

  FutureOr<void> _onNickNameChanged(OnNickNameChanged event, Emitter<CreatorProfileEditState> emit) {
    emit(state.copyWith(
      nickName: event.nickName,
    ));
  }

  FutureOr<void> _onAvatarSelected(OnAvatarSelected event, Emitter<CreatorProfileEditState> emit) {
    emit(state.copyWith(
      avatar: event.file,
    ));
  }

  FutureOr<void> _onCoverSelected(OnCoverSelected event, Emitter<CreatorProfileEditState> emit) {
    emit(state.copyWith(
      cover: event.file,
    ));
  }

  FutureOr<void> _onUpdateProfile(OnUpdateProfile event, Emitter<CreatorProfileEditState> emit) async {
    if(!((state.nickName?.isEmpty ?? true) && (state.welcomeMessages?.isEmpty ?? true) && state.avatar == null && state.cover == null)) {
      emit(state.copyWith(
        status: PageState.loadingFull,
      ));
     await Future.delayed(const Duration(seconds: 1));
      event.onUpdateProfileSuccess.call();
    }
  }

  FutureOr<void> _onGetUserDetail(OnGetUserDetail event, Emitter<CreatorProfileEditState> emit) async {
    final appShared = Get.find<AppShared>();
    emit(state.copyWith(
      user: appShared.getUser(),
    ));
  }
}
