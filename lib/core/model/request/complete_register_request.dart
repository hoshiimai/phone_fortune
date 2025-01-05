import 'package:freezed_annotation/freezed_annotation.dart';

part 'complete_register_request.g.dart';

@JsonSerializable()
class CompleteRegisterRequest {
  final String email;
  final String code;

  CompleteRegisterRequest({
    required this.email,
    required this.code,
  });

  factory CompleteRegisterRequest.fromJson(Map<String, dynamic> json) => _$CompleteRegisterRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CompleteRegisterRequestToJson(this);
}
