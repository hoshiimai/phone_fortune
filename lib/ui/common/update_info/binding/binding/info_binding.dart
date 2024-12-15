import 'package:get/get.dart';

import '../../../../../core/repository/interface/i_auth_repository.dart';
import '../../interactor/info_bloc.dart';

class InfoBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<InfoBloc>(InfoBloc(authRepository: Get.find<IAuthRepository>()));
  }
}
