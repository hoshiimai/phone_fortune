part of 'personal_info_edit_bloc.dart';

class PersonalInfoEditState extends Equatable {
  final PageState verifyEmailStatus;
  final PageState status;
  final String error;
  final User? user;
  final String email;
  final String validEmail;
  final String currentPass;
  final String validCurrentPass;
  final String newPass;
  final String validNewPass;
  final String confirmPass;
  final String validConfirmPass;
  final String code;
  final String fullName;
  final String validFullName;
  final String kataName;
  final String validKataName;
  final DateTime? birthDate;
  final String phoneNumber;
  final String validBirthDate;
  final String validPhoneNumber;

  const PersonalInfoEditState({
    required this.verifyEmailStatus,
    required this.status,
    required this.error,
    this.user,
    this.email = '',
    this.validEmail = '',
    this.currentPass = '',
    this.validCurrentPass = '',
    this.newPass = '',
    this.validNewPass = '',
    this.confirmPass = '',
    this.validConfirmPass = '',
    this.code = '',
    this.fullName = '',
    this.validFullName = '',
    this.kataName = '',
    this.validKataName = '',
    this.birthDate,
    this.validBirthDate = '',
    this.phoneNumber = '',
    this.validPhoneNumber = '',
  });

  PersonalInfoEditState copyWith({
    PageState? verifyEmailStatus,
    PageState? status,
    String? error,
    User? user,
    String? email,
    String? validEmail,
    String? currentPass,
    String? validCurrentPass,
    String? newPass,
    String? validNewPass,
    String? confirmPass,
    String? validConfirmPass,
    String? code,
    String? fullName,
    String? validFullName,
    String? kataName,
    String? validKataName,
    DateTime? birthDate,
    String? phoneNumber,
    String? validBirthDate,
    String? validPhoneNumber,
  }) {
    return PersonalInfoEditState(
      verifyEmailStatus: verifyEmailStatus ?? this.verifyEmailStatus,
      status: status ?? this.status,
      error: error ?? this.error,
      user: user ?? this.user,
      email: email ?? this.email,
      validEmail: validEmail ?? this.validEmail,
      currentPass: currentPass ?? this.currentPass,
      validCurrentPass: validCurrentPass ?? this.validCurrentPass,
      newPass: newPass ?? this.newPass,
      validNewPass: validNewPass ?? this.validNewPass,
      confirmPass: confirmPass ?? this.confirmPass,
      validConfirmPass: validConfirmPass ?? this.validConfirmPass,
      code: code ?? this.code,
      fullName: fullName ?? this.fullName,
      validFullName: validFullName ?? this.validFullName,
      kataName: kataName ?? this.kataName,
      validKataName: validKataName ?? this.validKataName,
      birthDate: birthDate ?? this.birthDate,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      validBirthDate: validBirthDate ?? this.validBirthDate,
      validPhoneNumber: validPhoneNumber ?? this.validPhoneNumber,
    );
  }

  @override
  List<Object?> get props => [
    verifyEmailStatus,
    status,
    error,
    user,
    email,
    validEmail,
    currentPass,
    validCurrentPass,
    newPass,
    validNewPass,
    confirmPass,
    validConfirmPass,
    code,
    fullName,
    validFullName,
    kataName,
    validKataName,
    birthDate,
    phoneNumber,
    validBirthDate,
    validPhoneNumber,
  ];
}