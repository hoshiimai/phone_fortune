import 'package:callmobile/core/model/business/creator_status.dart';
import 'package:callmobile/utils/app_assets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:callmobile/core/model/enum/enum_role.dart';

import '../../../../utils/app_api_config.dart';
import 'history_call.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  const factory User({
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'sns_id') String? snsId,
    @JsonKey(name: 'email') String? email,
    @JsonKey(name: 'authen_code') String? authenCode,
    @JsonKey(name: 'role', includeFromJson: true) @RoleConverter() required Role? role,
    @JsonKey(name: 'nickname') String? nickname,
    @JsonKey(name: 'fullname') String? fullName,
    @JsonKey(name: 'name_kata') String? nameKata,
    @JsonKey(name: 'birthdate') String? birthdate,
    @JsonKey(name: 'tel') String? tel,
    @JsonKey(name: 'is_online', defaultValue: false) required bool isOnline,
    @JsonKey(name: 'welcome_messages') String? welcomeMessages,
    @JsonKey(name: 'evaluate_score') required double? evaluateScore,
    @JsonKey(name: 'total_evaluated') required int? totalEvaluated,
    @JsonKey(name: 'gender') required int? gender,
    @JsonKey(name: 'point_balance') int? pointBalance,
    @JsonKey(name: 'avatar_img_id') int? avatarImgId,
    @JsonKey(name: 'cover_img_id') int? coverImgId,
    @JsonKey(name: 'average_rating') double? averageRating,
    @JsonKey(name: 'creator_room') List<dynamic>? creatorRoom,
    @JsonKey(name: 'rank') int? rank,
    @JsonKey(name: 'total_point', defaultValue: 0) int? totalPoint,
    @JsonKey(name: 'total_rating', defaultValue: 0) int? totalRating,
    @JsonKey(name: 'status', includeFromJson: true) @StatusConverter() Status? status,
    @JsonKey(name: 'waiting_count', defaultValue: 0) int? waitingCount,
    @JsonKey(name: 'time_waiting', defaultValue: 0) int? timeWaiting,
    @JsonKey(name: 'url') String? refUrl,
    @JsonKey(name: 'lang') String? lang,
    @JsonKey(name: 'avatar', includeFromJson: true, includeIfNull: false)
    @AvatarConverter()
    Avatar? avatar,
    @JsonKey(name: 'cover', includeFromJson: true, includeIfNull: false)
    @CoverConverter()
    Cover? cover,
    @JsonKey(name: 'notify_setting', includeFromJson: true, includeIfNull: false)
    @CoverConverter()
    NotifySetting? notifySetting,
    @Default(false) bool isManagedByThisAgent,
    @JsonKey(name: 'user_room', defaultValue: [], includeFromJson: true,) List<HistoryCall>? historyCall,
    @JsonKey(name: 'is_calling', includeFromJson: true, defaultValue: true) @IsCallingConverter() required bool isCalling,
    @JsonKey(name: 'total_time', defaultValue: 0) int? totalCallTime,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

@freezed
class LikedCreator with _$LikedCreator {
  const factory LikedCreator({
    @JsonKey(name: 'id') required int id,
  }) = _LikedCreator;

  factory LikedCreator.fromJson(Map<String, dynamic> json) => _$LikedCreatorFromJson(json);
}

@freezed
class Avatar with _$Avatar {
  const factory Avatar({
    @JsonKey(name: 'file_path') required String filePath,
  }) = _Avatar;

  factory Avatar.fromJson(Map<String, dynamic> json) => _$AvatarFromJson(json);
}

@freezed
class Cover with _$Cover {
  const factory Cover({
    @JsonKey(name: 'file_path') required String filePath,
  }) = _Cover;

  factory Cover.fromJson(Map<String, dynamic> json) => _$CoverFromJson(json);
}

@freezed
class NotifySetting with _$NotifySetting {
  const factory NotifySetting({
    @JsonKey(name: 'is_allowed_admin_notify') required bool isAllowedAdminNotify,
    @JsonKey(name: 'is_allowed_normal_notify') required bool isAllowedNormalNotify,
  }) = _NotifySetting;

  factory NotifySetting.fromJson(Map<String, dynamic> json) => _$NotifySettingFromJson(json);
}

class RoleConverter implements JsonConverter<Role, int?> {
  const RoleConverter();

  @override
  Role fromJson(int? json) => json != null ? Role.fromInt(json) : Role.fan;

  @override
  int toJson(Role object) => object.toInt();
}

class StatusConverter implements JsonConverter<Status, int?> {
  const StatusConverter();

  @override
  Status fromJson(int? json) => json != null ? Status.fromInt(json) : Status.offline;

  @override
  int toJson(Status object) => object.toInt();
}

class IsCallingConverter implements JsonConverter<bool, int?> {
  const IsCallingConverter();

  @override
  bool fromJson(int? json) => json != 1 ? false : true;

  @override
  int toJson(bool isCalling) => isCalling ? 1 : 0;
}

class AvatarConverter implements JsonConverter<Avatar, Map<String, dynamic>> {
  const AvatarConverter();

  @override
  Avatar fromJson(dynamic json) => Avatar.fromJson(json);

  @override
  Map<String, dynamic> toJson(Avatar object) => object.toJson();
}

class CoverConverter implements JsonConverter<Cover, Map<String, dynamic>> {
  const CoverConverter();

  @override
  Cover fromJson(dynamic json) => Cover.fromJson(json);

  @override
  Map<String, dynamic> toJson(Cover object) => object.toJson();
}

extension UserExt on User {
  String getAvatarPath() {
    return (avatar?.filePath.isEmpty ?? true)
        ? AppAssets.ic_avatar_default_svg
        : '${AppApiConfig.baseApiUrl}${avatar?.filePath}';
  }

  String? getCoverPath() {
    return (cover?.filePath.isNotEmpty ?? false)
        ? '${AppApiConfig.baseApiUrl}${cover?.filePath ?? ''}'
        : '';
  }

  bool isCalling() {
    return creatorRoom?.isNotEmpty ?? false;
  }
}
