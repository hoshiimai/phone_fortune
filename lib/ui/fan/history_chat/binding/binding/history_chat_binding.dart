import 'package:get/get.dart';

import '../../interactor/history_chat_bloc.dart';

class HistoryChatBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<HistoryChatBloc>(HistoryChatBloc());
  }
}
