import 'package:get/get.dart';

import '../../../main/interactor/main_bloc.dart';
import '../../interactor/home_bloc.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<HomeBloc>(HomeBloc(mainBloc: Get.find<MainBloc>()));
  }
}
