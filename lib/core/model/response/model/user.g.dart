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
      fullName: json['fullname'] as String?,
      nameKata: json['name_kata'] as String?,
      birthdate: json['birthdate'] as String?,
      tel: json['tel'] as String?,
      isOnline: json['is_online'] as bool? ?? false,
      welcomeMessages: json['welcome_messages'] as String?,
      evaluateScore: (json['evaluate_score'] as num?)?.toDouble(),
      totalEvaluated: (json['total_evaluated'] as num?)?.toInt(),
      gender: (json['gender'] as num?)?.toInt(),
      pointBalance: (json['point_balance'] as num?)?.toInt(),
      avatarImgId: (json['avatar_img_id'] as num?)?.toInt(),
      coverImgId: (json['cover_img_id'] as num?)?.toInt(),
      averageRating: (json['average_rating'] as num?)?.toDouble(),
      creatorRoom: json['creator_room'] as List<dynamic>?,
      rank: (json['rank'] as num?)?.toInt(),
      totalPoint: (json['total_point'] as num?)?.toInt() ?? 0,
      totalRating: (json['total_rating'] as num?)?.toInt() ?? 0,
      status:
          const StatusConverter().fromJson((json['status'] as num?)?.toInt()),
      waitingCount: (json['waiting_count'] as num?)?.toInt() ?? 0,
      timeWaiting: (json['time_waiting'] as num?)?.toInt() ?? 0,
      refUrl: json['url'] as String?,
      lang: json['lang'] as String?,
      avatar: _$JsonConverterFromJson<Map<String, dynamic>, Avatar>(
          json['avatar'], const AvatarConverter().fromJson),
      cover: _$JsonConverterFromJson<Map<String, dynamic>, Cover>(
          json['cover'], const CoverConverter().fromJson),
      notifySetting: json['notify_setting'] == null
          ? null
          : NotifySetting.fromJson(
              json['notify_setting'] as Map<String, dynamic>),
      isManagedByThisAgent: json['isManagedByThisAgent'] as bool? ?? false,
      historyCall: (json['user_room'] as List<dynamic>?)
              ?.map((e) => HistoryCall.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      isCalling: json['is_calling'] == null
          ? true
          : const IsCallingConverter()
              .fromJson((json['is_calling'] as num?)?.toInt()),
      totalCallTime: (json['total_time'] as num?)?.toInt() ?? 0,
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
    'fullname': instance.fullName,
    'name_kata': instance.nameKata,
    'birthdate': instance.birthdate,
    'tel': instance.tel,
    'is_online': instance.isOnline,
    'welcome_messages': instance.welcomeMessages,
    'evaluate_score': instance.evaluateScore,
    'total_evaluated': instance.totalEvaluated,
    'gender': instance.gender,
    'point_balance': instance.pointBalance,
    'avatar_img_id': instance.avatarImgId,
    'cover_img_id': instance.coverImgId,
    'average_rating': instance.averageRating,
    'creator_room': instance.creatorRoom,
    'rank': instance.rank,
    'total_point': instance.totalPoint,
    'total_rating': instance.totalRating,
    'status': _$JsonConverterToJson<int?, Status>(
        instance.status, const StatusConverter().toJson),
    'waiting_count': instance.waitingCount,
    'time_waiting': instance.timeWaiting,
    'url': instance.refUrl,
    'lang': instance.lang,
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
  val['user_room'] = instance.historyCall;
  val['is_calling'] = const IsCallingConverter().toJson(instance.isCalling);
  val['total_time'] = instance.totalCallTime;
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
