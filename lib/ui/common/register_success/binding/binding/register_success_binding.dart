import 'package:get/get.dart';

import '../../interactor/register_success_bloc.dart';

class RegisterSuccessBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<RegisterSuccessBloc>(RegisterSuccessBloc());
  }
}
