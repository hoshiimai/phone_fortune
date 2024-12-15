// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'change_favorite_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChangeFavoriteRequest _$ChangeFavoriteRequestFromJson(
        Map<String, dynamic> json) =>
    ChangeFavoriteRequest(
      likeUserId: (json['likeUserId'] as num).toInt(),
      status: json['status'] as bool,
    );

Map<String, dynamic> _$ChangeFavoriteRequestToJson(
        ChangeFavoriteRequest instance) =>
    <String, dynamic>{
      'likeUserId': instance.likeUserId,
      'status': instance.status,
    };
