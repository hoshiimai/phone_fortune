import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../../../core/model/response/model/user.dart';
import '../../../../utils/app_shared.dart';
import '../../../base/interactor/page_command.dart';
import '../../../base/interactor/page_states.dart';

part 'setting_event.dart';
part 'setting_state.dart';

class SettingBloc extends Bloc<SettingEvent, SettingState> {
  final appShared = Get.find<AppShared>();

  SettingBloc() : super(const SettingState(error: '', status: PageState.loading)) {
    on<Init>(_onInit);
    on((event, emit) async => await emit.forEach(appShared.watchUser(), onData: (value) {
          return state.copyWith(self: value);
        }));
  }

  FutureOr<void> _onInit(Init event, Emitter<SettingState> emit) {
    final user = appShared.getUser();
    emit(state.copyWith(self: user));
  }
}
