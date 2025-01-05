import 'package:callmobile/core/repository/interface/i_auth_repository.dart';
import 'package:get/get.dart';
import '../../interactor/waiting_bloc.dart';

class WaitingBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<WaitingBloc>(WaitingBloc(authRepository: Get.find<IAuthRepository>()));
  }
}
