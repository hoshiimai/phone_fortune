part of 'creator_profile_edit_bloc.dart';

abstract class CreatorProfileEditEvent extends Equatable {
  const CreatorProfileEditEvent();
}

class Init extends CreatorProfileEditEvent {
  const Init();

  @override
  List<Object> get props => [];
}

class OnWelcomeMessageChanged extends CreatorProfileEditEvent {
  final String welcomeMessages;
  const OnWelcomeMessageChanged(this.welcomeMessages);

  @override
  List<Object> get props => [welcomeMessages];
}

class OnNickNameChanged extends CreatorProfileEditEvent {
  final String nickName;
  const OnNickNameChanged(this.nickName);

  @override
  List<Object> get props => [nickName];
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
