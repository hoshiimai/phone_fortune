import 'package:get/get.dart';

import '../../interactor/setting_bloc.dart';

class SettingBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<SettingBloc>(SettingBloc());
  }
}
