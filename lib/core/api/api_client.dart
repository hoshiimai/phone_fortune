import 'package:dio/dio.dart';

import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';

import '../model/request/login_request.dart';

import '../model/response/base_response.dart';

import '../model/response/login_response_data.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: "")
abstract class ApiClient {
  factory ApiClient(Dio dio, {String? baseUrl}) = _ApiClient;

  @POST("api/auth/login")
  Future<BaseResponse<LoginResponseData>> login(@Body() LoginRequest loginRequest);
}
