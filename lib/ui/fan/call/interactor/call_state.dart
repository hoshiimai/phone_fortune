part of 'call_bloc.dart';

class CallState extends Equatable {
  final PageState status;
  final String error;
  final PageCommand? pageCommand;
  final User? userCreator;
  final bool inCalling;
  final bool isShowBottomAction;
  final bool isMute;
  final bool isOffVideo;
  final bool isFrontCamera;
  final double rating;
  final User? self;
  final int timeCall;
  final RTCVideoRenderer localRenderer;
  final RTCVideoRenderer remoteRenderer;
  final Room? room;
  final bool isFirstTimeExceeded;
  final bool isNewMessage;
  final int totalTip;
  final List<int> tips;
  final int totalPointCall;
  final int? afterCallFee;
  final bool showPurchase;
  final bool isEnd;
  const CallState({
    required this.status,
    required this.error,
    this.pageCommand,
    this.userCreator,
    this.inCalling = false,
    this.isShowBottomAction = true,
    this.rating = 0,
    this.isMute = true,
    this.isOffVideo = true,
    this.isFrontCamera = false,
    this.self,
    this.timeCall = 0,
    required this.localRenderer,
    required this.remoteRenderer,
    this.room,
    this.isFirstTimeExceeded = false,
    this.isNewMessage = false,
    this.totalTip = 0,
    this.totalPointCall = 0,
    this.tips = const [],
    this.afterCallFee,
    this.showPurchase = false,
    this.isEnd = false,
  });

  CallState copyWith({
    PageState? status,
    String? error,
    User? userCreator,
    bool? inCalling,
    double? rating,
    bool? isShowBottomAction,
    bool? isMute,
    bool? isOffVideo,
    bool? isFrontCamera,
    User? self,
    int? timeCall,
    RTCVideoRenderer? localRenderer,
    RTCVideoRenderer? remoteRenderer,
    Room? room,
    bool? isFirstTimeExceeded,
    bool? isNewMessage,
    int? totalTip,
    int? totalPointCall,
    List<int>? tips,
    int? afterCallFee,
    bool? showPurchase,
    bool? isEnd,
  }) {
    return CallState(
      status: status ?? this.status,
      error: error ?? this.error,
      pageCommand: pageCommand,
      userCreator: userCreator ?? this.userCreator,
      inCalling: inCalling ?? this.inCalling,
      rating: rating ?? this.rating,
      isShowBottomAction: isShowBottomAction ?? this.isShowBottomAction,
      isMute: isMute ?? this.isMute,
      isOffVideo: isOffVideo ?? this.isOffVideo,
      isFrontCamera: isFrontCamera ?? this.isFrontCamera,
      self: self ?? this.self,
      timeCall: timeCall ?? this.timeCall,
      localRenderer: localRenderer ?? this.localRenderer,
      remoteRenderer: remoteRenderer ?? this.remoteRenderer,
      room: room ?? this.room,
      isFirstTimeExceeded: isFirstTimeExceeded ?? this.isFirstTimeExceeded,
      isNewMessage: isNewMessage ?? this.isNewMessage,
      totalTip: totalTip ?? this.totalTip,
      totalPointCall: totalPointCall ?? this.totalPointCall,
      tips: tips ?? this.tips,
      afterCallFee: afterCallFee ?? this.afterCallFee,
      showPurchase: showPurchase ?? this.showPurchase,
      isEnd: isEnd ?? this.isEnd,
    );
  }

  @override
  List<Object?> get props => [
        status,
        error,
        pageCommand,
        userCreator,
        inCalling,
        rating,
        isShowBottomAction,
        isMute,
        isOffVideo,
        isFrontCamera,
        self,
        timeCall,
        localRenderer,
        remoteRenderer,
        room,
        isFirstTimeExceeded,
        isNewMessage,
        totalTip,
        totalPointCall,
        tips,
        afterCallFee,
        showPurchase,
        isEnd
      ];
}
