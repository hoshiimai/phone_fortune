part of 'verify_otp_bloc.dart';

class VerifyOtpState extends Equatable {
  final PageState status;
  final String error;
  final PageCommand? pageCommand;
  final String otp;
  final String validOtp;
  final String email;
  final String fromPage;
  final String? name;
  final String? password;
  final GenderType? gender;
  final DateTime? birthDate;

  const VerifyOtpState({
    required this.status,
    required this.error,
    this.pageCommand,
    this.otp = '',
    this.validOtp = '',
    this.email = '',
    this.fromPage = '',
    this.name,
    this.password,
    this.gender,
    this.birthDate,
  });

  VerifyOtpState copyWith({
    PageState? status,
    String? error,
    PageCommand? pageCommand,
    String? otp,
    String? validOtp,
    String? email,
    String? fromPage,
    String? name,
    String? password,
    GenderType? gender,
    DateTime? birthDate,
  }) {
    return VerifyOtpState(
      status: status ?? this.status,
      error: error ?? this.error,
      pageCommand: pageCommand ?? this.pageCommand,
      otp: otp ?? this.otp,
      validOtp: validOtp ?? this.validOtp,
      email: email ?? this.email,
      fromPage: fromPage ?? this.fromPage,
      name: name ?? this.name,
      password: password ?? this.password,
      gender: gender ?? this.gender,
      birthDate: birthDate ?? this.birthDate,
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
    fromPage,
    name,
    password,
    gender,
    birthDate,
  ];
}
