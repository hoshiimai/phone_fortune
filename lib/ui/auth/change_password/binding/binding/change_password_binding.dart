import 'package:get/get.dart';

import '../../../../../core/repository/interface/i_auth_repository.dart';
import '../interactor/change_password_bloc.dart';

class ChangePasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<ChangePasswordBloc>(ChangePasswordBloc(authRepository: Get.find<IAuthRepository>()));
  }
}
