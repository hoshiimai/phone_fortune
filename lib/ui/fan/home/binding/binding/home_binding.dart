import 'package:get/get.dart';

import '../../../../../core/repository/interface/i_auth_repository.dart';
import '../../../main/interactor/main_bloc.dart';
import '../../interactor/home_bloc.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<HomeBloc>(HomeBloc(mainBloc: Get.find<MainBloc>(), authRepository: Get.find<IAuthRepository>()));
  }
}
