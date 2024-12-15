part of 'fan_profile_edit_bloc.dart';

class FanProfileEditState extends Equatable {
  final PageState status;
  final String error;
  final PageCommand? pageCommand;
  final String email;
  final String validEmail;
  final String password;
  final String validPassword;
  // User can be Fan or Creator base on who is logged in (another Creator or Fan)
  final User? user;
  // currentLoginUser can be Fan or Creator
  final User? currentLoginUser;
  final GenderType? gender;
  final DateTime? birthDate;
  final String validBirthDate;

  const FanProfileEditState({
    required this.status,
    required this.error,
    this.pageCommand,
    this.email = '',
    this.validEmail = '',
    this.password = '',
    this.validPassword = '',
    this.currentLoginUser,
    this.user,
    this.gender = GenderType.male,
    this.validBirthDate = '',
    this.birthDate,
  });

  FanProfileEditState copyWith({
    PageState? status,
    String? error,
    List<String>? languages,
    String? languageSelected,
    String? email,
    String? validEmail,
    String? password,
    String? validPassword,
    User? currentLoginUser,
    User? user,
    GenderType? gender,
    DateTime? birthDate,
    String? validBirthDate,
  }) {
    return FanProfileEditState(
      status: status ?? this.status,
      error: error ?? this.error,
      pageCommand: pageCommand,
      email: email ?? this.email,
      validEmail: validEmail ?? this.validEmail,
      password: password ?? this.password,
      validPassword: validPassword ?? this.validPassword,
      currentLoginUser: currentLoginUser ?? this.currentLoginUser,
      user: user ?? this.user,
      gender: gender ?? this.gender,
      birthDate: birthDate ?? this.birthDate,
      validBirthDate: validBirthDate ?? this.validBirthDate,
    );
  }

  @override
  List<Object?> get props =>
      [status, error, pageCommand, email, validEmail, password, validPassword, currentLoginUser, user, gender, birthDate, validBirthDate];
}
