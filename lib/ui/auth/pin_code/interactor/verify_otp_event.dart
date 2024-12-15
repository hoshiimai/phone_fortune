part of 'verify_otp_bloc.dart';

abstract class VerifyOtpEvent extends Equatable {
  const VerifyOtpEvent();
}

class Init extends VerifyOtpEvent {
  final String email;
  const Init(this.email);

  @override
  List<Object> get props => [email];
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
