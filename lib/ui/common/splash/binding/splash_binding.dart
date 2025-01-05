import 'package:get/get.dart';

import '../interactor/splash_bloc.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<SplashBloc>(SplashBloc());
  }
}
