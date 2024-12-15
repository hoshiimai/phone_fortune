import 'dart:async';

import 'package:callmobile/core/model/response/model/user.dart';
import 'package:callmobile/ui/widgets/base/toast/app_toast.dart';
import 'package:callmobile/utils/app_assets.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:callmobile/core/model/enum/enum_role.dart';

import 'package:callmobile/core/model/response/error_from_server.dart';
import 'package:callmobile/core/model/response/login_response_data.dart';
import 'package:callmobile/helper/validation.dart';
import 'package:callmobile/locale/locale_key.dart';
import 'package:callmobile/ui/base/interactor/page_command.dart';
import 'package:callmobile/ui/base/interactor/page_states.dart';


import '../../../../../core/model/enum/enum_sns.dart';
import '../../../../../core/repository/interface/i_auth_repository.dart';

import '../../../../../utils/app_shared.dart';

part 'sign_in_event.dart';
part 'sing_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final IAuthRepository authRepository;
  SignInBloc({required this.authRepository})
      : super(const SignInState(error: '', status: PageState.initial)) {
    on<OnEmailChange>(_onEmailChange);
    on<OnPasswordChange>(_onPasswordChange);
    on<OnLogin>(_onLogin);
    on<OnSignInSocial>(_onSignInSocial);
  }

  FutureOr<void> _onEmailChange(OnEmailChange event, Emitter<SignInState> emit) {
    // final valid = Validation.validateEmail(event.text);
    emit(state.copyWith(
      email: event.text,
      // validEmail: valid,
    ));
  }

  FutureOr<void> _onPasswordChange(OnPasswordChange event, Emitter<SignInState> emit) {
    // final valid = Validation.validatePassword(event.text);
    emit(state.copyWith(
      password: event.text,
      // validPassword: valid,
    ));
  }

  FutureOr<void> _onLogin(OnLogin event, Emitter<SignInState> emit) async {
    final valid = Validation.validateEmail(state.email);
    final validPassword = Validation.validatePassword(state.password);
    if (valid.isEmpty && validPassword.isEmpty) {
      emit(state.copyWith(
        validEmail: valid,
        validPassword: validPassword,
        status: PageState.loadingFull,
      ));
      await Future.delayed(const Duration(seconds: 2));
      // TODO: remove
      if(state.email.contains('creator')) {
        Get.find<AppShared>().setUser(const User(
            id: 10000002,
            role: Role.creator,
            isOnline: true,
            initialCallTiming: 0,
            initialCallFee: 0,
            afterCallTiming: 0,
            afterCallFee: 0,
            evaluateScore: 0,
            totalEvaluated: 0,
            gender: 0,
            isEmailVerified: true,
            nickname: 'ナナコ',
            email: 'creator@gmail.com',
            avatar: Avatar(filePath: AppAssets.bg_avatar_png),
            isDeleted: false));
      } else {
        Get.find<AppShared>().setUser(const User(
            id: 10000001,
            role: Role.fan,
            isOnline: true,
            initialCallTiming: 0,
            initialCallFee: 0,
            afterCallTiming: 0,
            afterCallFee: 0,
            evaluateScore: 0,
            totalEvaluated: 0,
            gender: 0,
            isEmailVerified: true,
            email: 'abc@gmail.com',
            nickname: 'AKIRAaa',
            avatar: Avatar(filePath: AppAssets.bg_fan_avatar_png),
            isDeleted: false));
      }
      event.onLoginSuccess.call();
    } else {
      emit(state.copyWith(
        validEmail: valid,
        validPassword: validPassword,
      ));
    }
  }

  FutureOr<void> _onSignInSocial(OnSignInSocial event, Emitter<SignInState> emit) async {
    emit(state.copyWith(status: PageState.loadingFull));

    try {
      switch (event.type) {
        case Sns.google:
          await _handleGoogleSignIn(event, emit);
          break;
        case Sns.x:
          await _handleTwitterSignIn(event, emit);
          break;
        case Sns.facebook:
          await _handleFacebookSignIn(event, emit);
          break;
        case Sns.apple:
          await _handleAppleSignIn(event, emit);
          break;
        default:
          emit(state.copyWith(status: PageState.failure));
          showErrorToast(LocaleKey.unknownError.tr);
          break;
      }
    } catch (e) {
      _handleError(ErrorFromServer.unknownError(), emit, false);
    }
  }

  Future<void> _handleGoogleSignIn(OnSignInSocial event, Emitter<SignInState> emit) async {}

  Future<void> _handleTwitterSignIn(OnSignInSocial event, Emitter<SignInState> emit) async {}

  Future<void> _handleFacebookSignIn(OnSignInSocial event, Emitter<SignInState> emit) async {}

  Future<void> _handleAppleSignIn(OnSignInSocial event, Emitter<SignInState> emit) async {}

  Future<void> _handleAuthResponse(
      Either<ErrorFromServer, LoginResponseData> response, Emitter<SignInState> emit) async {
    await response.fold(
      (error) {
        _handleError(error, emit, true);
      },
      (data) async {},
    );
  }

  void _handleError(ErrorFromServer error, Emitter<SignInState> emit, bool shouldShowErrorToast) {
    if (shouldShowErrorToast) {
      showErrorToast(error.message ?? LocaleKey.unknownError.tr);
    }
    emit(state.copyWith(status: PageState.failure));
  }
}
