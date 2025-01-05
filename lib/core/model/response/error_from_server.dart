
import 'package:get/get.dart';



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
    return ErrorFromServer(status: false, errorCode: unknownErrorCode, message: customMessage ?? 'サーバー エラーが発生しました。');
  }

  factory ErrorFromServer.unAuthorize() {
    return ErrorFromServer(status: false, errorCode: unAuthorizeCode, message: 'セッションが無効化されました。もう一度ログインしてください！');
  }
  factory ErrorFromServer.noInternetConnection() {
    return ErrorFromServer(
        status: false, errorCode: noInternetConnectionCode, message: 'インターネット接続されていません。ネットワークの接続を確認し、もう一度試してください！');
  }
}
