import 'package:callmobile/core/repository/interface/i_auth_repository.dart';
import 'package:callmobile/core/repository/interface/i_call_repository.dart';
import 'package:get/get.dart';

import '../../interactor/creator_profile_bloc.dart';

class CreatorProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.create<CreatorProfileBloc>(
        () => CreatorProfileBloc(
            authRepository: Get.find<IAuthRepository>(), callRepository: Get.find<ICallRepository>()),
        permanent: false);
  }
}
