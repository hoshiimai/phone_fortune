part of 'home_bloc.dart';

class HomeState extends Equatable {
  final PageState status;
  final String error;
  final PageCommand? pageCommand;
  final User? currentLoggedInUser;
  final List<User> creators;

  const HomeState({
    required this.status,
    required this.error,
    this.pageCommand,
    this.currentLoggedInUser,
    this.creators = const [],
  });

  HomeState copyWith({
    PageState? status,
    String? error,
    List<String>? languages,
    List<User>? creators,
    User? currentLoggedInUser,
  }) {
    return HomeState(
      status: status ?? this.status,
      error: error ?? this.error,
      pageCommand: pageCommand,
      creators: creators ?? this.creators,
      currentLoggedInUser: currentLoggedInUser ?? this.currentLoggedInUser,
    );
  }

  @override
  List<Object?> get props => [
        status,
        error,
        pageCommand,
        creators,
        currentLoggedInUser
      ];
}
