import 'package:dartz/dartz.dart';

import '../../model/response/error_from_server.dart';
import '../../model/response/model/room.dart';

abstract class ICallRepository {

  Future<Either<ErrorFromServer, Room>> createRoom(
    int creatorId,
  );

  Future<Either<ErrorFromServer, List<Room>>> getCallHistory();

  Future<Either<ErrorFromServer, String>> registerCall({required int creatorId});

  Future<Either<ErrorFromServer, Room>> getRoomDetail({required int roomId});

  Future<Either<ErrorFromServer, String>> updateCallingStatus({required int roomId, required int status});
}
