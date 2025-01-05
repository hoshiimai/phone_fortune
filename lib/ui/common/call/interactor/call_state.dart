part of 'call_bloc.dart';

class CallState extends Equatable {
  final PageState status;
  final String error;
  final PageCommand? pageCommand;
  final User? callingUser;
  final bool inCalling;
  final bool isShowBottomAction;
  final bool isMicOn;
  final bool isSpeakerOn;
  final bool isFrontCamera;
  final double rating;
  final User? self;
  final int timeCall;
  final RTCVideoRenderer localRenderer;
  final RTCVideoRenderer remoteRenderer;
  final int? roomId;
  final bool isFirstTimeExceeded;
  final bool isNewMessage;
  final int totalTip;
  final List<int> tips;
  final int totalPointCall;
  final int? afterCallFee;
  final bool showPurchase;
  final bool isEnd;
  final Session? session;
  const CallState({
    required this.status,
    required this.error,
    this.pageCommand,
    this.callingUser,
    this.inCalling = false,
    this.isShowBottomAction = true,
    this.rating = 0,
    this.isMicOn = true,
    this.isSpeakerOn = true,
    this.isFrontCamera = false,
    this.self,
    this.timeCall = 0,
    required this.localRenderer,
    required this.remoteRenderer,
    this.roomId,
    this.isFirstTimeExceeded = false,
    this.isNewMessage = false,
    this.totalTip = 0,
    this.totalPointCall = 0,
    this.tips = const [],
    this.afterCallFee,
    this.showPurchase = false,
    this.isEnd = false,
    this.session,
  });

  CallState copyWith({
    PageState? status,
    String? error,
    User? callingUser,
    bool? inCalling,
    double? rating,
    bool? isShowBottomAction,
    bool? isMicOn,
    bool? isSpeakerOn,
    bool? isFrontCamera,
    User? self,
    int? timeCall,
    RTCVideoRenderer? localRenderer,
    RTCVideoRenderer? remoteRenderer,
    int? roomId,
    bool? isFirstTimeExceeded,
    bool? isNewMessage,
    int? totalTip,
    int? totalPointCall,
    List<int>? tips,
    int? afterCallFee,
    bool? showPurchase,
    bool? isEnd,
    Session? session,
  }) {
    return CallState(
      status: status ?? this.status,
      error: error ?? this.error,
      pageCommand: pageCommand,
      callingUser: callingUser ?? this.callingUser,
      inCalling: inCalling ?? this.inCalling,
      rating: rating ?? this.rating,
      isShowBottomAction: isShowBottomAction ?? this.isShowBottomAction,
      isMicOn: isMicOn ?? this.isMicOn,
      isSpeakerOn: isSpeakerOn ?? this.isSpeakerOn,
      isFrontCamera: isFrontCamera ?? this.isFrontCamera,
      self: self ?? this.self,
      timeCall: timeCall ?? this.timeCall,
      localRenderer: localRenderer ?? this.localRenderer,
      remoteRenderer: remoteRenderer ?? this.remoteRenderer,
      roomId: roomId ?? this.roomId,
      isFirstTimeExceeded: isFirstTimeExceeded ?? this.isFirstTimeExceeded,
      isNewMessage: isNewMessage ?? this.isNewMessage,
      totalTip: totalTip ?? this.totalTip,
      totalPointCall: totalPointCall ?? this.totalPointCall,
      tips: tips ?? this.tips,
      afterCallFee: afterCallFee ?? this.afterCallFee,
      showPurchase: showPurchase ?? this.showPurchase,
      isEnd: isEnd ?? this.isEnd,
      session: session ?? this.session,
    );
  }

  @override
  List<Object?> get props => [
        status,
        error,
        pageCommand,
        callingUser,
        inCalling,
        rating,
        isShowBottomAction,
        isMicOn,
        isSpeakerOn,
        isFrontCamera,
        self,
        timeCall,
        localRenderer,
        remoteRenderer,
        roomId,
        isFirstTimeExceeded,
        isNewMessage,
        totalTip,
        totalPointCall,
        tips,
        afterCallFee,
        showPurchase,
        isEnd,
        session,
      ];
}
