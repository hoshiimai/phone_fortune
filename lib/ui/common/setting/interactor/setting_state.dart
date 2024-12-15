part of 'setting_bloc.dart';

class SettingState extends Equatable {
  final PageState status;
  final String error;
  final PageCommand? pageCommand;
  final String email;
  final String validEmail;
  final String password;
  final String validPassword;
  final User? self;

  const SettingState({
    required this.status,
    required this.error,
    this.pageCommand,
    this.email = '',
    this.validEmail = '',
    this.password = '',
    this.validPassword = '',
    this.self,
  });

  SettingState copyWith({
    PageState? status,
    String? error,
    List<String>? languages,
    String? languageSelected,
    String? email,
    String? validEmail,
    String? password,
    String? validPassword,
    User? self,
  }) {
    return SettingState(
      status: status ?? this.status,
      error: error ?? this.error,
      pageCommand: pageCommand,
      email: email ?? this.email,
      validEmail: validEmail ?? this.validEmail,
      password: password ?? this.password,
      validPassword: validPassword ?? this.validPassword,
      self: self ?? this.self,
    );
  }

  @override
  List<Object?> get props =>
      [status, error, pageCommand, email, validEmail, password, validPassword, self];
}
