import 'package:get/get.dart';

import '../../../../../core/repository/interface/i_auth_repository.dart';
import '../../interactor/verify_otp_bloc.dart';

class VerifyOtpBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<VerifyOtpBloc>(VerifyOtpBloc(authRepository: Get.find<IAuthRepository>()));
  }
}
