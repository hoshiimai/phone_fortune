import 'package:json_annotation/json_annotation.dart';

part 'register_request.g.dart';

@JsonSerializable()
class RegisterRequest {
  @JsonKey(name: 'fullname')
  final String fullName;
  final String email;
  final String  password;
  @JsonKey(name: 'birth')
  final String  birthDate;
  final int  gender;

  RegisterRequest({required this.fullName, required this.email, required this.password, required this.birthDate, required this.gender});

  factory RegisterRequest.fromJson(Map<String, dynamic> json) => _$RegisterRequestFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterRequestToJson(this);
}