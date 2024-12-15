import 'package:json_annotation/json_annotation.dart';

import 'error_from_server.dart';
part 'base_response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class BaseResponse<T> {
  final bool isSuccess;
  final int? errorCode;
  final String? message;
  final T? data;

  BaseResponse({required this.isSuccess, this.errorCode, this.message, required this.data});

  factory BaseResponse.fromJson(Map<String, dynamic> json, Function(Map<String, dynamic>) create) {
    return BaseResponse<T>(
        isSuccess: json["is_success"],
        message: json["error_message"],
        errorCode: json["error_code"] as int?,
        data: json["data"] != null ? create(json["data"]) : null);
  }

  ErrorFromServer errorFromServer() {
    return ErrorFromServer(
      status: isSuccess,
      errorCode: errorCode,
      message: message
    );
  }
}
