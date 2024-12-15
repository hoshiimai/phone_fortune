import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../../../core/model/enum/password_type.dart';
import '../../../../core/model/response/model/user.dart';
import '../../../../core/repository/interface/i_auth_repository.dart';
import '../../../../helper/validation.dart';
import '../../../../utils/app_shared.dart';
import '../../../base/interactor/page_states.dart';
import '../../../widgets/base/toast/app_toast.dart';

part 'info_event.dart';

part 'info_state.dart';

class InfoBloc extends Bloc<InfoEvent, InfoState> {
  final IAuthRepository authRepository;

  InfoBloc({required this.authRepository})
      : super(const InfoState(error: '', verifyEmailStatus: PageState.initial, status: PageState.initial)) {
    on<Init>(_onInit);
    on<OnUpdateUser>(_onUpdateUser);
    on<OnEmailChange>(_onEmailChange);
    on<OnSubmitEmail>(_onSubmitEmail);
    on<OnPasswordChange>(_onPasswordChange);
    on<OnSubmitPassword>(_onSubmitPassword);
    on<OnChangeCode>(_onChangeCode);
    on<OnVerifyEmailCode>(_onVerifyEmailCode);
  }

  FutureOr<void> _onInit(Init event, Emitter<InfoState> emit) {
    final user = Get.find<AppShared>().getUser();
    emit(state.copyWith(
      user: user,
    ));
  }

  FutureOr<void> _onUpdateUser(OnUpdateUser event, Emitter<InfoState> emit) {
    emit(state.copyWith(
      user: event.user,
    ));
  }

  FutureOr<void> _onEmailChange(OnEmailChange event, Emitter<InfoState> emit) {
    final valid = Validation.validateEmail(event.text);
    emit(state.copyWith(
      email: event.text,
      validEmail: valid,
    ));
  }

  FutureOr<void> _onPasswordChange(OnPasswordChange event, Emitter<InfoState> emit) {
    final valid = event.type == PasswordType.current ? Validation.validatePassword(event.text) : Validation.validateUpdatePassword(event.text);
    final validConfirm = Validation.validateMatchConfirmPassword(confirmPassword: event.text, password: state.newPass, isUpdate: true);
    emit(state.copyWith(
      currentPass: event.type == PasswordType.current ? event.text : state.currentPass,
      validCurrentPass: event.type == PasswordType.current ? valid : state.validCurrentPass,
      newPass: event.type == PasswordType.newPass ? event.text : state.newPass,
      validNewPass: event.type == PasswordType.newPass ? valid : state.validNewPass,
      confirmPass: event.type == PasswordType.confirmPass ? event.text : state.confirmPass,
      validConfirmPass: event.type == PasswordType.confirmPass ? validConfirm : state.validConfirmPass,
    ));
  }

  FutureOr<void> _onSubmitEmail(OnSubmitEmail event, Emitter<InfoState> emit) async {
    final valid = Validation.validateEmail(state.email);
    if (valid.isEmpty) {
      emit(state.copyWith(
          code: '',
          validEmail: valid,
          verifyEmailStatus: event.isFromVerify ? PageState.loadingFull : state.verifyEmailStatus,
          status: event.isFromVerify ? state.status : PageState.loadingFull));

        emit(state.copyWith(
            verifyEmailStatus: event.isFromVerify ? PageState.success : state.verifyEmailStatus,
            status: event.isFromVerify ? state.status : PageState.success));
    } else {
      emit(state.copyWith(
        code: '',
        validEmail: valid,
      ));
    }
  }

  FutureOr<void> _onSubmitPassword(OnSubmitPassword event, Emitter<InfoState> emit) async {
    final validCurrentPass = Validation.validatePassword(state.currentPass);
    final validNewPass = Validation.validateUpdatePassword(state.newPass);
    final validConfirmPass =
        Validation.validateMatchConfirmPassword(confirmPassword: state.confirmPass, password: state.newPass, isUpdate: true);
    if (validCurrentPass.isEmpty && validNewPass.isEmpty && validConfirmPass.isEmpty) {
      emit(state.copyWith(
          validCurrentPass: validCurrentPass,
          validNewPass: validNewPass,
          validConfirmPass: validConfirmPass,
          status: PageState.loadingFull));

        showSuccessToast('Update password success');
        emit(state.copyWith(status: PageState.success));
        event.onUpdatePasswordSuccess.call();
    } else {
      emit(state.copyWith(
        validCurrentPass: validCurrentPass,
        validNewPass: validNewPass,
        validConfirmPass: validConfirmPass,
      ));
    }
  }

  FutureOr<void> _onChangeCode(OnChangeCode event, Emitter<InfoState> emit) {
    emit(state.copyWith(
      code: event.value,
    ));

    if (state.code.length == 4) {
      add(const OnVerifyEmailCode());
    }
  }

  FutureOr<void> _onVerifyEmailCode(OnVerifyEmailCode event, Emitter<InfoState> emit) async {
    emit(state.copyWith(
      verifyEmailStatus: PageState.loadingFull,
    ));
    await Future.delayed(const Duration(seconds: 2));
      final appShared = Get.find<AppShared>();
      final user = state.user?.copyWith(email: state.email);
      appShared.setUser(user);
      emit(state.copyWith(verifyEmailStatus: PageState.success, user: user));
  }
}
