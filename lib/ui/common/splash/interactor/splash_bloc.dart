import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:callmobile/ui/base/interactor/page_command.dart';
import 'package:callmobile/ui/base/interactor/page_states.dart';
import 'package:callmobile/utils/app_pages.dart';

import '../../../../core/model/enum/enum_role.dart';
import '../../../../utils/app_shared.dart';

part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(const SplashState(error: '', status: PageState.loading)) {
    on<Init>(_init);
  }
  FutureOr<void> _init(Init event, Emitter<SplashState> emit) async {
    final appShared = Get.find<AppShared>();
    final accessToken = appShared.getAccessTokenValue();
    // Get.find<FirebaseMessagingManager>().registerTokenFCM();
    if (accessToken?.isNotEmpty ?? false) {
      // Get.find<FirebaseMessagingManager>().fetchAndSaveFcmToken();

      final role = appShared
          .getUser()
          ?.role;

      // Get.put(Signaling()).connect();

      if (role == Role.creator) {
        Get.offAllNamed(AppPages.mainCreator);
      } else {
        Get.offAllNamed(AppPages.main);
      }
    } else {
      Future.delayed(
        const Duration(seconds: 3),
            () => Get.offAllNamed(AppPages.signIn),
      );
    }
  }
}
