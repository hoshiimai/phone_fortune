// tab_event.dart

abstract class TabEvent {}

class TabSelected extends TabEvent {
  final int index;

  TabSelected(this.index);
}
