import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:get/get.dart' as getx;
import 'package:get/get.dart';

import '../../../core/managers/signaling.dart';
import '../../../core/model/argument/call_summary_argument.dart';
import '../../../core/model/enum/enum_role.dart';
import '../../../core/model/enum/type_call.dart';
import '../../../core/model/response/model/user.dart';
import '../../../utils/app_pages.dart';
import '../../base/base_page.dart';
import '../../creator/main/main_creator_page.dart';
import 'component/calling_view.dart';
import 'component/waiting_receiver_view.dart';
import 'component/waiting_view.dart';
import 'interactor/call_bloc.dart';
import 'missing_page.dart';

class CallPage extends StatefulWidget {
  final int? userId;
  final User? user;
  final bool isCaller;
  final bool inCalling;
  final int callTiming;
  final bool isStartTime;
  final int roomId;

  const CallPage({
    super.key,
    required this.user,
    required this.isCaller,
    required this.roomId,
    this.userId,
    this.inCalling = false,
    this.callTiming = 0,
    this.isStartTime = false,
  });

  @override
  State<CallPage> createState() => _CallPageState();
}

class _CallPageState extends State<CallPage> with WidgetsBindingObserver {
  final Signaling _signaling = Get.find<Signaling>();
  Timer? _timer;

  AudioPlayer player = AudioPlayer();

  _CallPageState();

  @override
  initState() {
    _connect();
    super.initState();
    WidgetsBinding.instance.addObserver(this);

    if (widget.isStartTime) {
      _startTime();
    }

    initAudio();
  }

  void initAudio() async {
    // Create the audio player.
    player = AudioPlayer();

    await player.setReleaseMode(ReleaseMode.loop);

    if (widget.isCaller) {
      await Future.delayed(const Duration(milliseconds: 2000));
      await player.play(AssetSource('sounds/sound_caller.wav'), mode: PlayerMode.lowLatency);
    } else {
      await player.play(AssetSource('sounds/sound_receive.wav'), mode: PlayerMode.mediaPlayer);
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    Get.delete<CallBloc>();
    WidgetsBinding.instance.removeObserver(this);

    player.dispose();

    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
        debugPrint("app in resumed");
        break;
      case AppLifecycleState.inactive:
        final bloc = Get.find<CallBloc>();

        if (bloc.state.inCalling) {
          bloc.add(const OnHandUp(status: TypeCall.finished));
        } else {
          bloc.add(const OnHandUp());
        }
        break;
      case AppLifecycleState.paused:
        final bloc = Get.find<CallBloc>();

        if (bloc.state.inCalling) {
          bloc.add(const OnHandUp(status: TypeCall.finished));
        } else {
          bloc.add(const OnHandUp());
        }
        break;
      case AppLifecycleState.detached:
        debugPrint("app in detached");
        break;
      case AppLifecycleState.hidden:
      // TODO: Handle this case.
    }
  }

  @override
  deactivate() {
    super.deactivate();
  }

  void _connect() async {
    _signaling.onCallStateChange = (Session session, CallStateType state) async {
      switch (state) {
        case CallStateType.callStateNew:
          Get.find<CallBloc>().add(UpdateSession(session));
          break;
        case CallStateType.callStateBye:
          final bloc = Get.find<CallBloc>();
          disposeAndReInitRemote();
          if (bloc.state.inCalling) {
            _timer?.cancel();
            if (bloc.state.self?.role == Role.creator) {
              await Get.toNamed(AppPages.callSummary, arguments: CallSummaryArgument(roomId: widget.roomId, user: bloc.state.callingUser!, durationInSecond: bloc.state.timeCall));
              Get.back();
            } else {
              // Close dialog/bottom sheet before finish
              if (Get.isDialogOpen == true) {
                Get.back();
              }
              if (Get.isBottomSheetOpen == true) {
                Get.back();
              }
              await Get.toNamed(AppPages.callSummary, arguments: CallSummaryArgument(roomId: widget.roomId, user: bloc.state.callingUser!, durationInSecond: bloc.state.timeCall));
            }
          } else {
            if (bloc.state.self?.role == Role.creator) {
              Get.back();
            } else {
              await Get.offNamed(AppPages.missingCall, arguments: {'type': MissingType.missing});
              Get.back();
            }
          }

          break;
        case CallStateType.callStateConnected:
          await player.stop();

          Get.find<CallBloc>().add(const OnChangeCall(true));

          _startTime();
          break;
      }
    };
  }

  _startTime() {
    _timer?.cancel();

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      final bloc = Get.find<CallBloc>();
      bloc.add(OnUpdateTime(bloc.state.timeCall + 1));
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => Get.find<CallBloc>()
        ..add(Init(
          roomId: widget.roomId,
          userId: widget.userId,
          user: widget.user,
          inCalling: widget.inCalling,
          callTiming: widget.callTiming,
        )),
      child: BlocConsumer<CallBloc, CallState>(
        listener: (BuildContext context, CallState state) {},
        builder: (BuildContext context, CallState state) {
          return PopScope(
            canPop: false,
            child: Scaffold(
              extendBodyBehindAppBar: true,
              body: BasePage(
                  isBackground: false,
                  child: state.inCalling
                      ? CallingView(
                          hangUp: () async {
                            context.read<CallBloc>().add(const OnHandUp(status: TypeCall.finished));
                          },
                          onUpdateMic: () {
                            context.read<CallBloc>().add(const OnUpdateMic());
                          },
                          onUpdateSpeaker: () {
                            context.read<CallBloc>().add(const OnUpdateSpeaker());
                          },
                        )
                      : widget.isCaller
                          ? WaitingView(
                              onCancel: () {
                                context.read<CallBloc>().add(const OnHandUp());
                              },
                              onMute: () {},
                              onUpdateSpeaker: () {},
                              onSwitchCamera: () {
                                context.read<CallBloc>().add(const OnSwitchCamera());
                              },
                              onTimeOut: () async {
                                context.read<CallBloc>().add(const OnHandUp(isTimeOut: true));
                              },
                            )
                          : WaitingReceiverView(
                              onAccept: () {
                                Get.find<CallBloc>().add(const OnAccept());
                                Get.find<CallBloc>().add(const OnChangeCall(true));
                                _startTime();
                                player.stop();
                                Get.find<CallBloc>().add(Init(
                                  roomId: widget.roomId,
                                  userId: widget.userId,
                                  user: widget.user,
                                  inCalling: true,
                                  callTiming: widget.callTiming,
                                ));
                              },
                              onCancel: () {
                                context.read<CallBloc>().add(const OnReject());
                              },
                              onMute: () {},
                              onUpdateSpeaker: () {},
                              onSwitchCamera: () {
                                context.read<CallBloc>().add(const OnSwitchCamera());
                              },
                            )),
            ),
          );
        },
      ),
    );
  }

  Future disposeAndReInitRemote() async {
    remoteRenderer.dispose();
    remoteRenderer = RTCVideoRenderer();
    await remoteRenderer.initialize();
    await Future.delayed(const Duration(seconds: 1));
    remoteRenderer.srcObject = _signaling.mRemoteStream;
  }
}
