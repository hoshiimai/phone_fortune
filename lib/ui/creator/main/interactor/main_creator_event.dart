part of 'main_creator_bloc.dart';

abstract class MainCreatorEvent extends Equatable {
  const MainCreatorEvent();
}

class OnChangeTabEvent extends MainCreatorEvent {
  final BottomNavigationPage tab;

  const OnChangeTabEvent(this.tab);

  @override
  List<Object> get props => [tab];
}

class OnGetUserDetail extends MainCreatorEvent {
  final Function(User user)?  onGetUserSuccess;
  const OnGetUserDetail({this.onGetUserSuccess});

  @override
  List<Object?> get props => [onGetUserSuccess];
}

class ResetPopPageCreator extends MainCreatorEvent {
  const ResetPopPageCreator();

  @override
  List<Object> get props => [];
}

class OnUpdateCreator extends MainCreatorEvent {
  final CreatorUpdate creatorUpdate;
  const OnUpdateCreator(this.creatorUpdate);

  @override
  List<Object> get props => [creatorUpdate];
}

class OnGetCreatorDetail extends MainCreatorEvent {
  final int creatorId;
  final Function (User creator)? onGetCreatorSuccess;
  const OnGetCreatorDetail({required this.creatorId, this.onGetCreatorSuccess});

  @override
  List<Object?> get props => [creatorId, onGetCreatorSuccess];
}

class OnPageNavigation extends MainCreatorEvent {
  final PageNavigation pageNavigation;
  const OnPageNavigation({required this.pageNavigation});
  @override
  List<Object> get props => [pageNavigation];
}

class OnClearPageNavigation extends MainCreatorEvent {
  const OnClearPageNavigation();
  @override
  List<Object> get props => [OnClearPageNavigation];
}

class OnUpdateWaitingCount extends MainCreatorEvent {
  final int? count;
  const OnUpdateWaitingCount(this.count);
  @override
  List<Object?> get props => [count];
}
