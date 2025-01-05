part of 'call_summary_bloc.dart';

abstract class CallSummaryEvent extends Equatable {
  const CallSummaryEvent();
}

class Init extends CallSummaryEvent {
  final int roomId;

  const Init({required this.roomId,});

  @override
  List<Object?> get props => [roomId];
}