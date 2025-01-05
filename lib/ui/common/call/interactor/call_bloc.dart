import 'dart:async';

import 'package:callmobile/core/repository/interface/i_auth_repository.dart';
import 'package:callmobile/core/repository/interface/i_call_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:get/get.dart';

import '../../../../core/managers/signaling.dart';
import '../../../../core/model/enum/enum_role.dart';
import '../../../../core/model/enum/type_call.dart';
import '../../../../core/model/response/model/user.dart';
import '../../../../utils/app_shared.dart';
import '../../../base/interactor/page_command.dart';
import '../../../base/interactor/page_states.dart';

part 'call_event.dart';
part 'call_state.dart';

class CallBloc extends Bloc<CallEvent, CallState> {
  final IAuthRepository authRepository;
  final ICallRepository callRepository;
  final signaling = Get.find<Signaling>();
  final appShared = Get.find<AppShared>();

  CallBloc({required this.authRepository, required this.callRepository,})
      : super(CallState(
            error: '',
            status: PageState.loading,
            localRenderer: RTCVideoRenderer(),
            remoteRenderer: RTCVideoRenderer())) {
    on<Init>(_init);
    on<OnChangedRate>(_onChangedRate);
    on<OnShowBottomAction>(_onShowBottomAction);
    on<OnUpdateMic>(_onUpdateMic);
    on<OnUpdateSpeaker>(_onUpdateSpeaker);
    on<UpdateSession>(_onUpdateSession);
    on<OnAccept>(_onAccept);
    on<OnHandUp>(_onHandUp);
    on<OnReject>(_onReject);
    on<OnChangeCall>(_onChangeCall);
    on<OnUpdateTime>(_onUpdateTime);
    on<ClearNewMessage>((event, emit) => emit(state.copyWith(isNewMessage: false)));

    on((event, emit) =>
        emit.forEach(appShared.watchUser(), onData: (value) => state.copyWith(self: value)));

    // signaling.onMessChange = (data) {
    //   add(OnAddNewMessage(data));
    // };
  }

  FutureOr<void> _init(Init event, Emitter<CallState> emit) async {
    add(const OnFetchRoomDetail());

    if(event.user != null) {{
      emit(state.copyWith(
        callingUser: event.user,
        inCalling: event.inCalling,
        timeCall: event.callTiming > 0 ? event.callTiming + 3 : event.callTiming,
        roomId: event.roomId,
      ));
    }} else {
      final response = await authRepository.getUserDetail(userId: event.userId!);
      response.fold((error) {

      }, (user) {
        emit(state.copyWith(
          roomId: event.roomId,
          callingUser: user,
          inCalling: event.inCalling,
          timeCall: event.callTiming > 0 ? event.callTiming + 3 : event.callTiming,
        ));
      });
    }
    await state.localRenderer.initialize();
    await state.remoteRenderer.initialize();

    signaling.onLocalStream = ((stream) {
      state.localRenderer.srcObject = stream;
    });

    signaling.onAddRemoteStream = ((_, stream) {
      state.remoteRenderer.srcObject = stream;
    });

    signaling.onRemoveRemoteStream = ((_, stream) {
      state.remoteRenderer.srcObject = null;
    });
  }

  FutureOr<void> _onChangedRate(OnChangedRate event, Emitter<CallState> emit) {
    emit(state.copyWith(rating: event.rate));
  }

  FutureOr<void> _onShowBottomAction(OnShowBottomAction event, Emitter<CallState> emit) {
    emit(state.copyWith(isShowBottomAction: !state.isShowBottomAction));
  }

  FutureOr<void> _onUpdateMic(OnUpdateMic event, Emitter<CallState> emit) async {
    final result = await signaling.enableMic(!state.isMicOn);
    if (result) emit(state.copyWith(isMicOn: !state.isMicOn));
  }

  FutureOr<void> _onUpdateSpeaker(OnUpdateSpeaker event, Emitter<CallState> emit) async {
    await signaling.setAudioOutput(!state.isSpeakerOn);
    emit(state.copyWith(isSpeakerOn: !state.isSpeakerOn));
  }

  FutureOr<void> _onUpdateSession(UpdateSession event, Emitter<CallState> emit) {
    emit(state.copyWith(session: event.session));
  }

  FutureOr<void> _onAccept(OnAccept event, Emitter<CallState> emit) {
    if (state.session != null) {
      signaling.accept(state.session!.sid, 'video');
    }
  }

  FutureOr<void> _onHandUp(OnHandUp event, Emitter<CallState> emit) async {
    if (state.session == null) return;

    debugPrint("_onHandUp");
    signaling.bye(state.session!.sid, state.timeCall, status: event.status);

    if (event.status == TypeCall.finished) {
      // Close dialog/bottom sheet before finish
      if (Get.isDialogOpen == true) {
        Get.back();
      }
      if (Get.isBottomSheetOpen == true) {
        Get.back();
      }
    } else {
      Get.back();
    }
  }

  FutureOr<void> _onReject(OnReject event, Emitter<CallState> emit) {
    if (state.session != null) {
      signaling.reject(state.session!.sid, state.timeCall);
    }
  }

  FutureOr<void> _onChangeCall(OnChangeCall event, Emitter<CallState> emit) async {
    emit(state.copyWith(inCalling: event.inCalling));

    if (event.inCalling && (state.self?.role == Role.fan)) {
      // final room = state.userCreator?.creatorRoom?.firstOrNull != null
      //     ? Room.fromJson(state.userCreator?.creatorRoom?.firstOrNull)
      //     : null;

      // int amount = room?.initialCallFee ?? state.userCreator?.initialCallFee ?? 0;
      //
      // await _updateRoom(status: TypeCall.calling, amount: amount);

      await callRepository.updateCallingStatus(roomId: state.roomId!, status: 1);

      add(const OnFetchRoomDetail());
    }
  }
  FutureOr<void> _onUpdateTime(OnUpdateTime event, Emitter<CallState> emit) async {
    if (state.isEnd) return;
    emit(state.copyWith(timeCall: event.time));
  }

}
