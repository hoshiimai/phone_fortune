import 'package:get/get.dart';

import '../../interactor/call_bloc.dart';

class CallBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<CallBloc>(CallBloc());
  }
}
