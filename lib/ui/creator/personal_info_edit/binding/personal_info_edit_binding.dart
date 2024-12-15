import 'package:get/get.dart';

import '../../../../core/repository/interface/i_auth_repository.dart';
import '../interactor/personal_info_edit_bloc.dart';

class PersonalInfoEditBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<PersonalInfoEditBloc>(PersonalInfoEditBloc(authRepository: Get.find<IAuthRepository>()));
  }
}
