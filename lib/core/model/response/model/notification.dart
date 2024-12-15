import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification.freezed.dart';
part 'notification.g.dart';

@freezed
class Notification with _$Notification {
  const factory Notification({
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'title') required String title,
    @JsonKey(name: 'body') required String body,
    @JsonKey(name: 'type') required int type,
    @JsonKey(name: 'read_by') required List<int> readBy,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'created_user') int? createdUser,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
    @JsonKey(name: 'updated_user') int? updatedUser,
    @JsonKey(name: 'has_a_unread_notifi') required bool? isNotifyUnread,
  }) = _Notification;

  factory Notification.fromJson(Map<String, dynamic> json) => _$NotificationFromJson(json);
}
