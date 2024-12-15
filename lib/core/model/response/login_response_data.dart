import 'package:json_annotation/json_annotation.dart';
import 'package:callmobile/core/model/response/model/user.dart';

part 'login_response_data.g.dart';

@JsonSerializable()
class LoginResponseData {
  @JsonKey(name: 'accessToken')
  final String? accessToken;
  @JsonKey(name: 'refreshToken')
  final String? refreshToken;
  @JsonKey(name: 'token_type')
  final String? tokenType;
  @JsonKey(name: 'expires_in')
  final int? expiresIn;
  @JsonKey(name: 'user')
  final User? user;
  //Use for SNS login
  @JsonKey(name: 'is_logged_in')
  final bool? isLoggedIn;

  LoginResponseData(
    this.accessToken,
    this.refreshToken,
    this.tokenType,
    this.expiresIn,
    this.user,
    this.isLoggedIn,
  );

  factory LoginResponseData.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseDataFromJson(json);
  Map<String, dynamic> toJson() => _$LoginResponseDataToJson(this);
}
