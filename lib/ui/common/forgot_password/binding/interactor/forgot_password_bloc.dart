import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/repository/interface/i_auth_repository.dart';
import '../../../../../utils/helper/validation.dart';
import '../../../../base/interactor/page_command.dart';
import '../../../../base/interactor/page_states.dart';
import '../../../../widgets/base/toast/app_toast.dart';

part 'forgot_password_state.dart';
part 'fotgot_password_event.dart';

class ForgotPasswordBloc extends Bloc<ForgotPasswordEvent, ForgotPasswordState> {
  final IAuthRepository authRepository;
  ForgotPasswordBloc({required this.authRepository}) : super(const ForgotPasswordState(error: '', status: PageState.initial)) {
    on<OnEmailChange>(_onEmailChange);
    on<OnSubmit>(_onSubmit);
  }

  FutureOr<void> _onEmailChange(OnEmailChange event, Emitter<ForgotPasswordState> emit) {
    emit(state.copyWith(
      email: event.text,
    ));
  }

  FutureOr<void> _onSubmit(OnSubmit event, Emitter<ForgotPasswordState> emit) async {
    final valid = Validation.validateEmail(state.email);

    emit(state.copyWith(
      validEmail: valid,
    ));

    if (valid.isEmpty) {
      emit(state.copyWith(status: PageState.loadingFull));
      final response = await authRepository.forgotPassword(email: state.email);
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
