// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      id: (json['id'] as num).toInt(),
      snsId: json['sns_id'] as String?,
      email: json['email'] as String?,
      authenCode: json['authen_code'] as String?,
      role: const RoleConverter().fromJson((json['role'] as num?)?.toInt()),
      nickname: json['nickname'] as String?,
      name: json['name'] as String?,
      nameKata: json['name_kata'] as String?,
      birthdate: json['birthdate'] as String?,
      tel: json['tel'] as String?,
      isOnline: json['is_online'] as bool? ?? false,
      stripeToken: json['stripe_token'] as String?,
      initialCallTiming: (json['initial_call_timing'] as num?)?.toInt(),
      initialCallFee: (json['initial_call_fee'] as num?)?.toInt(),
      afterCallTiming: (json['after_call_timing'] as num?)?.toInt(),
      afterCallFee: (json['after_call_fee'] as num?)?.toInt(),
      welcomeMessages: json['welcome_messages'] as String?,
      evaluateScore: (json['evaluate_score'] as num?)?.toDouble(),
      totalEvaluated: (json['total_evaluated'] as num?)?.toInt(),
      gender: (json['gender'] as num?)?.toInt(),
      pointBalance: (json['point_balance'] as num?)?.toInt(),
      withdrawPending: (json['withdraw_pending'] as num?)?.toInt(),
      xAccountUrl: json['x_account_url'] as String?,
      fbAccountUrl: json['fb_account_url'] as String?,
      instagramAccountUrl: json['instagram_account_url'] as String?,
      tiktokAccountUrl: json['tiktok_account_url'] as String?,
      agent10Code: json['agent_10_code'] as String?,
      agent15Code: json['agent_15_code'] as String?,
      agent20Code: json['agent_20_code'] as String?,
      avatarImgId: (json['avatar_img_id'] as num?)?.toInt(),
      coverImgId: (json['cover_img_id'] as num?)?.toInt(),
      isEmailVerified: json['is_email_verified'] as bool?,
      status: (json['status'] as num?)?.toInt(),
      isDeleted: json['is_deleted'] as bool?,
      likeCount: (json['like_count'] as num?)?.toInt(),
      averageRating: (json['average_rating'] as num?)?.toDouble(),
      callFeePerTiming: (json['call_fee_per_timing'] as num?)?.toDouble(),
      likedCreator: (json['liked_creator'] as List<dynamic>?)
          ?.map((e) => LikedCreator.fromJson(e as Map<String, dynamic>))
          .toList(),
      creatorRoom: json['creator_room'] as List<dynamic>?,
      pointsFormUser: (json['point_form_user'] as List<dynamic>?)
              ?.map((e) => PointFormUser.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      rank: (json['rank'] as num?)?.toInt(),
      totalPoint: (json['total_point'] as num?)?.toInt() ?? 0,
      totalRating: (json['total_rating'] as num?)?.toInt() ?? 0,
      refUrl: json['url'] as String?,
      lang: json['lang'] as String?,
      agentOfCreator: (_creatorReader(json, 'agentOfCreator') as List<dynamic>?)
          ?.map((e) => AgentOfCreator.fromJson(e as Map<String, dynamic>))
          .toList(),
      avatar: _$JsonConverterFromJson<Map<String, dynamic>, Avatar>(
          json['avatar'], const AvatarConverter().fromJson),
      cover: _$JsonConverterFromJson<Map<String, dynamic>, Cover>(
          json['cover'], const CoverConverter().fromJson),
      notifySetting: json['notify_setting'] == null
          ? null
          : NotifySetting.fromJson(
              json['notify_setting'] as Map<String, dynamic>),
      isManagedByThisAgent: json['isManagedByThisAgent'] as bool? ?? false,
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'sns_id': instance.snsId,
    'email': instance.email,
    'authen_code': instance.authenCode,
    'role': _$JsonConverterToJson<int?, Role>(
        instance.role, const RoleConverter().toJson),
    'nickname': instance.nickname,
    'name': instance.name,
    'name_kata': instance.nameKata,
    'birthdate': instance.birthdate,
    'tel': instance.tel,
    'is_online': instance.isOnline,
    'stripe_token': instance.stripeToken,
    'initial_call_timing': instance.initialCallTiming,
    'initial_call_fee': instance.initialCallFee,
    'after_call_timing': instance.afterCallTiming,
    'after_call_fee': instance.afterCallFee,
    'welcome_messages': instance.welcomeMessages,
    'evaluate_score': instance.evaluateScore,
    'total_evaluated': instance.totalEvaluated,
    'gender': instance.gender,
    'point_balance': instance.pointBalance,
    'withdraw_pending': instance.withdrawPending,
    'x_account_url': instance.xAccountUrl,
    'fb_account_url': instance.fbAccountUrl,
    'instagram_account_url': instance.instagramAccountUrl,
    'tiktok_account_url': instance.tiktokAccountUrl,
    'agent_10_code': instance.agent10Code,
    'agent_15_code': instance.agent15Code,
    'agent_20_code': instance.agent20Code,
    'avatar_img_id': instance.avatarImgId,
    'cover_img_id': instance.coverImgId,
    'is_email_verified': instance.isEmailVerified,
    'status': instance.status,
    'is_deleted': instance.isDeleted,
    'like_count': instance.likeCount,
    'average_rating': instance.averageRating,
    'call_fee_per_timing': instance.callFeePerTiming,
    'liked_creator': instance.likedCreator,
    'creator_room': instance.creatorRoom,
    'point_form_user': instance.pointsFormUser,
    'rank': instance.rank,
    'total_point': instance.totalPoint,
    'total_rating': instance.totalRating,
    'url': instance.refUrl,
    'lang': instance.lang,
    'agentOfCreator': instance.agentOfCreator,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'avatar',
      _$JsonConverterToJson<Map<String, dynamic>, Avatar>(
          instance.avatar, const AvatarConverter().toJson));
  writeNotNull(
      'cover',
      _$JsonConverterToJson<Map<String, dynamic>, Cover>(
          instance.cover, const CoverConverter().toJson));
  writeNotNull('notify_setting', instance.notifySetting);
  val['isManagedByThisAgent'] = instance.isManagedByThisAgent;
  return val;
}

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);

_$LikedCreatorImpl _$$LikedCreatorImplFromJson(Map<String, dynamic> json) =>
    _$LikedCreatorImpl(
      id: (json['id'] as num).toInt(),
    );

Map<String, dynamic> _$$LikedCreatorImplToJson(_$LikedCreatorImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
    };

_$AvatarImpl _$$AvatarImplFromJson(Map<String, dynamic> json) => _$AvatarImpl(
      filePath: json['file_path'] as String,
    );

Map<String, dynamic> _$$AvatarImplToJson(_$AvatarImpl instance) =>
    <String, dynamic>{
      'file_path': instance.filePath,
    };

_$CoverImpl _$$CoverImplFromJson(Map<String, dynamic> json) => _$CoverImpl(
      filePath: json['file_path'] as String,
    );

Map<String, dynamic> _$$CoverImplToJson(_$CoverImpl instance) =>
    <String, dynamic>{
      'file_path': instance.filePath,
    };

_$NotifySettingImpl _$$NotifySettingImplFromJson(Map<String, dynamic> json) =>
    _$NotifySettingImpl(
      isAllowedAdminNotify: json['is_allowed_admin_notify'] as bool,
      isAllowedNormalNotify: json['is_allowed_normal_notify'] as bool,
    );

Map<String, dynamic> _$$NotifySettingImplToJson(_$NotifySettingImpl instance) =>
    <String, dynamic>{
      'is_allowed_admin_notify': instance.isAllowedAdminNotify,
      'is_allowed_normal_notify': instance.isAllowedNormalNotify,
    };
