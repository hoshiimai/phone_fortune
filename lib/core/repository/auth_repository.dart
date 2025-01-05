import 'dart:io';

import 'package:callmobile/core/api/api_client.dart';
import 'package:callmobile/core/model/business/creator_status.dart';
import 'package:callmobile/core/model/business/gender_type.dart.dart';
import 'package:callmobile/core/model/response/base_response.dart';
import 'package:callmobile/core/repository/interface/i_auth_repository.dart';
import 'package:callmobile/utils/app_utils.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../model/request/complete_register_request.dart';
import '../model/request/login_request.dart';
import '../model/request/personal_info_request.dart';
import '../model/request/register_request.dart';
import '../model/request/search_creator_request.dart';
import '../model/request/verify_code_request.dart';
import '../model/response/creator_list_data.dart';
import '../model/response/error_from_server.dart';
import '../model/response/login_response_data.dart';
import '../model/response/model/user.dart';
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
  Future<Either<ErrorFromServer, String>> register(
      {required String name,
      required String email,
      required String password,
      required GenderType gender,
      required DateTime birthDate}) async {
    try {
      final response = await apiClient.register(RegisterRequest(
          fullName: name,
          email: email,
          password: password,
          gender: gender.toInt(),
          birthDate: AppUtils.formatDate(birthDate)));
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

  @override
  Future<Either<ErrorFromServer, String>> completeRegister({
    required CompleteRegisterRequest request,
  }) async {
    try {
      final response = await apiClient.completeRegister(
        request: request,
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

  @override
  Future<Either<ErrorFromServer, String>> forgotPassword({required String email}) async {
    try {
      final response = await apiClient.verifyEmailCode({
        'email': email,
      });
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

  @override
  Future<Either<ErrorFromServer, LoginResponseData>> verifyCode({required String email, required String code}) async {
    try {
      final response = await apiClient.verifyCode(VerifyCodeRequest(code: code, email: email));
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
  Future<Either<ErrorFromServer, String>> resetPassword(
      {required String accessToken, required String password, required String confirmPassword}) async {
    try {
      final response = await apiClient.resetPassword(request: {
        'password': password,
        'confirmPassword': confirmPassword,
      }, accessToken: 'Bearer $accessToken');
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

  @override
  Future<Either<ErrorFromServer, String>> updateProfile({
    String? fullName,
    String? welcomeMessage,
    File? avatar,
    int? gender,
    String? birthDate,
  }) async {
    try {
      final response = await apiClient.updateProfile(
        avatar: avatar,
        name: fullName,
        welcomeMessage: welcomeMessage,
        gender: gender,
        birthDate: birthDate,
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

  @override
  Future<Either<ErrorFromServer, User>> getProfile() async {
    try {
      final response = await apiClient.getProfile();
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
  Future<Either<ErrorFromServer, String>> updateEmail({required String email}) async {
    try {
      final response = await apiClient.updateEmail({
        'email': email,
      });
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

  @override
  Future<Either<ErrorFromServer, String>> updateEmailComplete({required String code}) async {
    try {
      final response = await apiClient.updateEmailComplete({
        'code': code,
      });
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

  @override
  Future<Either<ErrorFromServer, String>> updatePassword(
      {required String currentPass, required String newPass, required String confirmPass}) async {
    try {
      final response = await apiClient.updatePassword({
        'currentPassword': currentPass,
        'password': newPass,
        'confirmPassword': confirmPass,
      });
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

  @override
  Future<Either<ErrorFromServer, List<User>>> getListCreator() async {
    try {
      final response = await apiClient.getListCreator();
      if (response.isSuccess == true) {
        return right(response.creators);
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
  Future<Either<ErrorFromServer, CreatorListData>> searchCreators({required String keyword, required int page}) async {
    try {
      final response = await apiClient.searchCreators(SearchCreatorRequest(key: keyword), page);
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
  Future<Either<ErrorFromServer, String>> updateIdolProfile({
    String? fullName,
    String? welcomeMessage,
    File? avatar,
    File? cover,
  }) async {
    try {
      final response = await apiClient.updateIdolProfile(
        avatar: avatar,
        name: fullName,
        welcomeMessage: welcomeMessage,
        cover: cover,
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

  @override
  Future<Either<ErrorFromServer, String>> updatePersonalInfo(
      {required String name, required String kataName, required String birthDate, required String phoneNumber}) async {
    try {
      final response = await apiClient.updatePersonalInfo(
          PersonalInfoRequest(name: name, kataName: kataName, birthDate: birthDate, phoneNumber: phoneNumber));
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

  @override
  Future<Either<ErrorFromServer, String>> updateStatus({required Status status}) async {
    try {
      final response = await apiClient.updateStatus({'status': status.toInt()});
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

  @override
  Future<Either<ErrorFromServer, User>> getUserDetail({
    required int userId,
  }) async {
    try {
      final response = await apiClient.getUserDetail(userId);
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
  Future<Either<ErrorFromServer, User>> getCreatorDetail({
    required int creatorId,
  }) async {
    try {
      final response = await apiClient.getCreatorDetail(creatorId);
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
  Future<Either<ErrorFromServer, List<User>>> getWaitingFans() async {
    try {
      final response = await apiClient.getWaitingFan();
      final baseResponse = BaseResponse<List<User>>(
        isSuccess: response["is_success"],
        message: response["error_message"],
        errorCode: response["error_code"] as int?,
        data: response["data"] != null ? List.from(response["data"]).map((e) => User.fromJson(e)).toList() : [],
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
  Future<Either<ErrorFromServer, User>> getRecentCallFan() async {
    try {
      final response = await apiClient.getRecentCallFan();
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
}
