import 'package:callmobile/utils/app_assets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:callmobile/core/model/enum/enum_role.dart';
import 'package:callmobile/core/model/response/model/point_form_user.dart';

import '../../../../utils/app_api_config.dart';
import 'agent_of_creator.dart';

part 'user.freezed.dart';
part 'user.g.dart';

Object? _creatorReader(Map json, String key) {
  return json['agent_of_creator'] ?? json['creator_of_agent'];
}

@freezed
class User with _$User {
  const factory User({
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'sns_id') String? snsId,
    @JsonKey(name: 'email') String? email,
    @JsonKey(name: 'authen_code') String? authenCode,
    @JsonKey(name: 'role', includeFromJson: true) @RoleConverter() required Role? role,
    @JsonKey(name: 'nickname') String? nickname,
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'name_kata') String? nameKata,
    @JsonKey(name: 'birthdate') String? birthdate,
    @JsonKey(name: 'tel') String? tel,
    @JsonKey(name: 'is_online', defaultValue: false) required bool isOnline,
    @JsonKey(name: 'stripe_token') String? stripeToken,
    @JsonKey(name: 'initial_call_timing') required int? initialCallTiming,
    @JsonKey(name: 'initial_call_fee') required int? initialCallFee,
    @JsonKey(name: 'after_call_timing') required int? afterCallTiming,
    @JsonKey(name: 'after_call_fee') required int? afterCallFee,
    @JsonKey(name: 'welcome_messages') String? welcomeMessages,
    @JsonKey(name: 'evaluate_score') required double? evaluateScore,
    @JsonKey(name: 'total_evaluated') required int? totalEvaluated,
    @JsonKey(name: 'gender') required int? gender,
    @JsonKey(name: 'point_balance') int? pointBalance,
    @JsonKey(name: 'withdraw_pending') int? withdrawPending,
    @JsonKey(name: 'x_account_url') String? xAccountUrl,
    @JsonKey(name: 'fb_account_url') String? fbAccountUrl,
    @JsonKey(name: 'instagram_account_url') String? instagramAccountUrl,
    @JsonKey(name: 'tiktok_account_url') String? tiktokAccountUrl,
    @JsonKey(name: 'agent_10_code') String? agent10Code,
    @JsonKey(name: 'agent_15_code') String? agent15Code,
    @JsonKey(name: 'agent_20_code') String? agent20Code,
    @JsonKey(name: 'avatar_img_id') int? avatarImgId,
    @JsonKey(name: 'cover_img_id') int? coverImgId,
    @JsonKey(name: 'is_email_verified') required bool? isEmailVerified,
    @JsonKey(name: 'status') int? status,
    @JsonKey(name: 'is_deleted') required bool? isDeleted,
    @JsonKey(name: 'like_count') int? likeCount,
    @JsonKey(name: 'average_rating') double? averageRating,
    @JsonKey(name: 'call_fee_per_timing') double? callFeePerTiming,
    @JsonKey(name: 'liked_creator') List<LikedCreator>? likedCreator,
    @JsonKey(name: 'creator_room') List<dynamic>? creatorRoom,
    @JsonKey(name: 'point_form_user', defaultValue: []) List<PointFormUser>? pointsFormUser,
    @JsonKey(name: 'rank') int? rank,
    @JsonKey(name: 'total_point', defaultValue: 0) int? totalPoint,
    @JsonKey(name: 'total_rating', defaultValue: 0) int? totalRating,
    @JsonKey(name: 'url') String? refUrl,
    @JsonKey(name: 'lang') String? lang,
    @JsonKey(readValue: _creatorReader) List<AgentOfCreator>? agentOfCreator,
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

class NotifySettingConverter implements JsonConverter<NotifySetting, Map<String, dynamic>> {
  const NotifySettingConverter();

  @override
  NotifySetting fromJson(dynamic json) => NotifySetting.fromJson(json);

  @override
  Map<String, dynamic> toJson(NotifySetting object) => object.toJson();
}

extension UserExt on User {
  String getAvatarPath() {
    return (avatar?.filePath.isEmpty ?? true)
        ? 'images/bg/bg_fan_avatar.png'
        : avatar!.filePath;
  }

  String? getCoverPath() {
    return (cover?.filePath.isEmpty ?? true)
        ? AppAssets.bg_cover_png
        : cover?.filePath;
  }

  bool isCalling() {
    return creatorRoom?.isNotEmpty ?? false;
  }

  bool isLikedCreator() {
    return likedCreator?.isNotEmpty ?? false;
  }
}
