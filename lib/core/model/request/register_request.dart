import 'package:json_annotation/json_annotation.dart';

part 'register_request.g.dart';

@JsonSerializable()
class RegisterRequest {
  @JsonKey(name: 'nickname')
  final String name;
  @JsonKey(name: 'email')
  final String email;
  @JsonKey(name: 'password')
  final String  password;

  RegisterRequest({required this.name, required this.email, required this.password});

  factory RegisterRequest.fromJson(Map<String, dynamic> json) => _$RegisterRequestFromJson(json);
  Map<String, dynamic> toJson() => _$RegisterRequestToJson(this);
}