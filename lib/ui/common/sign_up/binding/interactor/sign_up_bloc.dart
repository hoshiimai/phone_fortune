import 'dart:async';

import 'package:callmobile/core/model/business/gender_type.dart.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/repository/interface/i_auth_repository.dart';
import '../../../../../utils/helper/validation.dart';
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
    final validName = Validation.validateName(fieldName: '名前', value: state.name);
    final validBirthDate = state.birthDate == null ? '生年月日は必須です' : '';

    if (valid.isEmpty && validPassword.isEmpty && validName.isEmpty && validBirthDate.isEmpty) {
      emit(state.copyWith(
          validEmail: valid, validPassword: validPassword, validName: validName, status: PageState.loadingFull));

      final response = await authRepository.register(
          name: state.name,
          email: state.email,
          password: state.password,
          gender: state.gender,
          birthDate: state.birthDate!);
      response.fold((error) {
        showErrorToast(error.message);
        emit(state.copyWith(status: PageState.failure));
      }, (message) {
        showSuccessToast(message);
        emit(state.copyWith(status: PageState.success));
      });
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
