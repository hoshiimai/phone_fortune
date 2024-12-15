import 'package:get/get.dart';

import '../../../../../core/repository/interface/i_auth_repository.dart';
import '../interactor/sign_up_bloc.dart';

class SignUpBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<SignUpBloc>(SignUpBloc(authRepository: Get.find<IAuthRepository>()));
  }
}
