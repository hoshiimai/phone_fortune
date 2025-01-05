// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterRequest _$RegisterRequestFromJson(Map<String, dynamic> json) =>
    RegisterRequest(
      fullName: json['fullname'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
      birthDate: json['birth'] as String,
      gender: (json['gender'] as num).toInt(),
    );

Map<String, dynamic> _$RegisterRequestToJson(RegisterRequest instance) =>
    <String, dynamic>{
      'fullname': instance.fullName,
      'email': instance.email,
      'password': instance.password,
      'birth': instance.birthDate,
      'gender': instance.gender,
    };
