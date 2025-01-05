import 'package:callmobile/core/repository/interface/i_auth_repository.dart';
import 'package:get/get.dart';
import '../../interactor/fan_profile_edit_bloc.dart';

class FanProfileEditBinding extends Bindings {
  @override
  void dependencies() {
    Get.create<FanProfileEditBloc>(() => FanProfileEditBloc(authRepository: Get.find<IAuthRepository>()), permanent: false);
  }
}
