part of 'main_bloc.dart';

@freezed
class MainState with _$MainState {
  const factory MainState({
    @Default(PageState.initial) PageState status,
    String? error,
    @Default(BottomNavigationPage.home) BottomNavigationPage currentPage,
    User? user,
    CreatorUpdate? creatorUpdate,
    BottomNavigationPage? popPage,
    PageNavigation? pageNavigation,
  }) = _MainState;

  factory MainState.initial() => const MainState();
}
