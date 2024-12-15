import 'package:get/get.dart';
import '../../../../core/repository/interface/i_auth_repository.dart';
import '../interactor/main_bloc.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<MainBloc>(MainBloc(
        authRepository: Get.find<IAuthRepository>(),
    ));
  }
}
