import 'package:dartz/dartz.dart';

import 'package:callmobile/core/model/response/login_response_data.dart';

import '../../model/request/login_request.dart';

import '../../model/response/error_from_server.dart';

abstract class IAuthRepository {
  Future<Either<ErrorFromServer, LoginResponseData>> login(LoginRequest loginRequest);
}
