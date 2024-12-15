import 'package:get/get.dart';
import '../../../../core/repository/interface/i_auth_repository.dart';
import '../interactor/main_creator_bloc.dart';

class MainCreatorBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<MainCreatorBloc>(MainCreatorBloc(
        authRepository: Get.find<IAuthRepository>(),
    ));
  }
}
