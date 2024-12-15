part of 'main_bloc.dart';

abstract class MainEvent extends Equatable {
  const MainEvent();
}

class OnChangeTabEvent extends MainEvent {
  final BottomNavigationPage tab;

  const OnChangeTabEvent(this.tab);

  @override
  List<Object> get props => [tab];
}

class OnGetUserDetail extends MainEvent {
  final Function(User user)?  onGetUserSuccess;
  const OnGetUserDetail({this.onGetUserSuccess});

  @override
  List<Object?> get props => [onGetUserSuccess];
}

class ResetPopPage extends MainEvent {
  const ResetPopPage();

  @override
  List<Object> get props => [ResetPopPage];
}

class OnUpdateCreator extends MainEvent {
  final CreatorUpdate creatorUpdate;
  const OnUpdateCreator(this.creatorUpdate);

  @override
  List<Object> get props => [creatorUpdate];
}

class OnGetCreatorDetail extends MainEvent {
  final int creatorId;
  final Function (User creator)? onGetCreatorSuccess;
  const OnGetCreatorDetail({required this.creatorId, this.onGetCreatorSuccess});

  @override
  List<Object?> get props => [creatorId, onGetCreatorSuccess];
}

class OnPageNavigation extends MainEvent {
  final PageNavigation pageNavigation;
  const OnPageNavigation({required this.pageNavigation});
  @override
  List<Object> get props => [pageNavigation];
}

class OnClearPageNavigation extends MainEvent {
  const OnClearPageNavigation();
  @override
  List<Object> get props => [OnClearPageNavigation];
}
