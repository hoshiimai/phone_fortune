part of 'sign_in_bloc.dart';

class SignInState extends Equatable {
  final PageState status;
  final String error;
  final PageCommand? pageCommand;
  final String email;
  final String validEmail;
  final String password;
  final String validPassword;

  const SignInState({
    required this.status,
    required this.error,
    this.pageCommand,
    this.email = '',
    this.validEmail = '',
    this.password = '',
    this.validPassword = '',
  });

  SignInState copyWith({
    PageState? status,
    String? error,
    List<String>? languages,
    String? languageSelected,
    String? email,
    String? validEmail,
    String? password,
    String? validPassword,
  }) {
    return SignInState(
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
