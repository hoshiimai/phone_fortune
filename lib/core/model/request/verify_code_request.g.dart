// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_code_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VerifyCodeRequest _$VerifyCodeRequestFromJson(Map<String, dynamic> json) =>
    VerifyCodeRequest(
      code: json['code'] as String,
      email: json['email'] as String,
    );

Map<String, dynamic> _$VerifyCodeRequestToJson(VerifyCodeRequest instance) =>
    <String, dynamic>{
      'code': instance.code,
      'email': instance.email,
    };
