part of 'main_creator_bloc.dart';

@freezed
class MainCreatorState with _$MainCreatorState {
  const factory MainCreatorState({
    @Default(PageState.initial) PageState status,
    String? error,
    @Default(BottomNavigationPage.home) BottomNavigationPage currentPage,
    User? user,
    CreatorUpdate? creatorUpdate,
    BottomNavigationPage? popPage,
    PageNavigation? pageNavigation,
  }) = _MainCreatorState;

  factory MainCreatorState.initial() => const MainCreatorState();
}
