part of 'verify_otp_bloc.dart';

class VerifyOtpState extends Equatable {
  final PageState status;
  final String error;
  final PageCommand? pageCommand;
  final String otp;
  final String validOtp;
  final String email;

  const VerifyOtpState({
    required this.status,
    required this.error,
    this.pageCommand,
    this.otp = '',
    this.validOtp = '',
    this.email = '',
  });

  VerifyOtpState copyWith({
    PageState? status,
    String? error,
    List<String>? languages,
    String? languageSelected,
    String? otp,
    String? validOtp,
    String? email,
  }) {
    return VerifyOtpState(
      status: status ?? this.status,
      error: error ?? this.error,
      pageCommand: pageCommand,
      otp: otp ?? this.otp,
      validOtp: validOtp ?? this.validOtp,
      email: email ?? this.email,
    );
  }

  @override
  List<Object?> get props => [
        status,
        error,
        pageCommand,
        otp,
        validOtp,
        email,
      ];
}
