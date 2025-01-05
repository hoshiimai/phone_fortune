import 'package:callmobile/core/repository/interface/i_call_repository.dart';
import 'package:callmobile/ui/common/call_summary/interactor/call_summary_bloc.dart';
import 'package:get/get.dart';

class CallSummaryBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<CallSummaryBloc>(CallSummaryBloc(callRepository: Get.find<ICallRepository>()));
  }
}
