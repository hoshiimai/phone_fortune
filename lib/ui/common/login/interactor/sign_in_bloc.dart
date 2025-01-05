import 'dart:async';

import 'package:callmobile/core/model/enum/enum_role.dart';
import 'package:callmobile/utils/helper/validation.dart';
import 'package:callmobile/ui/base/interactor/page_command.dart';
import 'package:callmobile/ui/base/interactor/page_states.dart';
import 'package:callmobile/ui/widgets/base/toast/app_toast.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../../../../core/repository/interface/i_auth_repository.dart';
import '../../../../../utils/app_shared.dart';
import '../../../../core/model/request/login_request.dart';
import '../../../../utils/app_pages.dart';

part 'sign_in_event.dart';
part 'sing_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final IAuthRepository authRepository;
  SignInBloc({required this.authRepository})
      : super(const SignInState(error: '', status: PageState.initial)) {
    on<OnEmailChange>(_onEmailChange);
    on<OnPasswordChange>(_onPasswordChange);
    on<OnLogin>(_onLogin);
  }

  FutureOr<void> _onEmailChange(OnEmailChange event, Emitter<SignInState> emit) {
    emit(state.copyWith(
      email: event.text,
    ));
  }

  FutureOr<void> _onPasswordChange(OnPasswordChange event, Emitter<SignInState> emit) {
    emit(state.copyWith(
      password: event.text,
    ));
  }

  FutureOr<void> _onLogin(OnLogin event, Emitter<SignInState> emit) async {
    final appShared = Get.find<AppShared>();
    final valid = Validation.validateEmail(state.email);
    final validPassword = Validation.validatePassword(state.password);
    if (valid.isEmpty && validPassword.isEmpty) {
      emit(state.copyWith(
        validEmail: valid,
        validPassword: validPassword,
        status: PageState.loadingFull,
      ));

      // await Get.find<FirebaseMessagingManager>().fetchAndSaveFcmToken();
      final response = await authRepository.login(LoginRequest(
          email: state.email, password: state.password,));
      response.fold((error) {
        showErrorToast(error.message);
        emit(state.copyWith(status: PageState.failure));
      }, (data) async {
        if (data.accessToken?.isNotEmpty ?? false) {
          emit(state.copyWith(status: PageState.success));
          final appShared = Get.find<AppShared>();
          await appShared.setAccessTokenValue(data.accessToken!);
          await appShared.setRefreshTokenValue(data.refreshToken!);
          await appShared.setUser(data.user);
          // Get.find<FirebaseMessagingManager>().registerTokenFCM();
          final routeName = data.user?.role == Role.creator ? AppPages.mainCreator : AppPages.main;
          event.onLoginSuccess.call(routeName);
        }
      });
    } else {
      emit(state.copyWith(
        validEmail: valid,
        validPassword: validPassword,
      ));
    }
  }
}
