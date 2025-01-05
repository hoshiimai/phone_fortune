// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'complete_register_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CompleteRegisterRequest _$CompleteRegisterRequestFromJson(
        Map<String, dynamic> json) =>
    CompleteRegisterRequest(
      email: json['email'] as String,
      code: json['code'] as String,
    );

Map<String, dynamic> _$CompleteRegisterRequestToJson(
        CompleteRegisterRequest instance) =>
    <String, dynamic>{
      'email': instance.email,
      'code': instance.code,
    };
