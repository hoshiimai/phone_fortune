part of 'fan_profile_edit_bloc.dart';

abstract class FanProfileEditEvent extends Equatable {
  const FanProfileEditEvent();
}

class Init extends FanProfileEditEvent {
  const Init({required this.onInitCompleted});

  final Function(User) onInitCompleted;

  @override
  List<Object?> get props => [onInitCompleted];
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

class OnChangeName extends FanProfileEditEvent {
  final String name;
  const OnChangeName(this.name);

  @override
  List<Object> get props => [name];
}

class OnChangeWelcomeMessage extends FanProfileEditEvent {
  final String welcomeMessage;
  const OnChangeWelcomeMessage(this.welcomeMessage);

  @override
  List<Object> get props => [welcomeMessage];
}

class OnAvatarSelected extends FanProfileEditEvent {
  final File file;
  const OnAvatarSelected(this.file);

  @override
  List<Object> get props => [file];
}

class OnUpdateProfile extends FanProfileEditEvent {
  final Function() onUpdateProfileSuccess;
  const OnUpdateProfile({required this.onUpdateProfileSuccess});

  @override
  List<Object> get props => [onUpdateProfileSuccess];
}

class OnGetUserDetail extends FanProfileEditEvent {
  const OnGetUserDetail();

  @override
  List<Object> get props => [];
}