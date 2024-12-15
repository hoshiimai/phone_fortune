
import 'package:get/get.dart';

import '../../../locale/locale_key.dart';

class ErrorFromServer implements Exception {
  static const unknownErrorCode = 0;
  static const unAuthorizeCode = 1;
  static const noInternetConnectionCode = 2;

  final bool? status;
  final int? errorCode;
  final String? message;

  // Init
  ErrorFromServer({
    this.status,
    this.errorCode,
    this.message,
  });

  // Error from Server
  factory ErrorFromServer.fromJson(Map<String, dynamic> json) {
    try {
      return ErrorFromServer(
        status: json['status'] as bool?,
        errorCode: json['error_code'] as int?,
        message: json['error_message'] as String?,
      );
    } catch (e) {
      return ErrorFromServer.unknownError(customMessage: e.toString());
    }
  }

  factory ErrorFromServer.unknownError({String? customMessage}) {
    return ErrorFromServer(status: false, errorCode: unknownErrorCode, message: customMessage ?? LocaleKey.unknownError.tr);
  }

  factory ErrorFromServer.unAuthorize() {
    return ErrorFromServer(status: false, errorCode: unAuthorizeCode, message: LocaleKey.unAuthorized.tr);
  }
  factory ErrorFromServer.noInternetConnection() {
    return ErrorFromServer(
        status: false, errorCode: noInternetConnectionCode, message: LocaleKey.noInternetConnection.tr);
  }
}
