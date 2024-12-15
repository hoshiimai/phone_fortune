import 'package:get/get.dart';

import '../../../../../core/repository/interface/i_auth_repository.dart';
import '../../interactor/creator_profile_edit_bloc.dart';

class CreatorProfileEditBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<CreatorProfileEditBloc>(CreatorProfileEditBloc(authRepository: Get.find<IAuthRepository>()));
  }
}
