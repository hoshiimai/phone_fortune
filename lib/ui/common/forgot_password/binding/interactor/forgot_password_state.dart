part of 'forgot_password_bloc.dart';

class ForgotPasswordState extends Equatable {
  final PageState status;
  final String error;
  final PageCommand? pageCommand;
  final String email;
  final String validEmail;

  const ForgotPasswordState({
    required this.status,
    required this.error,
    this.pageCommand,
    this.email = '',
    this.validEmail = '',
  });

  ForgotPasswordState copyWith({
    PageState? status,
    String? error,
    List<String>? languages,
    String? languageSelected,
    String? email,
    String? validEmail,
  }) {
    return ForgotPasswordState(
      status: status ?? this.status,
      error: error ?? this.error,
      pageCommand: pageCommand,
      email: email ?? this.email,
      validEmail: validEmail ?? this.validEmail,
    );
  }

  @override
  List<Object?> get props => [
        status,
        error,
        pageCommand,
        email,
        validEmail,
      ];
}
