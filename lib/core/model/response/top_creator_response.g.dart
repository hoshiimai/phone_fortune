// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'top_creator_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TopCreatorResponse _$TopCreatorResponseFromJson(Map<String, dynamic> json) =>
    TopCreatorResponse(
      isSuccess: json['isSuccess'] as bool,
      errorCode: (json['errorCode'] as num?)?.toInt(),
      message: json['message'] as String?,
      creators: (json['creators'] as List<dynamic>)
          .map((e) => User.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TopCreatorResponseToJson(TopCreatorResponse instance) =>
    <String, dynamic>{
      'isSuccess': instance.isSuccess,
      'errorCode': instance.errorCode,
      'message': instance.message,
      'creators': instance.creators,
    };
