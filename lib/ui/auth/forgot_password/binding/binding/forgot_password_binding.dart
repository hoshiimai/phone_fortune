import 'package:get/get.dart';

import '../../../../../core/repository/interface/i_auth_repository.dart';
import '../interactor/forgot_password_bloc.dart';

class ForgotPasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<ForgotPasswordBloc>(ForgotPasswordBloc(authRepository: Get.find<IAuthRepository>()));
  }
}
