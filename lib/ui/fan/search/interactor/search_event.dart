part of 'search_bloc.dart';

abstract class SearchEvent extends Equatable {
  const SearchEvent();
}

class Init extends SearchEvent {
  const Init();

  @override
  List<Object> get props => [];
}

class OnSearch extends SearchEvent {
  final String text;
  const OnSearch(this.text);

  @override
  List<Object> get props => [text];
}

class OnClearPageCommand extends SearchEvent {
  const OnClearPageCommand();

  @override
  List<Object> get props => [];
}

class OnLoadMore extends SearchEvent {
  const OnLoadMore();

  @override
  List<Object> get props => [];
}

class OnUpdateCreator extends SearchEvent {
  final bool isBlocked;
  final User creator;
  final User updatedCreator;
  const OnUpdateCreator({required this.isBlocked, required this.creator, required this.updatedCreator});

  @override
  List<Object> get props => [isBlocked, creator, updatedCreator];
}
