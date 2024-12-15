part of 'fan_profile_bloc.dart';

class FanProfileState extends Equatable {
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

  const FanProfileState({
    required this.status,
    required this.error,
    this.pageCommand,
    this.email = '',
    this.validEmail = '',
    this.password = '',
    this.validPassword = '',
    this.currentLoginUser,
    this.user,
  });

  FanProfileState copyWith({
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
  }) {
    return FanProfileState(
      status: status ?? this.status,
      error: error ?? this.error,
      pageCommand: pageCommand,
      email: email ?? this.email,
      validEmail: validEmail ?? this.validEmail,
      password: password ?? this.password,
      validPassword: validPassword ?? this.validPassword,
      currentLoginUser: currentLoginUser ?? this.currentLoginUser,
      user: user ?? this.user,
    );
  }

  @override
  List<Object?> get props =>
      [status, error, pageCommand, email, validEmail, password, validPassword, currentLoginUser, user];
}
