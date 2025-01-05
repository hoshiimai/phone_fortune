part of 'verify_otp_bloc.dart';

abstract class VerifyOtpEvent extends Equatable {
  const VerifyOtpEvent();
}

class Init extends VerifyOtpEvent {
  final String email;
  final String fromPage;
  final String? name;
  final String? password;
  final GenderType? gender;
  final DateTime? birthDate;

  const Init({required this.email, required this.fromPage, this.name, this.password, this.gender, this.birthDate});


  @override
  List<Object?> get props => [email, fromPage, name, password, gender, birthDate];
}

class OnChangeOtp extends VerifyOtpEvent {
  final Function(String) onVerifySuccess;
  final String value;
  const OnChangeOtp({required this.value, required this.onVerifySuccess});

  @override
  List<Object> get props => [value, onVerifySuccess];
}

class OnNext extends VerifyOtpEvent {
  final Function(String) onVerifySuccess;
  const OnNext(this.onVerifySuccess);

  @override
  List<Object> get props => [onVerifySuccess];
}

class OnClearPageCommand extends VerifyOtpEvent {
  const OnClearPageCommand();

  @override
  List<Object> get props => [];
}

class OnResendCode extends VerifyOtpEvent {
  const OnResendCode();

  @override
  List<Object> get props => [];
}
