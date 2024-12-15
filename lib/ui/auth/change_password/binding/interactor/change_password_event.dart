part of 'change_password_bloc.dart';

abstract class ChangePasswordEvent extends Equatable {
  const ChangePasswordEvent();
}

class Init extends ChangePasswordEvent {
  final String accessToken;
  const Init(this.accessToken);

  @override
  List<Object> get props => [accessToken];
}

class OnPasswordChange extends ChangePasswordEvent {
  final String text;
  const OnPasswordChange(this.text);

  @override
  List<Object> get props => [text];
}

class OnConfirmPasswordChanged extends ChangePasswordEvent {
  final String text;
  const OnConfirmPasswordChanged(this.text);

  @override
  List<Object> get props => [text];
}

class OnSubmit extends ChangePasswordEvent {
  const OnSubmit();

  @override
  List<Object> get props => [];
}

class OnClearPageCommand extends ChangePasswordEvent {
  const OnClearPageCommand();

  @override
  List<Object> get props => [];
}
