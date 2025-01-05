part of 'call_summary_bloc.dart';

class CallSummaryState extends Equatable {
  final PageState status;
  final String error;
  final PageCommand? pageCommand;
  final int? roomId;
  final Room? room;
  const CallSummaryState({
    required this.status,
    required this.error,
    this.pageCommand,
    this.roomId,
    this.room,
  });

  CallSummaryState copyWith({
    PageState? status,
    String? error,
    int? roomId,
    Room? room,
  }) {
    return CallSummaryState(
      status: status ?? this.status,
      error: error ?? this.error,
      pageCommand: pageCommand,
      roomId: roomId ?? this.roomId,
      room: room ?? this.room,
    );
  }

  @override
  List<Object?> get props => [
        status,
        error,
        pageCommand,
        roomId,
        room,
      ];
}
