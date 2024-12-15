import 'package:get/get.dart';

import '../../interactor/creator_profile_bloc.dart';


class CreatorProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.create<CreatorProfileBloc>(() => CreatorProfileBloc(), permanent: false);
  }
}
