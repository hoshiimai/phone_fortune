import 'dart:async';

import 'package:callmobile/core/model/business/gender_type.dart.dart';
import 'package:callmobile/core/model/request/complete_register_request.dart';
import 'package:callmobile/utils/app_pages.dart';
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
      fromPage: event.fromPage,
      name: event.name,
      password: event.password,
      gender: event.gender,
      birthDate: event.birthDate,
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

    if(state.fromPage == AppPages.signUp) {
      final response = await authRepository.completeRegister(request: CompleteRegisterRequest(email: state.email, code: state.otp));
      await response.fold((error) {
        emit(state.copyWith(status: PageState.failure));
        showErrorToast(error.message);
      }, (data) async {
        emit(state.copyWith(
          status: PageState.success,
        ));
        event.onVerifySuccess.call('');
      });
    } else if (state.fromPage == AppPages.forgotPassword) {
      final response = await authRepository.verifyCode(email: state.email, code: state.otp);
      await response.fold((error) {
        emit(state.copyWith(status: PageState.failure));
        showErrorToast(error.message);
      }, (data) async {
        emit(state.copyWith(
          status: PageState.success,
        ));
        event.onVerifySuccess.call(data.accessToken ?? '');
      });
    } else {
      // TODO: Remove hardcode
      await Future.delayed((const Duration(seconds: 2)));
      emit(state.copyWith(
        status: PageState.success,
      ));
      event.onVerifySuccess.call('successToken');
    }
  }

  FutureOr<void> _onResendCode(OnResendCode event, Emitter<VerifyOtpState> emit) async {
    emit(state.copyWith(
      status: PageState.loadingFull,
      otp: '',
    ));

    if(state.fromPage == AppPages.signUp) {
      final response = await authRepository.register(
          name: state.name!,
          email: state.email,
          password: state.password!,
          gender: state.gender!,
          birthDate: state.birthDate!);
      response.fold((error) {
        showErrorToast(error.message);
        emit(state.copyWith(status: PageState.failure));
      }, (message) {
        showSuccessToast(message);
        emit(state.copyWith(status: PageState.success));
      });
    } else if(state.fromPage == AppPages.forgotPassword) {
      final response = await authRepository.forgotPassword(email: state.email);
      response.fold((error) {
        showErrorToast(error.message);
        emit(state.copyWith(status: PageState.failure));
      }, (message) {
        showSuccessToast(message);
        emit(state.copyWith(status: PageState.success));
      });
    } else {
      // TODO: remove harcode
      await Future.delayed((const Duration(seconds: 2)));
      emit(state.copyWith(
        status: PageState.success,
      ));
      showSuccessToast('Resend code successfully');
    }
  }
}
