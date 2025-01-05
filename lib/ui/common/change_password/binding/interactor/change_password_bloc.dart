import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/repository/interface/i_auth_repository.dart';
import '../../../../../utils/helper/validation.dart';
import '../../../../base/interactor/page_states.dart';
import '../../../../widgets/base/toast/app_toast.dart';

part 'change_password_event.dart';
part 'change_password_state.dart';

class ChangePasswordBloc extends Bloc<ChangePasswordEvent, ChangePasswordState> {
  final IAuthRepository authRepository;
  ChangePasswordBloc({required this.authRepository}) : super(const ChangePasswordState(error: '', status: PageState.initial)) {
    on<Init>(_onInit);
    on<OnConfirmPasswordChanged>(_onConfirmPasswordChanged);
    on<OnPasswordChange>(_onPasswordChange);
    on<OnSubmit>(_onSubmit);
  }

  FutureOr<void> _onInit(Init event, Emitter<ChangePasswordState> emit) {
    emit(state.copyWith(
      accessToken: event.accessToken,
    ));
  }

  FutureOr<void> _onPasswordChange(OnPasswordChange event, Emitter<ChangePasswordState> emit) {
    final validPassword = Validation.validatePassword(event.text);
    emit(state.copyWith(
      password: event.text,
      validPassword: validPassword,
    ));
  }

  FutureOr<void> _onConfirmPasswordChanged(OnConfirmPasswordChanged event, Emitter<ChangePasswordState> emit) {
    final validConfirmPassword = Validation.validateMatchConfirmPassword(confirmPassword: event.text, password: state.password);
    emit(state.copyWith(
      confirmPassword: event.text,
      validConfirmPassword:  validConfirmPassword,
    ));
  }

  FutureOr<void> _onSubmit(OnSubmit event, Emitter<ChangePasswordState> emit) async {
    final validPassword = Validation.validatePassword(state.password);
    final validConfirmPassword = Validation.validateMatchConfirmPassword(confirmPassword: state.confirmPassword, password: state.password);

    emit(state.copyWith(
      validPassword: validPassword,
      validConfirmPassword: validConfirmPassword,
    ));

    if (validConfirmPassword.isEmpty && validPassword.isEmpty) {
      emit(state.copyWith(status: PageState.loadingFull));
      final response = await authRepository.resetPassword(accessToken: state.accessToken, password: state.password, confirmPassword: state.confirmPassword);
      response.fold((error) {
        showErrorToast(error.message);
        emit(state.copyWith(status: PageState.failure));
      }, (message) {
        showSuccessToast(message);
        emit(state.copyWith(status: PageState.success));
      });
    }
  }
}
