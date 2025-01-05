import '../../business/creator_status.dart';

class Creator {
  final String name;
  final String comment;
  final int waitingFanCount;
  final Status status;

  Creator({required this.name, required this.comment, required this.waitingFanCount, required this.status});
}