// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'change_like_response_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChangeLikeResponseData _$ChangeLikeResponseDataFromJson(
        Map<String, dynamic> json) =>
    ChangeLikeResponseData(
      (json['like_count'] as num).toInt(),
    );

Map<String, dynamic> _$ChangeLikeResponseDataToJson(
        ChangeLikeResponseData instance) =>
    <String, dynamic>{
      'like_count': instance.likeCount,
    };
