import 'dart:async';
import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../../../core/model/response/model/user.dart';
import '../../../../core/repository/interface/i_auth_repository.dart';
import '../../../../utils/helper/validation.dart';

import '../../../../utils/app_shared.dart';
import '../../../base/interactor/page_states.dart';
import '../../../widgets/base/toast/app_toast.dart';

part 'creator_profile_edit_event.dart';
part 'creator_profile_edit_state.dart';

class CreatorProfileEditBloc extends Bloc<CreatorProfileEditEvent, CreatorProfileEditState> {
  final IAuthRepository authRepository;
  CreatorProfileEditBloc({required this.authRepository,}) : super(const CreatorProfileEditState(status: PageState.initial)) {
    on<Init>(_onInit);
    on<OnWelcomeMessageChanged>(_onWelcomeMessageChanged);
    on<OnNameChanged>(_onNameChanged);
    on<OnAvatarSelected>(_onAvatarSelected);
    on<OnCoverSelected>(_onCoverSelected);
    on<OnUpdateProfile>(_onUpdateProfile);
    on<OnGetUserDetail>(_onGetUserDetail);
  }

  FutureOr<void> _onInit(Init event, Emitter<CreatorProfileEditState> emit) {
    final appShared = Get.find<AppShared>();
    final user = appShared.getUser()!;
    emit(
      state.copyWith(
          currentLoginUser: user,
          name: user.fullName,
          welcomeMessage: user.welcomeMessages),
    );
  }

  FutureOr<void> _onWelcomeMessageChanged(OnWelcomeMessageChanged event, Emitter<CreatorProfileEditState> emit) {
    emit(state.copyWith(
      welcomeMessage: event.welcomeMessage.trim(),
    ));
  }

  FutureOr<void> _onNameChanged(OnNameChanged event, Emitter<CreatorProfileEditState> emit) {
    emit(state.copyWith(
      name: event.name.trim(),
      validName: Validation.validateName(fieldName: '名前', value: event.name.trim()),
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
    if(state.name?.isNotEmpty ?? false) {
      emit(state.copyWith(
        validName: '',
        status: PageState.loadingFull,
      ));
      final response = await authRepository.updateIdolProfile(
        fullName: state.name,
        welcomeMessage: state.welcomeMessage,
        avatar: state.avatar,
        cover: state.cover,
      );
      response.fold((error) {
        showErrorToast(error.message);
        emit(state.copyWith(
          status: PageState.failure,
        ));
      }, (message) {
        add(const OnGetUserDetail());
        showSuccessToast(message);
        emit(state.copyWith(
          status: PageState.success,
        ));
        event.onUpdateProfileSuccess.call();
      });
    } else {
      emit(state.copyWith(
        validName: Validation.validateName(fieldName: '名前', value: state.name?.trim()),
      ));
    }
  }

  FutureOr<void> _onGetUserDetail(OnGetUserDetail event, Emitter<CreatorProfileEditState> emit) async {
    final appShared = Get.find<AppShared>();
    final response = await authRepository.getProfile();
    response.fold((error) {}, (user) {
      appShared.setUser(user);
      emit(state.copyWith(
        currentLoginUser: user,
      ));
    });
  }
}
