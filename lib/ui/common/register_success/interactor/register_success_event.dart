part of 'register_success_bloc.dart';

abstract class RegisterSuccessEvent extends Equatable {
  const RegisterSuccessEvent();
}

class Init extends RegisterSuccessEvent {
  const Init();

  @override
  List<Object> get props => [];
}

class OnEmailChange extends RegisterSuccessEvent {
  final String text;
  const OnEmailChange(this.text);

  @override
  List<Object> get props => [text];
}

class OnPasswordChange extends RegisterSuccessEvent {
  final String text;
  const OnPasswordChange(this.text);

  @override
  List<Object> get props => [text];
}

class OnClearPageCommand extends RegisterSuccessEvent {
  const OnClearPageCommand();

  @override
  List<Object> get props => [];
}
