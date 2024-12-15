part of 'sign_up_bloc.dart';

abstract class SignUpEvent extends Equatable {
  const SignUpEvent();
}

class Init extends SignUpEvent {
  const Init();

  @override
  List<Object> get props => [];
}

class OnEmailChange extends SignUpEvent {
  final String text;
  const OnEmailChange(this.text);

  @override
  List<Object> get props => [text];
}

class OnPasswordChange extends SignUpEvent {
  final String text;
  const OnPasswordChange(this.text);

  @override
  List<Object> get props => [text];
}

class OnNameChange extends SignUpEvent {
  final String text;
  const OnNameChange(this.text);

  @override
  List<Object> get props => [text];
}

class OnRegister extends SignUpEvent {
  const OnRegister();

  @override
  List<Object> get props => [];
}

class OnClearPageCommand extends SignUpEvent {
  const OnClearPageCommand();

  @override
  List<Object> get props => [];
}

class OnChangeBirthDate extends SignUpEvent {
  final DateTime birthDate;
  const OnChangeBirthDate(this.birthDate);

  @override
  List<Object> get props => [birthDate];
}

class OnChangeGender extends SignUpEvent {
  final GenderType gender;
  const OnChangeGender(this.gender);

  @override
  List<Object> get props => [OnChangeGender];
}
