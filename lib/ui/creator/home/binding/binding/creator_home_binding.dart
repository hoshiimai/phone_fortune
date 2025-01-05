import 'package:callmobile/core/repository/interface/i_auth_repository.dart';
import 'package:get/get.dart';

import '../../../main/interactor/main_creator_bloc.dart';
import '../../interactor/creator_home_bloc.dart';

class CreatorHomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<CreatorHomeBloc>(CreatorHomeBloc(mainBloc: Get.find<MainCreatorBloc>(), authRepository: Get.find<IAuthRepository>()));
  }
}
