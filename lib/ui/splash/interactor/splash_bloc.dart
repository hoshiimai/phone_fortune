import 'dart:async';
import 'dart:ui';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:callmobile/ui/base/interactor/page_command.dart';
import 'package:callmobile/ui/base/interactor/page_states.dart';
import 'package:callmobile/utils/app_pages.dart';

import '../../../locale/translation_manager.dart';

part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(const SplashState(error: '', status: PageState.loading)) {
    on<Init>(_init);
  }
  FutureOr<void> _init(Init event, Emitter<SplashState> emit) async {
    Get.find<TranslationManager>().updateLocale(const Locale('ja'));
    Future.delayed(
      const Duration(seconds: 3),
      () => Get.offNamedUntil(AppPages.signIn, (route) => false),
    );
  }
}
