import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/repository/interface/i_auth_repository.dart';
import '../../../base/interactor/page_command.dart';
import '../../../base/interactor/page_states.dart';
import '../../../widgets/base/toast/app_toast.dart';

part 'verify_otp_event.dart';
part 'verify_otp_state.dart';

class VerifyOtpBloc extends Bloc<VerifyOtpEvent, VerifyOtpState> {
  final IAuthRepository authRepository;
  VerifyOtpBloc({required this.authRepository})
      : super(const VerifyOtpState(error: '', status: PageState.initial)) {
    on<Init>(_onInit);
    on<OnChangeOtp>(_onChangeOtp);
    on<OnNext>(_onNext);
    on<OnResendCode>(_onResendCode);
  }

  FutureOr<void> _onInit(Init event, Emitter<VerifyOtpState> emit) {
    emit(state.copyWith(
      email: event.email,
    ));
  }

  FutureOr<void> _onChangeOtp(OnChangeOtp event, Emitter<VerifyOtpState> emit) {
    emit(state.copyWith(
      otp: event.value,
    ));

    if (state.otp.length == 4) {
      add(OnNext(event.onVerifySuccess));
    }
  }

  FutureOr<void> _onNext(OnNext event, Emitter<VerifyOtpState> emit) async {
    emit(state.copyWith(
      status: PageState.loadingFull,
    ));
    await Future.delayed((const Duration(seconds: 2)));
      emit(state.copyWith(
        status: PageState.success,
      ));
      event.onVerifySuccess.call('successToken');
    // final response = await authRepository.verifyCode(email: state.email, code: state.otp);
    // await response.fold((error) {
    //   emit(state.copyWith(status: PageState.failure));
    //   showErrorToast(error.message);
    // }, (data) async {
    //   emit(state.copyWith(
    //     status: PageState.success,
    //   ));
    //   event.onVerifySuccess.call(data.accessToken!);
    // });
  }

  FutureOr<void> _onResendCode(OnResendCode event, Emitter<VerifyOtpState> emit) async {
    emit(state.copyWith(
      status: PageState.loadingFull,
      otp: '',
    ));

    await Future.delayed((const Duration(seconds: 2)));
    emit(state.copyWith(
      status: PageState.success,
    ));
    showSuccessToast('Resend code successfully');
  }
}
