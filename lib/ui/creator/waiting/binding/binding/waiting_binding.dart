import 'package:callmobile/ui/fan/main/interactor/main_bloc.dart';
import 'package:get/get.dart';
import '../../interactor/waiting_bloc.dart';

class WaitingBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<WaitingBloc>(WaitingBloc());
  }
}
