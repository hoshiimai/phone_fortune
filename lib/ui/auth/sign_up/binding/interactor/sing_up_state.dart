part of 'sign_up_bloc.dart';

class SignUpState extends Equatable {
  final PageState status;
  final String error;
  final PageCommand? pageCommand;
  final String email;
  final String validEmail;
  final String password;
  final String validPassword;
  final String name;
  final String validName;
  final DateTime? birthDate;
  final String validBirthDate;
  final GenderType gender;

  const SignUpState({
    required this.status,
    required this.error,
    this.pageCommand,
    this.email = '',
    this.validEmail = '',
    this.password = '',
    this.validPassword = '',
    this.name = '',
    this.validName = '',
    this.validBirthDate = '',
    this.birthDate,
    this.gender = GenderType.male,
  });

  SignUpState copyWith({
    PageState? status,
    String? error,
    List<String>? languages,
    String? languageSelected,
    String? email,
    String? validEmail,
    String? password,
    String? validPassword,
    String? name,
    String? validName,
    DateTime? birthDate,
    String? validBirthDate,
    GenderType? gender,
  }) {
    return SignUpState(
      status: status ?? this.status,
      error: error ?? this.error,
      pageCommand: pageCommand,
      email: email ?? this.email,
      validEmail: validEmail ?? this.validEmail,
      password: password ?? this.password,
      validPassword: validPassword ?? this.validPassword,
      name: name ?? this.name,
      validName: validName ?? this.validName,
      birthDate: birthDate ?? this.birthDate,
      validBirthDate: validBirthDate ?? this.validBirthDate,
      gender: gender ?? this.gender,
    );
  }

  @override
  List<Object?> get props => [
        status,
        error,
        pageCommand,
        email,
        validEmail,
        password,
        validPassword,
        name,
        validName,
        birthDate,
        validBirthDate,
        gender,
      ];
}
