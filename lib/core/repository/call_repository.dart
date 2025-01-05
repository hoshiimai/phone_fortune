import 'package:callmobile/core/api/api_client.dart';
import 'package:callmobile/core/model/response/base_response.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../model/response/error_from_server.dart';
import '../model/response/model/room.dart';
import 'interface/i_call_repository.dart';

class CallRepository extends ICallRepository {
  final ApiClient apiClient;

  CallRepository(this.apiClient);

  @override
  Future<Either<ErrorFromServer, Room>> createRoom(
    int creatorId,
  ) async {
    try {
      final map = {
        'idolId': creatorId,
      };
      final response = await apiClient.createRoom(map);
      if (response.isSuccess == true) {
        return right(response.data!);
      } else {
        return left(response.errorFromServer());
      }
    } on DioException catch (_) {
      return left(ErrorFromServer.unknownError());
    } on Exception {
      return left(ErrorFromServer.unknownError());
    }
  }

  @override
  Future<Either<ErrorFromServer, List<Room>>> getCallHistory() async {
    try {
      final response = await apiClient.getCalHistory();
      final baseResponse = BaseResponse<List<Room>>(
        isSuccess: response["is_success"],
        message: response["error_message"],
        errorCode: response["error_code"] as int?,
        data: response["data"] != null ? List.from(response["data"]).map((e) => Room.fromJson(e)).toList() : [],
      );
      if (baseResponse.isSuccess == true) {
        return right(baseResponse.data ?? []);
      } else {
        return left(baseResponse.errorFromServer());
      }
    } on DioException catch (_) {
      return left(ErrorFromServer.unknownError());
    } on Exception {
      return left(ErrorFromServer.unknownError());
    }
  }

  @override
  Future<Either<ErrorFromServer, String>> registerCall({required int creatorId}) async {
    try {
      final map = {
        'idolId': creatorId,
      };
      final response = await apiClient.registerCall(map);
      if (response.isSuccess == true) {
        return right(response.message!);
      } else {
        return left(response.errorFromServer());
      }
    } on DioException catch (_) {
      return left(ErrorFromServer.unknownError());
    } on Exception {
      return left(ErrorFromServer.unknownError());
    }
  }

  @override
  Future<Either<ErrorFromServer, Room>> getRoomDetail({required int roomId}) async {
    try {
      final response = await apiClient.getRoomDetail(roomId);
      if (response.isSuccess == true) {
        return right(response.data!);
      } else {
        return left(response.errorFromServer());
      }
    } on DioException catch (_) {
      return left(ErrorFromServer.unknownError());
    } on Exception {
      return left(ErrorFromServer.unknownError());
    }
  }

  @override
  Future<Either<ErrorFromServer, String>> updateCallingStatus({required int roomId, required int status}) async {
    try {
      final response = await apiClient.updateCallingStatus(
        {
          'status': status,
        },
        roomId,
      );
      if (response.isSuccess == true) {
        return right(response.message ?? '');
      } else {
        return left(response.errorFromServer());
      }
    } on DioException catch (_) {
      return left(ErrorFromServer.unknownError());
    } on Exception {
      return left(ErrorFromServer.unknownError());
    }
  }
}
