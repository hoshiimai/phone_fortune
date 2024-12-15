import 'package:get/get.dart';
import '../../interactor/fan_profile_bloc.dart';

class FanProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.create<FanProfileBloc>(() => FanProfileBloc(), permanent: false);
  }
}
