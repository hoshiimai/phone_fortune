import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:get/get.dart';

import '../../../../core/model/enum/type_call.dart';
import '../../../../core/model/response/model/room.dart';
import '../../../../core/model/response/model/user.dart';
import '../../../../utils/app_shared.dart';
import '../../../base/interactor/page_command.dart';
import '../../../base/interactor/page_states.dart';

part 'call_event.dart';
part 'call_state.dart';

class CallBloc extends Bloc<CallEvent, CallState> {
  // final signaling = Get.find<Signaling>();
  final appShared = Get.find<AppShared>();

  CallBloc()
      : super(CallState(
            error: '',
            status: PageState.loading,
            localRenderer: RTCVideoRenderer(),
            remoteRenderer: RTCVideoRenderer())) {
    on<Init>(_init);
    on<OnChangedRate>(_onChangedRate);
    on<OnShowBottomAction>(_onShowBottomAction);
    on<OnSwitchCamera>(_onSwitchCamera);
    on<OnMute>(_onMute);

    on<OnUpdateTotalPointTip>((event, emit) {
      int tip = state.totalTip;
      tip += event.point;

      List<int> tipsClone = List.from(state.tips);
      tipsClone.add(event.point);
      emit(state.copyWith(totalTip: tip, tips: tipsClone));
    });
    on<OnUpdateTotalPointCall>((event, emit) => emit(state.copyWith(totalPointCall: event.point)));
    on<ClearNewMessage>((event, emit) => emit(state.copyWith(isNewMessage: false)));

    on((event, emit) =>
        emit.forEach(appShared.watchUser(), onData: (value) => state.copyWith(self: value)));
  }

  FutureOr<void> _init(Init event, Emitter<CallState> emit) async {
    add(const OnFetchRoomDetail());

    emit(state.copyWith(
      userCreator: event.user,
      inCalling: event.inCalling,
      timeCall: event.callTiming > 0 ? event.callTiming + 3 : event.callTiming,
    ));

    await state.localRenderer.initialize();
    await state.remoteRenderer.initialize();
  }

  FutureOr<void> _onChangedRate(OnChangedRate event, Emitter<CallState> emit) {
    emit(state.copyWith(rating: event.rate));
  }

  FutureOr<void> _onShowBottomAction(OnShowBottomAction event, Emitter<CallState> emit) {
    emit(state.copyWith(isShowBottomAction: !state.isShowBottomAction));
  }

  FutureOr<void> _onSwitchCamera(OnSwitchCamera event, Emitter<CallState> emit) async {
    // final result = await signaling.switchCamera();
    // if (result) emit(state.copyWith(isMute: !state.isFrontCamera));
  }

  FutureOr<void> _onMute(OnMute event, Emitter<CallState> emit) async {
    // final result = await signaling.muteMic(!state.isMute);
    // if (result) emit(state.copyWith(isMute: !state.isMute));
  }

}
