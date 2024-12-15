part of 'search_bloc.dart';

class SearchState extends Equatable {
  final PageState loadingState;
  final String error;
  final PageCommand? pageCommand;
  final List<Creator> creators;
  final PageState loadingMoreState;
  final String? keyword;
  final int currentPage;
  final int totalPage;
  final int totalCreators;

  const SearchState({
    required this.loadingState,
    required this.error,
    this.pageCommand,
    this.creators = const [],
    this.loadingMoreState = PageState.initial,
    this.keyword,
    this.currentPage = 1,
    this.totalPage = 0,
    this.totalCreators = 0,
  });

  SearchState copyWith({
    PageState? loadingState,
    String? error,
    List<Creator>? creators,
    PageState? loadingMoreState,
    bool? isLoadingMore,
    String? keyword,
    int? currentPage,
    int? totalPage,
    int? totalCreators,
  }) {
    return SearchState(
      loadingState: loadingState ?? this.loadingState,
      error: error ?? this.error,
      pageCommand: pageCommand,
      creators: creators ?? this.creators,
      loadingMoreState: loadingMoreState ?? this.loadingMoreState,
      keyword: keyword ?? this.keyword,
      currentPage: currentPage ?? this.currentPage,
      totalPage: totalPage ?? this.totalPage,
      totalCreators: totalCreators ?? this.totalCreators,
    );
  }

  @override
  List<Object?> get props => [loadingState, error, pageCommand, creators, loadingMoreState, loadingMoreState, keyword, currentPage, totalPage, totalCreators];
}
