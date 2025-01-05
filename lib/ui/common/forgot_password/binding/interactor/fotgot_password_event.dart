part of 'forgot_password_bloc.dart';

abstract class ForgotPasswordEvent extends Equatable {
  const ForgotPasswordEvent();
}

class Init extends ForgotPasswordEvent {
  const Init();

  @override
  List<Object> get props => [];
}

class OnEmailChange extends ForgotPasswordEvent {
  final String text;
  const OnEmailChange(this.text);

  @override
  List<Object> get props => [text];
}

class OnSubmit extends ForgotPasswordEvent {
  const OnSubmit();

  @override
  List<Object> get props => [];
}

class OnClearPageCommand extends ForgotPasswordEvent {
  const OnClearPageCommand();

  @override
  List<Object> get props => [];
}
