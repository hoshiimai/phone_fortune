part of 'history_chat_bloc.dart';

abstract class HistoryChatEvent extends Equatable {
  const HistoryChatEvent();
}

class Init extends HistoryChatEvent {
  const Init();

  @override
  List<Object> get props => [];
}

class OnLoadHistory extends HistoryChatEvent {
  final bool isReset;
  final DateTime? fromDateTime;

  const OnLoadHistory({required this.isReset, this.fromDateTime});

  @override
  List<Object?> get props => [isReset, fromDateTime];
}

class OnClearPageCommand extends HistoryChatEvent {
  const OnClearPageCommand();

  @override
  List<Object> get props => [];
}
