import 'package:json_annotation/json_annotation.dart';

part 'login_request.g.dart';

@JsonSerializable()
class LoginRequest {
  @JsonKey(name: 'email')
  final String email;
  @JsonKey(name: 'password')
  final String  password;
  @JsonKey(name: 'fcmToken')
  final String  fcmToken;

  LoginRequest({required this.email, required this.password, required this.fcmToken});

  factory LoginRequest.fromJson(Map<String, dynamic> json) => _$LoginRequestFromJson(json);
  Map<String, dynamic> toJson() => _$LoginRequestToJson(this);
}