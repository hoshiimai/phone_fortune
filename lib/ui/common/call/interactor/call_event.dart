part of 'call_bloc.dart';

abstract class CallEvent extends Equatable {
  const CallEvent();
}

class Init extends CallEvent {
  final int roomId;
  final int? userId;
  final User? user;
  final bool inCalling;
  final int callTiming;
  const Init({required this.roomId, this.userId, this.user, required this.inCalling, required this.callTiming});

  @override
  List<Object?> get props => [user, userId, inCalling, callTiming];
}

class OnAccept extends CallEvent {
  const OnAccept();

  @override
  List<Object> get props => [];
}

class OnChangeCall extends CallEvent {
  final bool inCalling;
  const OnChangeCall(this.inCalling);

  @override
  List<Object> get props => [inCalling];
}

class OnChangedRate extends CallEvent {
  final double rate;
  const OnChangedRate(this.rate);

  @override
  List<Object> get props => [rate];
}

class OnShowBottomAction extends CallEvent {
  const OnShowBottomAction();

  @override
  List<Object> get props => [];
}

class OnSwitchCamera extends CallEvent {
  const OnSwitchCamera();

  @override
  List<Object> get props => [];
}

class OnUpdateMic extends CallEvent {
  const OnUpdateMic();

  @override
  List<Object> get props => [];
}

class OnUpdateSpeaker extends CallEvent {
  const OnUpdateSpeaker();

  @override
  List<Object> get props => [];
}

class OnTipPoint extends CallEvent {
  final int amount;
  const OnTipPoint({
    required this.amount,
  });

  @override
  List<Object> get props => [];
}

class OnClearPageCommand extends CallEvent {
  const OnClearPageCommand();

  @override
  List<Object> get props => [];
}

class OnClearCall extends CallEvent {
  const OnClearCall();

  @override
  List<Object> get props => [];
}

class UpdateSession extends CallEvent {
  final Session session;
  const UpdateSession(this.session);

  @override
  List<Object> get props => [];
}

class OnUpdateTime extends CallEvent {
  final int time;
  const OnUpdateTime(this.time);

  @override
  List<Object> get props => [time];
}

class OnHandUp extends CallEvent {
  final TypeCall status;
  final bool isTimeOut;
  const OnHandUp({this.status = TypeCall.cancel, this.isTimeOut = false});

  @override
  List<Object> get props => [status];
}

class OnReject extends CallEvent {
  const OnReject();

  @override
  List<Object> get props => [];
}

class OnFetchRoomDetail extends CallEvent {
  const OnFetchRoomDetail();

  @override
  List<Object> get props => [];
}

class OnSubmitRating extends CallEvent {
  const OnSubmitRating();

  @override
  List<Object> get props => [];
}

class ClearNewMessage extends CallEvent {
  const ClearNewMessage();

  @override
  List<Object> get props => [];
}

class OnUpdateTotalPointTip extends CallEvent {
  final int point;
  const OnUpdateTotalPointTip(this.point);

  @override
  List<Object> get props => [point];
}

class OnUpdateTotalPointCall extends CallEvent {
  final int point;
  const OnUpdateTotalPointCall(this.point);

  @override
  List<Object> get props => [point];
}

class OnShowPurchase extends CallEvent {
  final bool isShown;
  const OnShowPurchase(this.isShown);

  @override
  List<Object> get props => [isShown];
}
