part of 'fan_profile_edit_bloc.dart';

abstract class FanProfileEditEvent extends Equatable {
  const FanProfileEditEvent();
}

class Init extends FanProfileEditEvent {
  final User? user;
  const Init(this.user);

  @override
  List<Object?> get props => [user];
}

class OnClearPageCommand extends FanProfileEditEvent {
  const OnClearPageCommand();

  @override
  List<Object> get props => [];
}

class OnChangeGender extends FanProfileEditEvent {
  final GenderType gender;
  const OnChangeGender(this.gender);

  @override
  List<Object> get props => [OnChangeGender];
}

class OnChangeBirthDate extends FanProfileEditEvent {
  final DateTime birthDate;
  const OnChangeBirthDate(this.birthDate);

  @override
  List<Object> get props => [birthDate];
}
