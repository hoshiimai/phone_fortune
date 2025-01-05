part of 'creator_profile_bloc.dart';

class CreatorProfileState extends Equatable {
  final PageState status;
  final String error;
  final PageCommand? pageCommand;
  // User can be Fan or Creator base on who is logged in (another Creator or Fan)
  final User? creator;
  // currentLoginUser can be Fan or Creator
  final User? currentLoginUser;

  const CreatorProfileState({
    required this.status,
    required this.error,
    this.pageCommand,
    this.currentLoginUser,
    this.creator,
  });

  CreatorProfileState copyWith({
    PageState? status,
    String? error,
    User? currentLoginUser,
    User? creator,
  }) {
    return CreatorProfileState(
      status: status ?? this.status,
      error: error ?? this.error,
      pageCommand: pageCommand,
      currentLoginUser: currentLoginUser ?? this.currentLoginUser,
      creator: creator ?? this.creator,
    );
  }

  @override
  List<Object?> get props =>
      [status, error, pageCommand, currentLoginUser, creator];
}
