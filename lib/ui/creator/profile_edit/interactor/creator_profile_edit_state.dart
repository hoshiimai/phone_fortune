part of 'creator_profile_edit_bloc.dart';

class CreatorProfileEditState extends Equatable {
  final PageState status;
  final User? currentLoginUser;
  final String? name;
  final String validName;
  final String? welcomeMessage;
  final File? avatar;
  final File? cover;

  const CreatorProfileEditState({
    required this.status,
    this.currentLoginUser,
    this.welcomeMessage,
    this.name,
    this.avatar,
    this.cover,
    this.validName = '',
  });

  CreatorProfileEditState copyWith({
    PageState? status,
    User? currentLoginUser,
    String? name,
    String? validName,
    String? welcomeMessage,
    File? avatar,
    File? cover,
  }) {
    return CreatorProfileEditState(
      status: status ?? this.status,
      currentLoginUser: currentLoginUser ?? this.currentLoginUser,
      name: name ?? this.name,
      validName: validName ?? this.validName,
      welcomeMessage: welcomeMessage ?? this.welcomeMessage,
      avatar: avatar ?? this.avatar,
      cover: cover ?? this.cover,
    );
  }

  @override
  List<Object?> get props => [
    status,
    currentLoginUser,
    name,
    validName,
    welcomeMessage,
    avatar,
    cover,
  ];
}