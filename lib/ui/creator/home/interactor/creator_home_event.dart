part of 'creator_home_bloc.dart';

abstract class CreatorHomeEvent extends Equatable {
  const CreatorHomeEvent();
}

class Init extends CreatorHomeEvent {
  final bool isRefresh;
  const Init({required this.isRefresh});

  @override
  List<Object> get props => [isRefresh];
}

class OnClearPageCommand extends CreatorHomeEvent {
  const OnClearPageCommand();

  @override
  List<Object> get props => [];
}

class OnUpdateStatus extends CreatorHomeEvent {
  final Status status;
  const OnUpdateStatus(this.status);

  @override
  List<Object> get props => [status];
}

class OnGetWaitingFans extends CreatorHomeEvent {
  final bool isRefresh;
  const OnGetWaitingFans({required this.isRefresh});

  @override
  List<Object> get props => [isRefresh];
}
