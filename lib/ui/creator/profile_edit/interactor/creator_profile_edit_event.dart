part of 'creator_profile_edit_bloc.dart';

abstract class CreatorProfileEditEvent extends Equatable {
  const CreatorProfileEditEvent();
}

class Init extends CreatorProfileEditEvent {
  const Init();

  @override
  List<Object?> get props => [];
}

class OnWelcomeMessageChanged extends CreatorProfileEditEvent {
  final String welcomeMessage;
  const OnWelcomeMessageChanged(this.welcomeMessage);

  @override
  List<Object> get props => [welcomeMessage];
}

class OnNameChanged extends CreatorProfileEditEvent {
  final String name;
  const OnNameChanged(this.name);

  @override
  List<Object> get props => [name];
}

class OnAvatarSelected extends CreatorProfileEditEvent {
  final File file;
  const OnAvatarSelected(this.file);

  @override
  List<Object> get props => [file];
}

class OnCoverSelected extends CreatorProfileEditEvent {
  final File file;
  const OnCoverSelected(this.file);

  @override
  List<Object> get props => [file];
}

class OnUpdateProfile extends CreatorProfileEditEvent {
  final Function() onUpdateProfileSuccess;
  const OnUpdateProfile({required this.onUpdateProfileSuccess});

  @override
  List<Object> get props => [onUpdateProfileSuccess];
}

class OnGetUserDetail extends CreatorProfileEditEvent {
  const OnGetUserDetail();

  @override
  List<Object> get props => [];
}
