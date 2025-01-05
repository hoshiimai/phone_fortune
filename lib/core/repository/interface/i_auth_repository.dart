import 'dart:io';

import 'package:callmobile/core/model/business/gender_type.dart.dart';
import 'package:callmobile/core/model/response/login_response_data.dart';
import 'package:dartz/dartz.dart';

import '../../model/business/creator_status.dart';
import '../../model/request/complete_register_request.dart';
import '../../model/request/login_request.dart';
import '../../model/response/creator_list_data.dart';
import '../../model/response/error_from_server.dart';
import '../../model/response/model/user.dart';

abstract class IAuthRepository {
  Future<Either<ErrorFromServer, LoginResponseData>> login(LoginRequest loginRequest);

  Future<Either<ErrorFromServer, String>> register({
    required String name,
    required String email,
    required String password,
    required GenderType gender,
    required DateTime birthDate,
  });

  Future<Either<ErrorFromServer, String>> completeRegister({
    required CompleteRegisterRequest request,
  });

  Future<Either<ErrorFromServer, String>> forgotPassword({
    required String email,
  });

  Future<Either<ErrorFromServer, LoginResponseData>> verifyCode({required String email, required String code});

  Future<Either<ErrorFromServer, String>> resetPassword(
      {required String accessToken, required String password, required String confirmPassword});

  Future<Either<ErrorFromServer, String>> updateProfile({
    String? fullName,
    String? welcomeMessage,
    File? avatar,
    int? gender,
    String? birthDate,
  });

  Future<Either<ErrorFromServer, User>> getProfile();

  Future<Either<ErrorFromServer, String>> updateEmail({required String email});

  Future<Either<ErrorFromServer, String>> updateEmailComplete({required String code});

  Future<Either<ErrorFromServer, String>> updatePassword(
      {required String currentPass, required String newPass, required String confirmPass});

  Future<Either<ErrorFromServer, List<User>>> getListCreator();

  Future<Either<ErrorFromServer, CreatorListData>> searchCreators({required String keyword, required int page});

  Future<Either<ErrorFromServer, String>> updateIdolProfile({
    String? fullName,
    String? welcomeMessage,
    File? avatar,
    File? cover,
  });

  Future<Either<ErrorFromServer, String>> updatePersonalInfo(
      {required String name, required String kataName, required String birthDate, required String phoneNumber});

  Future<Either<ErrorFromServer, String>> updateStatus({required Status status});

  Future<Either<ErrorFromServer, User>> getUserDetail({
    required int userId,
  });

  Future<Either<ErrorFromServer, User>> getCreatorDetail({
    required int creatorId,
  });

  Future<Either<ErrorFromServer, List<User>>> getWaitingFans();

  Future<Either<ErrorFromServer, User>> getRecentCallFan();
}
