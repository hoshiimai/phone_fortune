import 'package:get/get.dart';

import '../../../../../core/repository/interface/i_call_repository.dart';
import '../../interactor/history_chat_bloc.dart';

class HistoryChatBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<HistoryChatBloc>(HistoryChatBloc(callRepository: Get.find<ICallRepository>()));
  }
}
