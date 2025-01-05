part of 'sign_in_bloc.dart';

abstract class SignInEvent extends Equatable {
  const SignInEvent();
}

class Init extends SignInEvent {
  const Init();

  @override
  List<Object> get props => [];
}

class OnEmailChange extends SignInEvent {
  final String text;
  const OnEmailChange(this.text);

  @override
  List<Object> get props => [text];
}

class OnPasswordChange extends SignInEvent {
  final String text;
  const OnPasswordChange(this.text);

  @override
  List<Object> get props => [text];
}

class OnLogin extends SignInEvent {
  final Function(String pageName) onLoginSuccess;
  const OnLogin({required this.onLoginSuccess,});

  @override
  List<Object> get props => [onLoginSuccess];
}

class OnClearPageCommand extends SignInEvent {
  const OnClearPageCommand();

  @override
  List<Object> get props => [];
}
