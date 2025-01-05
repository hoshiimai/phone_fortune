part of 'change_password_bloc.dart';

class ChangePasswordState extends Equatable {
  final PageState status;
  final String error;
  final String accessToken;
  final String password;
  final String validPassword;
  final String confirmPassword;
  final String validConfirmPassword;

  const ChangePasswordState({
    required this.status,
    required this.error,
    this.accessToken = '',
    this.confirmPassword = '',
    this.validConfirmPassword = '',
    this.password = '',
    this.validPassword = '',
  });

  ChangePasswordState copyWith({
    PageState? status,
    String? error,
    String? accessToken,
    String? confirmPassword,
    String? validConfirmPassword,
    String? password,
    String? validPassword,
  }) {
    return ChangePasswordState(
      status: status ?? this.status,
      error: error ?? this.error,
      accessToken: accessToken ?? this.accessToken,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      validConfirmPassword: validConfirmPassword ?? this.validConfirmPassword,
      password: password ?? this.password,
      validPassword: validPassword ?? this.validPassword,
    );
  }

  @override
  List<Object?> get props => [
        status,
        error,
        accessToken,
        confirmPassword,
        validConfirmPassword,
        password,
        validPassword,
      ];
}
