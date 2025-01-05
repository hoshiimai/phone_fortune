import 'dart:io';

import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';

import '../model/request/complete_register_request.dart';
import '../model/request/login_request.dart';

import '../model/request/personal_info_request.dart';
import '../model/request/register_request.dart';
import '../model/request/search_creator_request.dart';
import '../model/request/verify_code_request.dart';
import '../model/response/base_response.dart';

import '../model/response/creator_list_data.dart';
import '../model/response/login_response_data.dart';
import '../model/response/model/room.dart';
import '../model/response/model/user.dart';
import '../model/response/top_creator_response.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: "https://idol-call.urani.tech/")
abstract class ApiClient {
  factory ApiClient(Dio dio, {String? baseUrl}) = _ApiClient;

  @POST("api/auth/login")
  Future<BaseResponse<LoginResponseData>> login(@Body() LoginRequest loginRequest);

  @POST("api/auth/register")
  Future<BaseResponse<dynamic>> register(@Body() RegisterRequest request);

  @POST("api/auth/complete-register")
  Future<BaseResponse<dynamic>> completeRegister({
    @Body() required CompleteRegisterRequest request,
  });

  @POST("api/auth/verify-email")
  Future<BaseResponse<dynamic>> verifyEmailCode(@Body() Map<String, dynamic> request);

  @POST("api/auth/verify-code")
  Future<BaseResponse<LoginResponseData>> verifyCode(@Body() VerifyCodeRequest request);

  @POST("api/auth/reset-password")
  Future<BaseResponse<dynamic>> resetPassword({@Body() required Map<String, dynamic> request,
    @Header('Authorization') required String accessToken});

  @POST("api/user/edit")
  Future<BaseResponse<dynamic>> updateProfile({
    @Part(name: 'avatar', contentType: 'image/jpeg') File? avatar,
    @Part(name: 'fullname') String? name,
    @Part(name: 'gender') int? gender,
    @Part(name: 'birth') String? birthDate,
    @Part(name: 'introduce') String? welcomeMessage,
  });

  @GET("api/user/detail")
  Future<BaseResponse<User>> getProfile();

  @POST("api/user/edit-email")
  Future<BaseResponse<dynamic>> updateEmail(@Body() Map<String, dynamic> request);

  @POST("api/user/complete-edit-email")
  Future<BaseResponse<dynamic>> updateEmailComplete(@Body() Map<String, dynamic> request);

  @POST("api/user/edit-password")
  Future<BaseResponse<dynamic>> updatePassword(@Body() Map<String, dynamic> request);

  @GET("api/user/list-idol")
  Future<TopCreatorResponse> getListCreator();

  @POST("api/user/search-idol")
  Future<BaseResponse<CreatorListData>> searchCreators(
      @Body() SearchCreatorRequest request, @Query('page') int page);

  @POST("api/idol/edit")
  Future<BaseResponse<dynamic>> updateIdolProfile({
    @Part(name: 'avatar', contentType: 'image/jpeg') File? avatar,
    @Part(name: 'cover', contentType: 'image/jpeg') File? cover,
    @Part(name: 'fullname') String? name,
    @Part(name: 'introduce') String? welcomeMessage,
  });

  @POST("api/idol/edit-info-detail")
  Future<BaseResponse<dynamic>> updatePersonalInfo(
      @Body() PersonalInfoRequest request);

  @POST("/api/idol/edit-status")
  Future<BaseResponse<dynamic>> updateStatus(@Body() Map<String, dynamic> request);

  @POST("/api/room/create")
  Future<BaseResponse<Room>> createRoom(@Body() Map<String, dynamic> request);

  @GET("/api/room/detail/{id}")
  Future<BaseResponse<Room>> getRoomDetail(@Path('id') int roomId);

  @GET("api/user/detail/{id}")
  Future<BaseResponse<User>> getUserDetail(@Path('id') int userId);

  @GET("api/user/detail/idol/{id}")
  Future<BaseResponse<User>> getCreatorDetail(@Path('id') int userId);

  @GET("api/idol/waiting-list")
  Future<dynamic> getWaitingFan();

  @GET("api/user/conversation-history")
  Future<dynamic> getCalHistory();

  @POST("api/user/wait-idol")
  Future<BaseResponse<dynamic>> registerCall(@Body() Map<String, dynamic> request);

  @POST("/api/room/update/{roomId}")
  Future<BaseResponse<dynamic>> updateCallingStatus(@Body() Map<String, dynamic> request, @Path('roomId') int roomId);

  @GET("api/idol/recent-call")
  Future<BaseResponse<User>> getRecentCallFan();
}