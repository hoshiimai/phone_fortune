part of 'waiting_bloc.dart';

abstract class WaitingEvent extends Equatable {
  const WaitingEvent();
}

class Init extends WaitingEvent {
  const Init();

  @override
  List<Object> get props => [];
}

class OnSearch extends WaitingEvent {
  final String text;
  const OnSearch(this.text);

  @override
  List<Object> get props => [text];
}

class OnClearPageCommand extends WaitingEvent {
  const OnClearPageCommand();

  @override
  List<Object> get props => [];
}

class OnLoadMore extends WaitingEvent {
  const OnLoadMore();

  @override
  List<Object> get props => [];
}

class OnUpdateCreator extends WaitingEvent {
  final bool isBlocked;
  final User creator;
  final User updatedCreator;
  const OnUpdateCreator({required this.isBlocked, required this.creator, required this.updatedCreator});

  @override
  List<Object> get props => [isBlocked, creator, updatedCreator];
}

class OnGetWaitingFans extends WaitingEvent {
  const OnGetWaitingFans();

  @override
  List<Object> get props => [];
}
