import 'package:get/get.dart';
import 'package:callmobile/core/repository/interface/i_auth_repository.dart';

import '../interactor/sign_in_bloc.dart';

class SignInBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<SignInBloc>(SignInBloc(authRepository: Get.find<IAuthRepository>()));
  }
}
