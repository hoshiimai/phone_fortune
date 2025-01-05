import 'dart:async';
import 'dart:io';

import 'package:callmobile/core/model/business/gender_type.dart.dart';
import 'package:callmobile/utils/helper/validation.dart';
import 'package:callmobile/utils/app_utils.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../../../core/model/response/model/user.dart';

import '../../../../core/repository/interface/i_auth_repository.dart';

import '../../../../utils/app_shared.dart';
import '../../../base/interactor/page_command.dart';
import '../../../base/interactor/page_states.dart';
import '../../../widgets/base/toast/app_toast.dart';

part 'fan_profile_edit_event.dart';
part 'fan_profile_edit_state.dart';

class FanProfileEditBloc extends Bloc<FanProfileEditEvent, FanProfileEditState> {
  final IAuthRepository authRepository;
  FanProfileEditBloc({required this.authRepository}) : super(const FanProfileEditState(error: '', status: PageState.initial)) {
    on<Init>(_onInit);
    on<OnChangeGender>(_onChangeGender);
    on<OnChangeBirthDate>(_onChangeBirthDate);
    on<OnChangeName>(_onChangeName);
    on<OnChangeWelcomeMessage>(_onChangeWelcomeMessage);
    on<OnAvatarSelected>(_onAvatarSelected);
    on<OnUpdateProfile>(_onUpdateProfile);
    on<OnGetUserDetail>(_onGetUserDetail);
  }

  FutureOr<void> _onInit(Init event, Emitter<FanProfileEditState> emit) async {
    final appShared = Get.find<AppShared>();
    final user = appShared.getUser()!;
    emit(
      state.copyWith(
          currentLoginUser: user,
          name: user.fullName,
          gender: GenderType.fromInt(user.gender!),
          birthDate: AppUtils.convertToDate(user.birthdate!),
          welcomeMessage: user.welcomeMessages),
    );
    event.onInitCompleted.call(user);
  }

  FutureOr<void> _onChangeGender(OnChangeGender event, Emitter<FanProfileEditState> emit) {
    emit(state.copyWith(
      gender: event.gender,
    ));
  }

  FutureOr<void> _onChangeBirthDate(OnChangeBirthDate event, Emitter<FanProfileEditState> emit) {
    emit(state.copyWith(
      birthDate: event.birthDate,
    ));
  }

  FutureOr<void> _onChangeName(OnChangeName event, Emitter<FanProfileEditState> emit) {
    emit(state.copyWith(
      name: event.name.trim(),
      validName: Validation.validateName(fieldName: '名前', value: event.name.trim()),
    ));
  }

  FutureOr<void> _onChangeWelcomeMessage(OnChangeWelcomeMessage event, Emitter<FanProfileEditState> emit) {
    emit(state.copyWith(
      welcomeMessage: event.welcomeMessage.trim(),
    ));
  }

  FutureOr<void> _onAvatarSelected(OnAvatarSelected event, Emitter<FanProfileEditState> emit) {
    emit(state.copyWith(
      avatar: event.file,
    ));
  }

  FutureOr<void> _onUpdateProfile(OnUpdateProfile event, Emitter<FanProfileEditState> emit) async {
    if(state.name.isNotEmpty) {
      emit(state.copyWith(
        status: PageState.loadingFull,
      ));
      final response = await authRepository.updateProfile(
        fullName: state.name,
        welcomeMessage: state.welcomeMessage,
        avatar: state.avatar,
        gender: state.gender!.toInt(),
        birthDate: AppUtils.formatDate(state.birthDate!),
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
    }
  }

  FutureOr<void> _onGetUserDetail(OnGetUserDetail event, Emitter<FanProfileEditState> emit) async {
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
