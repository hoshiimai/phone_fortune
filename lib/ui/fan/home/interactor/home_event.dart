part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();
}

class Init extends HomeEvent {
  final bool isRefresh;
  const Init({required this.isRefresh});

  @override
  List<Object> get props => [isRefresh];
}

class OnClearPageCommand extends HomeEvent {
  const OnClearPageCommand();

  @override
  List<Object> get props => [];
}

class OnGetListIdol extends HomeEvent {
  final bool isRefresh;
  const OnGetListIdol({required this.isRefresh});

  @override
  List<Object> get props => [isRefresh];
}
