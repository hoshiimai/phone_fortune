part of 'creator_profile_edit_bloc.dart';

class CreatorProfileEditState extends Equatable {
  final PageState status;
  final User? user;
  final String? nickName;
  final String? welcomeMessages;
  final File? avatar;
  final File? cover;

  const CreatorProfileEditState({
    required this.status,
    this.user,
    this.welcomeMessages,
    this.nickName,
    this.avatar,
    this.cover,
  });

  CreatorProfileEditState copyWith({
    PageState? status,
    User? user,
    String? nickName,
    String? welcomeMessages,
    File? avatar,
    File? cover,
  }) {
    return CreatorProfileEditState(
      status: status ?? this.status,
      user: user ?? this.user,
      nickName: nickName ?? this.nickName,
      welcomeMessages: welcomeMessages ?? this.welcomeMessages,
      avatar: avatar ?? this.avatar,
      cover: cover ?? this.cover,
    );
  }

  @override
  List<Object?> get props => [
    status,
    user,
    nickName,
    welcomeMessages,
    avatar,
    cover,
  ];
}