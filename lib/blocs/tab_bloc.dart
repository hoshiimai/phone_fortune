// tab_bloc.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'tab_event.dart';
import 'tab_state.dart';

class TabBloc extends Bloc<TabEvent, TabState> {
  TabBloc() : super(TabUpdated(0)) { // 初期状態を「占い師一覧」に設定
    on<TabSelected>((event, emit) {
      emit(TabUpdated(event.index));
    });
  }
}
