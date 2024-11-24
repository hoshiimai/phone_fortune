// tab_state.dart

abstract class TabState {}

class TabInitial extends TabState {}

class TabUpdated extends TabState {
  final int index;

  TabUpdated(this.index);

  bool isLeftSelected() => index == 0;
  bool isRightSelected() => index == 1;
}
