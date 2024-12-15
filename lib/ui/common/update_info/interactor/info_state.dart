part of 'info_bloc.dart';

class InfoState extends Equatable {
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

  const InfoState({
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
  });

  InfoState copyWith({
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
  }) {
    return InfoState(
      verifyEmailStatus: verifyEmailStatus ?? this.verifyEmailStatus,
      status: status ?? this.status,
      error: error ?? this.error,
      user: user ?? this.user,
      email: email ?? this.email,
      validEmail: validEmail ?? this.validEmail,
      currentPass: currentPass ?? this.currentPass,
      validNewPass: validNewPass ?? this.validNewPass,
      newPass: newPass ?? this.newPass,
      validCurrentPass: validCurrentPass ?? this.validCurrentPass,
      confirmPass: confirmPass ?? this.confirmPass,
      validConfirmPass: validConfirmPass ?? this.validConfirmPass,
      code: code ?? this.code,
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
      ];
}
