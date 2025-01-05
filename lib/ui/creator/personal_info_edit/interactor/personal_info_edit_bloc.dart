import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../../../core/model/response/model/user.dart';
import '../../../../core/repository/interface/i_auth_repository.dart';
import '../../../../utils/helper/validation.dart';

import '../../../../utils/app_shared.dart';
import '../../../../utils/app_utils.dart';
import '../../../base/interactor/page_states.dart';
import '../../../widgets/base/toast/app_toast.dart';

part 'personal_info_edit_event.dart';

part 'personal_info_edit_state.dart';

class PersonalInfoEditBloc extends Bloc<PersonalInfoEditEvent, PersonalInfoEditState> {
  final IAuthRepository authRepository;

  PersonalInfoEditBloc({required this.authRepository})
      : super(const PersonalInfoEditState(error: '', verifyEmailStatus: PageState.initial, status: PageState.initial)) {
    on<Init>(_onInit);
    on<OnChangeFullName>(_onChangeFullName);
    on<OnChangeKataName>(_onChangeKataName);
    on<OnChangePhoneNumber>(_onChangePhoneNumber);
    on<OnChangeBirthDate>(_onChangeBirthDate);
    on<OnSubmitPersonalInfo>(_onSubmitPersonalInfo);
  }

  FutureOr<void> _onInit(Init event, Emitter<PersonalInfoEditState> emit) {
    final user = Get.find<AppShared>().getUser();
    emit(state.copyWith(
      user: user,
      fullName: user?.fullName,
      kataName: user?.nameKata,
      phoneNumber: user?.tel,
      birthDate: (user?.birthdate?.isNotEmpty ?? false) ? DateTime.parse(user!.birthdate!) : null,
    ));
    event.onInitSuccess(user);
  }

  FutureOr<void> _onChangeFullName(OnChangeFullName event, Emitter<PersonalInfoEditState> emit) {
    final validFullName = Validation.validateName(fieldName: '氏名', value: event.name);
    emit(state.copyWith(fullName: event.name, validFullName: validFullName));
  }

  FutureOr<void> _onChangeKataName(OnChangeKataName event, Emitter<PersonalInfoEditState> emit) {
    final validKataName = Validation.validateName(fieldName: 'カタカナ', value: event.name);
    emit(state.copyWith(kataName: event.name, validKataName: validKataName,));
  }

  FutureOr<void> _onChangePhoneNumber(OnChangePhoneNumber event, Emitter<PersonalInfoEditState> emit) {
    final validPhoneNumber = Validation.validatePhoneNumber(event.phoneNumber);
    emit(state.copyWith(phoneNumber: event.phoneNumber, validPhoneNumber: validPhoneNumber,));
  }

  FutureOr<void> _onChangeBirthDate(OnChangeBirthDate event, Emitter<PersonalInfoEditState> emit) {
    emit(state.copyWith(birthDate: event.birthDate, validBirthDate: '',));
  }

  FutureOr<void> _onSubmitPersonalInfo(OnSubmitPersonalInfo event, Emitter<PersonalInfoEditState> emit) async {
    final validFullName = Validation.validateName(fieldName: '氏名', value: state.fullName);
    final validKataName = Validation.validateName(fieldName: 'カタカナ', value: state.kataName);
    final validPhoneNumber = Validation.validatePhoneNumber(state.phoneNumber);
    final validBirthDate = state.birthDate == null ? '生年月日は必須です' : '';
    if (validFullName.isEmpty && validKataName.isEmpty && validPhoneNumber.isEmpty && validBirthDate.isEmpty) {
      emit(state.copyWith(
        validFullName: validFullName,
        validKataName: validKataName,
        validPhoneNumber: validPhoneNumber,
        validBirthDate: validBirthDate,
        status: PageState.loadingFull,
      ));
      final response = await authRepository.updatePersonalInfo(name:  state.fullName, kataName: state.kataName, birthDate: AppUtils.formatDate(state.birthDate!), phoneNumber: state.phoneNumber);
      response.fold((error) {
        showErrorToast(error.message);
        emit(state.copyWith(status: PageState.failure));
      }, (message) {
        final appShared = Get.find<AppShared>();
        final user = state.user?.copyWith(
            fullName: state.fullName,
            nameKata: state.kataName,
            birthdate: AppUtils.formatDate(state.birthDate!),
            tel: state.phoneNumber);
        appShared.setUser(user);
        emit(state.copyWith(status: PageState.success));
        event.onUpdatePersonalInfoSuccess.call();
      });
    } else {
      emit(state.copyWith(
        validFullName: validFullName,
        validKataName: validKataName,
        validPhoneNumber: validPhoneNumber,
        validBirthDate: validBirthDate,
      ));
    }
  }
}
