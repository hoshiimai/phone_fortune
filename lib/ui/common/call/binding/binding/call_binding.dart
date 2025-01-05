import 'package:callmobile/core/repository/interface/i_auth_repository.dart';
import 'package:callmobile/core/repository/interface/i_call_repository.dart';
import 'package:get/get.dart';

import '../../interactor/call_bloc.dart';

class CallBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<CallBloc>(
        CallBloc(authRepository: Get.find<IAuthRepository>(), callRepository: Get.find<ICallRepository>()));
  }
}
