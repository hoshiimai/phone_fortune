
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:callmobile/core/api/api_client.dart';
import 'package:callmobile/core/repository/interface/i_auth_repository.dart';

import '../model/request/login_request.dart';
import '../model/response/error_from_server.dart';
import '../model/response/login_response_data.dart';
import '../model/response/refresh_token_data.dart';

class AuthRepository extends IAuthRepository {
  final ApiClient apiClient;

  AuthRepository(this.apiClient);

  @override
  Future<Either<ErrorFromServer, LoginResponseData>> login(LoginRequest loginRequest) async {
    try {
      final response = await apiClient.login(loginRequest);
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
  Future<Either<ErrorFromServer, RefreshTokenData>> refreshToken(String refreshToken) async {
    return left(ErrorFromServer.unknownError());
    // try {
    //   final response =
    //   await apiClient.refreshToken(RefreshTokenRequest(refreshToken: refreshToken));
    //   if (response.isSuccess == true) {
    //     return right(response.data!);
    //   } else {
    //     return left(response.errorFromServer());
    //   }
    // } on DioException catch (_) {
    //   return left(ErrorFromServer.unknownError());
    // } on Exception {
    //   return left(ErrorFromServer.unknownError());
    // }
  }
}
