import '../response/model/user.dart';

class CallSummaryArgument {
  final int roomId;
  final User user;
  final int durationInSecond;

  CallSummaryArgument({required this.roomId, required this.user, required this.durationInSecond });
}