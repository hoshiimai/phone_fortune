import 'package:callmobile/core/repository/interface/i_auth_repository.dart';
import 'package:callmobile/ui/fan/main/interactor/main_bloc.dart';
import 'package:get/get.dart';
import '../../interactor/search_bloc.dart';

class SearchBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<SearchBloc>(SearchBloc(mainBloc: Get.find<MainBloc>(), authRepository: Get.find<IAuthRepository>()));
  }
}
