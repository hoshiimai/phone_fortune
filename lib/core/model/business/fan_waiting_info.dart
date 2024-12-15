import 'call_history.dart';

class FanWaitingInfo {
  final String name;
  final String title;
  final String description;
  final int waitingInMinute;
  final List<CallHistory> historyCalls;

  FanWaitingInfo({required this.name, required this.title, required this.description, required this.waitingInMinute, required this.historyCalls});

}