part of 'creator_home_bloc.dart';

class CreatorHomeState extends Equatable {
  final PageState status;
  final String error;
  final PageCommand? pageCommand;
  final User? currentLoggedInUser;
  final List<User> waitingFans;
  final Status currentStatus;
  final User? recentCallFan;

  const CreatorHomeState({
    required this.status,
    required this.error,
    this.pageCommand,
    this.currentLoggedInUser,
    this.waitingFans = const [],
    this.currentStatus = Status.online,
    this.recentCallFan,
  });

  CreatorHomeState copyWith({
    PageState? status,
    String? error,
    List<String>? languages,
    List<User>? waitingFans,
    User? currentLoggedInUser,
    Status? currentStatus,
    User? recentCallFan,
  }) {
    return CreatorHomeState(
      status: status ?? this.status,
      error: error ?? this.error,
      pageCommand: pageCommand,
      waitingFans: waitingFans ?? this.waitingFans,
      currentLoggedInUser: currentLoggedInUser ?? this.currentLoggedInUser,
      currentStatus: currentStatus ?? this.currentStatus,
      recentCallFan: recentCallFan ?? this.recentCallFan,
    );
  }

  @override
  List<Object?> get props => [
        status,
        error,
        pageCommand,
        waitingFans,
        currentLoggedInUser,
        currentStatus,
        recentCallFan,
      ];
}
