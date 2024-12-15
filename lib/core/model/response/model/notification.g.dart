// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NotificationImpl _$$NotificationImplFromJson(Map<String, dynamic> json) =>
    _$NotificationImpl(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      body: json['body'] as String,
      type: (json['type'] as num).toInt(),
      readBy: (json['read_by'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
      createdAt: DateTime.parse(json['created_at'] as String),
      createdUser: (json['created_user'] as num?)?.toInt(),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      updatedUser: (json['updated_user'] as num?)?.toInt(),
      isNotifyUnread: json['has_a_unread_notifi'] as bool?,
    );

Map<String, dynamic> _$$NotificationImplToJson(_$NotificationImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'body': instance.body,
      'type': instance.type,
      'read_by': instance.readBy,
      'created_at': instance.createdAt.toIso8601String(),
      'created_user': instance.createdUser,
      'updated_at': instance.updatedAt.toIso8601String(),
      'updated_user': instance.updatedUser,
      'has_a_unread_notifi': instance.isNotifyUnread,
    };
