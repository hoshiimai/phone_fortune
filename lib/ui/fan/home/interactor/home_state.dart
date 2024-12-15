part of 'home_bloc.dart';

class HomeState extends Equatable {
  final PageState status;
  final String error;
  final PageCommand? pageCommand;
  final User? currentLoggedInUser;
  final List<User> favoriteCreators;
  final List<User> callingCreators;
  final List<User> potentialCreators;
  final List<User> managedCreators;

  const HomeState({
    required this.status,
    required this.error,
    this.pageCommand,
    this.currentLoggedInUser,
    this.managedCreators = const [],
    this.favoriteCreators = const [],
    this.callingCreators = const [],
    this.potentialCreators = const [],
  });

  HomeState copyWith({
    PageState? status,
    String? error,
    List<String>? languages,
    List<User>? managedCreators,
    List<User>? favoriteCreators,
    List<User>? callingCreators,
    List<User>? potentialCreators,
    User? currentLoggedInUser,
  }) {
    return HomeState(
      status: status ?? this.status,
      error: error ?? this.error,
      pageCommand: pageCommand,
      managedCreators: managedCreators ?? this.managedCreators,
      favoriteCreators: favoriteCreators ?? this.favoriteCreators,
      callingCreators: callingCreators ?? this.callingCreators,
      potentialCreators: potentialCreators ?? this.potentialCreators,
      currentLoggedInUser: currentLoggedInUser ?? this.currentLoggedInUser,
    );
  }

  @override
  List<Object?> get props => [
        status,
        error,
        pageCommand,
        managedCreators,
        favoriteCreators,
        callingCreators,
        potentialCreators,
        currentLoggedInUser
      ];
}
