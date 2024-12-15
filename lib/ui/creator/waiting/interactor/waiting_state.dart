part of 'waiting_bloc.dart';

class WaitingState extends Equatable {
  final PageState loadingState;
  final String error;
  final PageCommand? pageCommand;
  final List<FanWaitingInfo> fans;
  final PageState loadingMoreState;
  final int currentPage;
  final int totalPage;
  final int totalCreators;

  const WaitingState({
    required this.loadingState,
    required this.error,
    this.pageCommand,
    this.fans = const [],
    this.loadingMoreState = PageState.initial,
    this.currentPage = 1,
    this.totalPage = 0,
    this.totalCreators = 0,
  });

  WaitingState copyWith({
    PageState? loadingState,
    String? error,
    List<FanWaitingInfo>? fans,
    PageState? loadingMoreState,
    bool? isLoadingMore,
    int? currentPage,
    int? totalPage,
    int? totalCreators,
  }) {
    return WaitingState(
      loadingState: loadingState ?? this.loadingState,
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
  List<Object?> get props => [loadingState, error, pageCommand, fans, loadingMoreState, loadingMoreState, currentPage, totalPage, totalCreators];
}
