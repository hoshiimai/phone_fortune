import 'dart:async';

import 'package:callmobile/core/model/business/gender_type.dart.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../../../../core/repository/interface/i_auth_repository.dart';
import '../../../../../helper/validation.dart';
import '../../../../../locale/locale_key.dart';
import '../../../../base/interactor/page_command.dart';
import '../../../../base/interactor/page_states.dart';
import '../../../../widgets/base/toast/app_toast.dart';

part 'sign_up_event.dart';
part 'sing_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final IAuthRepository authRepository;
  SignUpBloc({required this.authRepository}) : super(const SignUpState(error: '', status: PageState.initial)) {
    on<OnEmailChange>(_onEmailChange);
    on<OnPasswordChange>(_onPasswordChange);
    on<OnNameChange>(_onNameChange);
    on<OnChangeBirthDate>(_onChangeBirthDate);
    on<OnChangeGender>(_onChangeGender);
    on<OnRegister>(_onRegister);
  }

  FutureOr<void> _onEmailChange(OnEmailChange event, Emitter<SignUpState> emit) {
    emit(state.copyWith(
      email: event.text,
    ));
  }

  FutureOr<void> _onPasswordChange(OnPasswordChange event, Emitter<SignUpState> emit) {
    emit(state.copyWith(
      password: event.text,
    ));
  }

  FutureOr<void> _onNameChange(OnNameChange event, Emitter<SignUpState> emit) {
    emit(state.copyWith(
      name: event.text,
    ));
  }

  FutureOr<void> _onChangeBirthDate(OnChangeBirthDate event, Emitter<SignUpState> emit) {
    emit(state.copyWith(
      birthDate: event.birthDate,
      validBirthDate: '',
    ));
  }

  FutureOr<void> _onChangeGender(OnChangeGender event, Emitter<SignUpState> emit) {
    emit(state.copyWith(
      gender: event.gender,
    ));
  }

  FutureOr<void> _onRegister(OnRegister event, Emitter<SignUpState> emit) async {
    final valid = Validation.validateEmail(state.email);
    final validPassword = Validation.validatePassword(state.password);
    final validName = Validation.validateName(fieldName: LocaleKey.name.tr, value: state.name);
    final validBirthDate = state.birthDate == null ? LocaleKey.birthDateIsRequired.tr : '';

    if (valid.isEmpty && validPassword.isEmpty && validName.isEmpty && validBirthDate.isEmpty) {
      emit(state.copyWith(
          validEmail: valid,
          validPassword:
          validPassword,
          validName: validName,
          status: PageState.loadingFull)
      );
      await Future.delayed(const Duration(seconds: 2));
      showSuccessToast('Submit success');
      emit(state.copyWith(status: PageState.success));
    } else {
      emit(state.copyWith(
        validEmail: valid,
        validPassword: validPassword,
        validName: validName,
        validBirthDate: validBirthDate,
      ));
    }
  }
}
