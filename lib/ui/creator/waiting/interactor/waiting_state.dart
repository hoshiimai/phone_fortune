part of 'waiting_bloc.dart';

class WaitingState extends Equatable {
  final PageState status;
  final String error;
  final PageCommand? pageCommand;
  final List<User> fans;
  final PageState loadingMoreState;
  final int currentPage;
  final int totalPage;
  final int totalCreators;

  const WaitingState({
    required this.status,
    required this.error,
    this.pageCommand,
    this.fans = const [],
    this.loadingMoreState = PageState.initial,
    this.currentPage = 1,
    this.totalPage = 0,
    this.totalCreators = 0,
  });

  WaitingState copyWith({
    PageState? status,
    String? error,
    List<User>? fans,
    PageState? loadingMoreState,
    bool? isLoadingMore,
    int? currentPage,
    int? totalPage,
    int? totalCreators,
  }) {
    return WaitingState(
      status: status ?? this.status,
      error: error ?? this.error,
      pageCommand: pageCommand,
      fans: fans ?? this.fans,
      loadingMoreState: loadingMoreState ?? this.loadingMoreState,
      currentPage: currentPage ?? this.currentPage,
      totalPage: totalPage ?? this.totalPage,
      totalCreators: totalCreators ?? this.totalCreators,
    );
  }

  @override
  List<Object?> get props => [status, error, pageCommand, fans, loadingMoreState, loadingMoreState, currentPage, totalPage, totalCreators];
}
