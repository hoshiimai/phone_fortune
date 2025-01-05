part of 'register_success_bloc.dart';

class RegisterSuccessState extends Equatable {
  final PageState status;
  final String error;
  final PageCommand? pageCommand;
  final String email;
  final String validEmail;
  final String password;
  final String validPassword;

  const RegisterSuccessState({
    required this.status,
    required this.error,
    this.pageCommand,
    this.email = '',
    this.validEmail = '',
    this.password = '',
    this.validPassword = '',
  });

  RegisterSuccessState copyWith({
    PageState? status,
    String? error,
    List<String>? languages,
    String? languageSelected,
    String? email,
    String? validEmail,
    String? password,
    String? validPassword,
  }) {
    return RegisterSuccessState(
      status: status ?? this.status,
      error: error ?? this.error,
      pageCommand: pageCommand,
      email: email ?? this.email,
      validEmail: validEmail ?? this.validEmail,
      password: password ?? this.password,
      validPassword: validPassword ?? this.validPassword,
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
      ];
}
