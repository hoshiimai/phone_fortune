import 'package:callmobile/core/model/response/model/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'error_from_server.dart';
part 'top_creator_response.g.dart';

@JsonSerializable()
class TopCreatorResponse {
  final bool isSuccess;
  final int? errorCode;
  final String? message;
  final List<User> creators;

  TopCreatorResponse({required this.isSuccess, this.errorCode, this.message, required this.creators});

  factory TopCreatorResponse.fromJson(Map<String, dynamic> json,) {
    return TopCreatorResponse(
        isSuccess: json["is_success"],
        message: json["error_message"],
        errorCode: json["error_code"] as int?,
        creators: json["data"] != null ? List.from(json['data']).map((e) => User.fromJson(e)).toList() : []);
  }

  ErrorFromServer errorFromServer() {
    return ErrorFromServer(
      status: isSuccess,
      errorCode: errorCode,
      message: message
    );
  }
}
