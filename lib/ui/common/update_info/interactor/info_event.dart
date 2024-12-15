part of 'info_bloc.dart';

abstract class InfoEvent extends Equatable {
  const InfoEvent();
}

class Init extends InfoEvent {
  const Init();

  @override
  List<Object> get props => [];
}

class OnUpdateUser extends InfoEvent {
  final User user;
  const OnUpdateUser(this.user);

  @override
  List<Object> get props => [user];
}

class OnEmailChange extends InfoEvent {
  final String text;
  const OnEmailChange(this.text);

  @override
  List<Object> get props => [text];
}

class OnPasswordChange extends InfoEvent {
  final PasswordType type;
  final String text;
  const OnPasswordChange(this.type, this.text);

  @override
  List<Object> get props => [type, text];
}

class OnSubmitEmail extends InfoEvent {
  final bool isFromVerify;
  const OnSubmitEmail(this.isFromVerify);

  @override
  List<Object> get props => [isFromVerify];
}

class OnSubmitPassword extends InfoEvent {
  final Function() onUpdatePasswordSuccess;
  const OnSubmitPassword({required this.onUpdatePasswordSuccess});

  @override
  List<Object> get props => [onUpdatePasswordSuccess];
}

class OnChangeCode extends InfoEvent {
  final String value;
  const OnChangeCode(this.value);

  @override
  List<Object> get props => [value];
}

class OnVerifyEmailCode extends InfoEvent {
  const OnVerifyEmailCode();

  @override
  List<Object> get props => [];
}

class OnResendCode extends InfoEvent {
  const OnResendCode();

  @override
  List<Object> get props => [];
}

class OnClearPageCommand extends InfoEvent {
  const OnClearPageCommand();

  @override
  List<Object> get props => [];
}
