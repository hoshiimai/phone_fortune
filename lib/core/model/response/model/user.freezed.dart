// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

User _$UserFromJson(Map<String, dynamic> json) {
  return _User.fromJson(json);
}

/// @nodoc
mixin _$User {
  @JsonKey(name: 'id')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'sns_id')
  String? get snsId => throw _privateConstructorUsedError;
  @JsonKey(name: 'email')
  String? get email => throw _privateConstructorUsedError;
  @JsonKey(name: 'authen_code')
  String? get authenCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'role', includeFromJson: true)
  @RoleConverter()
  Role? get role => throw _privateConstructorUsedError;
  @JsonKey(name: 'nickname')
  String? get nickname => throw _privateConstructorUsedError;
  @JsonKey(name: 'name')
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'name_kata')
  String? get nameKata => throw _privateConstructorUsedError;
  @JsonKey(name: 'birthdate')
  String? get birthdate => throw _privateConstructorUsedError;
  @JsonKey(name: 'tel')
  String? get tel => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_online', defaultValue: false)
  bool get isOnline => throw _privateConstructorUsedError;
  @JsonKey(name: 'stripe_token')
  String? get stripeToken => throw _privateConstructorUsedError;
  @JsonKey(name: 'initial_call_timing')
  int? get initialCallTiming => throw _privateConstructorUsedError;
  @JsonKey(name: 'initial_call_fee')
  int? get initialCallFee => throw _privateConstructorUsedError;
  @JsonKey(name: 'after_call_timing')
  int? get afterCallTiming => throw _privateConstructorUsedError;
  @JsonKey(name: 'after_call_fee')
  int? get afterCallFee => throw _privateConstructorUsedError;
  @JsonKey(name: 'welcome_messages')
  String? get welcomeMessages => throw _privateConstructorUsedError;
  @JsonKey(name: 'evaluate_score')
  double? get evaluateScore => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_evaluated')
  int? get totalEvaluated => throw _privateConstructorUsedError;
  @JsonKey(name: 'gender')
  int? get gender => throw _privateConstructorUsedError;
  @JsonKey(name: 'point_balance')
  int? get pointBalance => throw _privateConstructorUsedError;
  @JsonKey(name: 'withdraw_pending')
  int? get withdrawPending => throw _privateConstructorUsedError;
  @JsonKey(name: 'x_account_url')
  String? get xAccountUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'fb_account_url')
  String? get fbAccountUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'instagram_account_url')
  String? get instagramAccountUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'tiktok_account_url')
  String? get tiktokAccountUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'agent_10_code')
  String? get agent10Code => throw _privateConstructorUsedError;
  @JsonKey(name: 'agent_15_code')
  String? get agent15Code => throw _privateConstructorUsedError;
  @JsonKey(name: 'agent_20_code')
  String? get agent20Code => throw _privateConstructorUsedError;
  @JsonKey(name: 'avatar_img_id')
  int? get avatarImgId => throw _privateConstructorUsedError;
  @JsonKey(name: 'cover_img_id')
  int? get coverImgId => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_email_verified')
  bool? get isEmailVerified => throw _privateConstructorUsedError;
  @JsonKey(name: 'status')
  int? get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_deleted')
  bool? get isDeleted => throw _privateConstructorUsedError;
  @JsonKey(name: 'like_count')
  int? get likeCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'average_rating')
  double? get averageRating => throw _privateConstructorUsedError;
  @JsonKey(name: 'call_fee_per_timing')
  double? get callFeePerTiming => throw _privateConstructorUsedError;
  @JsonKey(name: 'liked_creator')
  List<LikedCreator>? get likedCreator => throw _privateConstructorUsedError;
  @JsonKey(name: 'creator_room')
  List<dynamic>? get creatorRoom => throw _privateConstructorUsedError;
  @JsonKey(name: 'point_form_user', defaultValue: [])
  List<PointFormUser>? get pointsFormUser => throw _privateConstructorUsedError;
  @JsonKey(name: 'rank')
  int? get rank => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_point', defaultValue: 0)
  int? get totalPoint => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_rating', defaultValue: 0)
  int? get totalRating => throw _privateConstructorUsedError;
  @JsonKey(name: 'url')
  String? get refUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'lang')
  String? get lang => throw _privateConstructorUsedError;
  @JsonKey(readValue: _creatorReader)
  List<AgentOfCreator>? get agentOfCreator =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'avatar', includeFromJson: true, includeIfNull: false)
  @AvatarConverter()
  Avatar? get avatar => throw _privateConstructorUsedError;
  @JsonKey(name: 'cover', includeFromJson: true, includeIfNull: false)
  @CoverConverter()
  Cover? get cover => throw _privateConstructorUsedError;
  @JsonKey(name: 'notify_setting', includeFromJson: true, includeIfNull: false)
  @CoverConverter()
  NotifySetting? get notifySetting => throw _privateConstructorUsedError;
  bool get isManagedByThisAgent => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserCopyWith<User> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res, User>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'sns_id') String? snsId,
      @JsonKey(name: 'email') String? email,
      @JsonKey(name: 'authen_code') String? authenCode,
      @JsonKey(name: 'role', includeFromJson: true) @RoleConverter() Role? role,
      @JsonKey(name: 'nickname') String? nickname,
      @JsonKey(name: 'name') String? name,
      @JsonKey(name: 'name_kata') String? nameKata,
      @JsonKey(name: 'birthdate') String? birthdate,
      @JsonKey(name: 'tel') String? tel,
      @JsonKey(name: 'is_online', defaultValue: false) bool isOnline,
      @JsonKey(name: 'stripe_token') String? stripeToken,
      @JsonKey(name: 'initial_call_timing') int? initialCallTiming,
      @JsonKey(name: 'initial_call_fee') int? initialCallFee,
      @JsonKey(name: 'after_call_timing') int? afterCallTiming,
      @JsonKey(name: 'after_call_fee') int? afterCallFee,
      @JsonKey(name: 'welcome_messages') String? welcomeMessages,
      @JsonKey(name: 'evaluate_score') double? evaluateScore,
      @JsonKey(name: 'total_evaluated') int? totalEvaluated,
      @JsonKey(name: 'gender') int? gender,
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
      @JsonKey(name: 'is_email_verified') bool? isEmailVerified,
      @JsonKey(name: 'status') int? status,
      @JsonKey(name: 'is_deleted') bool? isDeleted,
      @JsonKey(name: 'like_count') int? likeCount,
      @JsonKey(name: 'average_rating') double? averageRating,
      @JsonKey(name: 'call_fee_per_timing') double? callFeePerTiming,
      @JsonKey(name: 'liked_creator') List<LikedCreator>? likedCreator,
      @JsonKey(name: 'creator_room') List<dynamic>? creatorRoom,
      @JsonKey(name: 'point_form_user', defaultValue: [])
      List<PointFormUser>? pointsFormUser,
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
      @JsonKey(
          name: 'notify_setting', includeFromJson: true, includeIfNull: false)
      @CoverConverter()
      NotifySetting? notifySetting,
      bool isManagedByThisAgent});

  $AvatarCopyWith<$Res>? get avatar;
  $CoverCopyWith<$Res>? get cover;
  $NotifySettingCopyWith<$Res>? get notifySetting;
}

/// @nodoc
class _$UserCopyWithImpl<$Res, $Val extends User>
    implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? snsId = freezed,
    Object? email = freezed,
    Object? authenCode = freezed,
    Object? role = freezed,
    Object? nickname = freezed,
    Object? name = freezed,
    Object? nameKata = freezed,
    Object? birthdate = freezed,
    Object? tel = freezed,
    Object? isOnline = null,
    Object? stripeToken = freezed,
    Object? initialCallTiming = freezed,
    Object? initialCallFee = freezed,
    Object? afterCallTiming = freezed,
    Object? afterCallFee = freezed,
    Object? welcomeMessages = freezed,
    Object? evaluateScore = freezed,
    Object? totalEvaluated = freezed,
    Object? gender = freezed,
    Object? pointBalance = freezed,
    Object? withdrawPending = freezed,
    Object? xAccountUrl = freezed,
    Object? fbAccountUrl = freezed,
    Object? instagramAccountUrl = freezed,
    Object? tiktokAccountUrl = freezed,
    Object? agent10Code = freezed,
    Object? agent15Code = freezed,
    Object? agent20Code = freezed,
    Object? avatarImgId = freezed,
    Object? coverImgId = freezed,
    Object? isEmailVerified = freezed,
    Object? status = freezed,
    Object? isDeleted = freezed,
    Object? likeCount = freezed,
    Object? averageRating = freezed,
    Object? callFeePerTiming = freezed,
    Object? likedCreator = freezed,
    Object? creatorRoom = freezed,
    Object? pointsFormUser = freezed,
    Object? rank = freezed,
    Object? totalPoint = freezed,
    Object? totalRating = freezed,
    Object? refUrl = freezed,
    Object? lang = freezed,
    Object? agentOfCreator = freezed,
    Object? avatar = freezed,
    Object? cover = freezed,
    Object? notifySetting = freezed,
    Object? isManagedByThisAgent = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      snsId: freezed == snsId
          ? _value.snsId
          : snsId // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      authenCode: freezed == authenCode
          ? _value.authenCode
          : authenCode // ignore: cast_nullable_to_non_nullable
              as String?,
      role: freezed == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as Role?,
      nickname: freezed == nickname
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      nameKata: freezed == nameKata
          ? _value.nameKata
          : nameKata // ignore: cast_nullable_to_non_nullable
              as String?,
      birthdate: freezed == birthdate
          ? _value.birthdate
          : birthdate // ignore: cast_nullable_to_non_nullable
              as String?,
      tel: freezed == tel
          ? _value.tel
          : tel // ignore: cast_nullable_to_non_nullable
              as String?,
      isOnline: null == isOnline
          ? _value.isOnline
          : isOnline // ignore: cast_nullable_to_non_nullable
              as bool,
      stripeToken: freezed == stripeToken
          ? _value.stripeToken
          : stripeToken // ignore: cast_nullable_to_non_nullable
              as String?,
      initialCallTiming: freezed == initialCallTiming
          ? _value.initialCallTiming
          : initialCallTiming // ignore: cast_nullable_to_non_nullable
              as int?,
      initialCallFee: freezed == initialCallFee
          ? _value.initialCallFee
          : initialCallFee // ignore: cast_nullable_to_non_nullable
              as int?,
      afterCallTiming: freezed == afterCallTiming
          ? _value.afterCallTiming
          : afterCallTiming // ignore: cast_nullable_to_non_nullable
              as int?,
      afterCallFee: freezed == afterCallFee
          ? _value.afterCallFee
          : afterCallFee // ignore: cast_nullable_to_non_nullable
              as int?,
      welcomeMessages: freezed == welcomeMessages
          ? _value.welcomeMessages
          : welcomeMessages // ignore: cast_nullable_to_non_nullable
              as String?,
      evaluateScore: freezed == evaluateScore
          ? _value.evaluateScore
          : evaluateScore // ignore: cast_nullable_to_non_nullable
              as double?,
      totalEvaluated: freezed == totalEvaluated
          ? _value.totalEvaluated
          : totalEvaluated // ignore: cast_nullable_to_non_nullable
              as int?,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as int?,
      pointBalance: freezed == pointBalance
          ? _value.pointBalance
          : pointBalance // ignore: cast_nullable_to_non_nullable
              as int?,
      withdrawPending: freezed == withdrawPending
          ? _value.withdrawPending
          : withdrawPending // ignore: cast_nullable_to_non_nullable
              as int?,
      xAccountUrl: freezed == xAccountUrl
          ? _value.xAccountUrl
          : xAccountUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      fbAccountUrl: freezed == fbAccountUrl
          ? _value.fbAccountUrl
          : fbAccountUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      instagramAccountUrl: freezed == instagramAccountUrl
          ? _value.instagramAccountUrl
          : instagramAccountUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      tiktokAccountUrl: freezed == tiktokAccountUrl
          ? _value.tiktokAccountUrl
          : tiktokAccountUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      agent10Code: freezed == agent10Code
          ? _value.agent10Code
          : agent10Code // ignore: cast_nullable_to_non_nullable
              as String?,
      agent15Code: freezed == agent15Code
          ? _value.agent15Code
          : agent15Code // ignore: cast_nullable_to_non_nullable
              as String?,
      agent20Code: freezed == agent20Code
          ? _value.agent20Code
          : agent20Code // ignore: cast_nullable_to_non_nullable
              as String?,
      avatarImgId: freezed == avatarImgId
          ? _value.avatarImgId
          : avatarImgId // ignore: cast_nullable_to_non_nullable
              as int?,
      coverImgId: freezed == coverImgId
          ? _value.coverImgId
          : coverImgId // ignore: cast_nullable_to_non_nullable
              as int?,
      isEmailVerified: freezed == isEmailVerified
          ? _value.isEmailVerified
          : isEmailVerified // ignore: cast_nullable_to_non_nullable
              as bool?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
      isDeleted: freezed == isDeleted
          ? _value.isDeleted
          : isDeleted // ignore: cast_nullable_to_non_nullable
              as bool?,
      likeCount: freezed == likeCount
          ? _value.likeCount
          : likeCount // ignore: cast_nullable_to_non_nullable
              as int?,
      averageRating: freezed == averageRating
          ? _value.averageRating
          : averageRating // ignore: cast_nullable_to_non_nullable
              as double?,
      callFeePerTiming: freezed == callFeePerTiming
          ? _value.callFeePerTiming
          : callFeePerTiming // ignore: cast_nullable_to_non_nullable
              as double?,
      likedCreator: freezed == likedCreator
          ? _value.likedCreator
          : likedCreator // ignore: cast_nullable_to_non_nullable
              as List<LikedCreator>?,
      creatorRoom: freezed == creatorRoom
          ? _value.creatorRoom
          : creatorRoom // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      pointsFormUser: freezed == pointsFormUser
          ? _value.pointsFormUser
          : pointsFormUser // ignore: cast_nullable_to_non_nullable
              as List<PointFormUser>?,
      rank: freezed == rank
          ? _value.rank
          : rank // ignore: cast_nullable_to_non_nullable
              as int?,
      totalPoint: freezed == totalPoint
          ? _value.totalPoint
          : totalPoint // ignore: cast_nullable_to_non_nullable
              as int?,
      totalRating: freezed == totalRating
          ? _value.totalRating
          : totalRating // ignore: cast_nullable_to_non_nullable
              as int?,
      refUrl: freezed == refUrl
          ? _value.refUrl
          : refUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      lang: freezed == lang
          ? _value.lang
          : lang // ignore: cast_nullable_to_non_nullable
              as String?,
      agentOfCreator: freezed == agentOfCreator
          ? _value.agentOfCreator
          : agentOfCreator // ignore: cast_nullable_to_non_nullable
              as List<AgentOfCreator>?,
      avatar: freezed == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as Avatar?,
      cover: freezed == cover
          ? _value.cover
          : cover // ignore: cast_nullable_to_non_nullable
              as Cover?,
      notifySetting: freezed == notifySetting
          ? _value.notifySetting
          : notifySetting // ignore: cast_nullable_to_non_nullable
              as NotifySetting?,
      isManagedByThisAgent: null == isManagedByThisAgent
          ? _value.isManagedByThisAgent
          : isManagedByThisAgent // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AvatarCopyWith<$Res>? get avatar {
    if (_value.avatar == null) {
      return null;
    }

    return $AvatarCopyWith<$Res>(_value.avatar!, (value) {
      return _then(_value.copyWith(avatar: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $CoverCopyWith<$Res>? get cover {
    if (_value.cover == null) {
      return null;
    }

    return $CoverCopyWith<$Res>(_value.cover!, (value) {
      return _then(_value.copyWith(cover: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $NotifySettingCopyWith<$Res>? get notifySetting {
    if (_value.notifySetting == null) {
      return null;
    }

    return $NotifySettingCopyWith<$Res>(_value.notifySetting!, (value) {
      return _then(_value.copyWith(notifySetting: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UserImplCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$$UserImplCopyWith(
          _$UserImpl value, $Res Function(_$UserImpl) then) =
      __$$UserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'sns_id') String? snsId,
      @JsonKey(name: 'email') String? email,
      @JsonKey(name: 'authen_code') String? authenCode,
      @JsonKey(name: 'role', includeFromJson: true) @RoleConverter() Role? role,
      @JsonKey(name: 'nickname') String? nickname,
      @JsonKey(name: 'name') String? name,
      @JsonKey(name: 'name_kata') String? nameKata,
      @JsonKey(name: 'birthdate') String? birthdate,
      @JsonKey(name: 'tel') String? tel,
      @JsonKey(name: 'is_online', defaultValue: false) bool isOnline,
      @JsonKey(name: 'stripe_token') String? stripeToken,
      @JsonKey(name: 'initial_call_timing') int? initialCallTiming,
      @JsonKey(name: 'initial_call_fee') int? initialCallFee,
      @JsonKey(name: 'after_call_timing') int? afterCallTiming,
      @JsonKey(name: 'after_call_fee') int? afterCallFee,
      @JsonKey(name: 'welcome_messages') String? welcomeMessages,
      @JsonKey(name: 'evaluate_score') double? evaluateScore,
      @JsonKey(name: 'total_evaluated') int? totalEvaluated,
      @JsonKey(name: 'gender') int? gender,
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
      @JsonKey(name: 'is_email_verified') bool? isEmailVerified,
      @JsonKey(name: 'status') int? status,
      @JsonKey(name: 'is_deleted') bool? isDeleted,
      @JsonKey(name: 'like_count') int? likeCount,
      @JsonKey(name: 'average_rating') double? averageRating,
      @JsonKey(name: 'call_fee_per_timing') double? callFeePerTiming,
      @JsonKey(name: 'liked_creator') List<LikedCreator>? likedCreator,
      @JsonKey(name: 'creator_room') List<dynamic>? creatorRoom,
      @JsonKey(name: 'point_form_user', defaultValue: [])
      List<PointFormUser>? pointsFormUser,
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
      @JsonKey(
          name: 'notify_setting', includeFromJson: true, includeIfNull: false)
      @CoverConverter()
      NotifySetting? notifySetting,
      bool isManagedByThisAgent});

  @override
  $AvatarCopyWith<$Res>? get avatar;
  @override
  $CoverCopyWith<$Res>? get cover;
  @override
  $NotifySettingCopyWith<$Res>? get notifySetting;
}

/// @nodoc
class __$$UserImplCopyWithImpl<$Res>
    extends _$UserCopyWithImpl<$Res, _$UserImpl>
    implements _$$UserImplCopyWith<$Res> {
  __$$UserImplCopyWithImpl(_$UserImpl _value, $Res Function(_$UserImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? snsId = freezed,
    Object? email = freezed,
    Object? authenCode = freezed,
    Object? role = freezed,
    Object? nickname = freezed,
    Object? name = freezed,
    Object? nameKata = freezed,
    Object? birthdate = freezed,
    Object? tel = freezed,
    Object? isOnline = null,
    Object? stripeToken = freezed,
    Object? initialCallTiming = freezed,
    Object? initialCallFee = freezed,
    Object? afterCallTiming = freezed,
    Object? afterCallFee = freezed,
    Object? welcomeMessages = freezed,
    Object? evaluateScore = freezed,
    Object? totalEvaluated = freezed,
    Object? gender = freezed,
    Object? pointBalance = freezed,
    Object? withdrawPending = freezed,
    Object? xAccountUrl = freezed,
    Object? fbAccountUrl = freezed,
    Object? instagramAccountUrl = freezed,
    Object? tiktokAccountUrl = freezed,
    Object? agent10Code = freezed,
    Object? agent15Code = freezed,
    Object? agent20Code = freezed,
    Object? avatarImgId = freezed,
    Object? coverImgId = freezed,
    Object? isEmailVerified = freezed,
    Object? status = freezed,
    Object? isDeleted = freezed,
    Object? likeCount = freezed,
    Object? averageRating = freezed,
    Object? callFeePerTiming = freezed,
    Object? likedCreator = freezed,
    Object? creatorRoom = freezed,
    Object? pointsFormUser = freezed,
    Object? rank = freezed,
    Object? totalPoint = freezed,
    Object? totalRating = freezed,
    Object? refUrl = freezed,
    Object? lang = freezed,
    Object? agentOfCreator = freezed,
    Object? avatar = freezed,
    Object? cover = freezed,
    Object? notifySetting = freezed,
    Object? isManagedByThisAgent = null,
  }) {
    return _then(_$UserImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      snsId: freezed == snsId
          ? _value.snsId
          : snsId // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      authenCode: freezed == authenCode
          ? _value.authenCode
          : authenCode // ignore: cast_nullable_to_non_nullable
              as String?,
      role: freezed == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as Role?,
      nickname: freezed == nickname
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      nameKata: freezed == nameKata
          ? _value.nameKata
          : nameKata // ignore: cast_nullable_to_non_nullable
              as String?,
      birthdate: freezed == birthdate
          ? _value.birthdate
          : birthdate // ignore: cast_nullable_to_non_nullable
              as String?,
      tel: freezed == tel
          ? _value.tel
          : tel // ignore: cast_nullable_to_non_nullable
              as String?,
      isOnline: null == isOnline
          ? _value.isOnline
          : isOnline // ignore: cast_nullable_to_non_nullable
              as bool,
      stripeToken: freezed == stripeToken
          ? _value.stripeToken
          : stripeToken // ignore: cast_nullable_to_non_nullable
              as String?,
      initialCallTiming: freezed == initialCallTiming
          ? _value.initialCallTiming
          : initialCallTiming // ignore: cast_nullable_to_non_nullable
              as int?,
      initialCallFee: freezed == initialCallFee
          ? _value.initialCallFee
          : initialCallFee // ignore: cast_nullable_to_non_nullable
              as int?,
      afterCallTiming: freezed == afterCallTiming
          ? _value.afterCallTiming
          : afterCallTiming // ignore: cast_nullable_to_non_nullable
              as int?,
      afterCallFee: freezed == afterCallFee
          ? _value.afterCallFee
          : afterCallFee // ignore: cast_nullable_to_non_nullable
              as int?,
      welcomeMessages: freezed == welcomeMessages
          ? _value.welcomeMessages
          : welcomeMessages // ignore: cast_nullable_to_non_nullable
              as String?,
      evaluateScore: freezed == evaluateScore
          ? _value.evaluateScore
          : evaluateScore // ignore: cast_nullable_to_non_nullable
              as double?,
      totalEvaluated: freezed == totalEvaluated
          ? _value.totalEvaluated
          : totalEvaluated // ignore: cast_nullable_to_non_nullable
              as int?,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as int?,
      pointBalance: freezed == pointBalance
          ? _value.pointBalance
          : pointBalance // ignore: cast_nullable_to_non_nullable
              as int?,
      withdrawPending: freezed == withdrawPending
          ? _value.withdrawPending
          : withdrawPending // ignore: cast_nullable_to_non_nullable
              as int?,
      xAccountUrl: freezed == xAccountUrl
          ? _value.xAccountUrl
          : xAccountUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      fbAccountUrl: freezed == fbAccountUrl
          ? _value.fbAccountUrl
          : fbAccountUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      instagramAccountUrl: freezed == instagramAccountUrl
          ? _value.instagramAccountUrl
          : instagramAccountUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      tiktokAccountUrl: freezed == tiktokAccountUrl
          ? _value.tiktokAccountUrl
          : tiktokAccountUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      agent10Code: freezed == agent10Code
          ? _value.agent10Code
          : agent10Code // ignore: cast_nullable_to_non_nullable
              as String?,
      agent15Code: freezed == agent15Code
          ? _value.agent15Code
          : agent15Code // ignore: cast_nullable_to_non_nullable
              as String?,
      agent20Code: freezed == agent20Code
          ? _value.agent20Code
          : agent20Code // ignore: cast_nullable_to_non_nullable
              as String?,
      avatarImgId: freezed == avatarImgId
          ? _value.avatarImgId
          : avatarImgId // ignore: cast_nullable_to_non_nullable
              as int?,
      coverImgId: freezed == coverImgId
          ? _value.coverImgId
          : coverImgId // ignore: cast_nullable_to_non_nullable
              as int?,
      isEmailVerified: freezed == isEmailVerified
          ? _value.isEmailVerified
          : isEmailVerified // ignore: cast_nullable_to_non_nullable
              as bool?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
      isDeleted: freezed == isDeleted
          ? _value.isDeleted
          : isDeleted // ignore: cast_nullable_to_non_nullable
              as bool?,
      likeCount: freezed == likeCount
          ? _value.likeCount
          : likeCount // ignore: cast_nullable_to_non_nullable
              as int?,
      averageRating: freezed == averageRating
          ? _value.averageRating
          : averageRating // ignore: cast_nullable_to_non_nullable
              as double?,
      callFeePerTiming: freezed == callFeePerTiming
          ? _value.callFeePerTiming
          : callFeePerTiming // ignore: cast_nullable_to_non_nullable
              as double?,
      likedCreator: freezed == likedCreator
          ? _value._likedCreator
          : likedCreator // ignore: cast_nullable_to_non_nullable
              as List<LikedCreator>?,
      creatorRoom: freezed == creatorRoom
          ? _value._creatorRoom
          : creatorRoom // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      pointsFormUser: freezed == pointsFormUser
          ? _value._pointsFormUser
          : pointsFormUser // ignore: cast_nullable_to_non_nullable
              as List<PointFormUser>?,
      rank: freezed == rank
          ? _value.rank
          : rank // ignore: cast_nullable_to_non_nullable
              as int?,
      totalPoint: freezed == totalPoint
          ? _value.totalPoint
          : totalPoint // ignore: cast_nullable_to_non_nullable
              as int?,
      totalRating: freezed == totalRating
          ? _value.totalRating
          : totalRating // ignore: cast_nullable_to_non_nullable
              as int?,
      refUrl: freezed == refUrl
          ? _value.refUrl
          : refUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      lang: freezed == lang
          ? _value.lang
          : lang // ignore: cast_nullable_to_non_nullable
              as String?,
      agentOfCreator: freezed == agentOfCreator
          ? _value._agentOfCreator
          : agentOfCreator // ignore: cast_nullable_to_non_nullable
              as List<AgentOfCreator>?,
      avatar: freezed == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as Avatar?,
      cover: freezed == cover
          ? _value.cover
          : cover // ignore: cast_nullable_to_non_nullable
              as Cover?,
      notifySetting: freezed == notifySetting
          ? _value.notifySetting
          : notifySetting // ignore: cast_nullable_to_non_nullable
              as NotifySetting?,
      isManagedByThisAgent: null == isManagedByThisAgent
          ? _value.isManagedByThisAgent
          : isManagedByThisAgent // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserImpl implements _User {
  const _$UserImpl(
      {@JsonKey(name: 'id') required this.id,
      @JsonKey(name: 'sns_id') this.snsId,
      @JsonKey(name: 'email') this.email,
      @JsonKey(name: 'authen_code') this.authenCode,
      @JsonKey(name: 'role', includeFromJson: true)
      @RoleConverter()
      required this.role,
      @JsonKey(name: 'nickname') this.nickname,
      @JsonKey(name: 'name') this.name,
      @JsonKey(name: 'name_kata') this.nameKata,
      @JsonKey(name: 'birthdate') this.birthdate,
      @JsonKey(name: 'tel') this.tel,
      @JsonKey(name: 'is_online', defaultValue: false) required this.isOnline,
      @JsonKey(name: 'stripe_token') this.stripeToken,
      @JsonKey(name: 'initial_call_timing') required this.initialCallTiming,
      @JsonKey(name: 'initial_call_fee') required this.initialCallFee,
      @JsonKey(name: 'after_call_timing') required this.afterCallTiming,
      @JsonKey(name: 'after_call_fee') required this.afterCallFee,
      @JsonKey(name: 'welcome_messages') this.welcomeMessages,
      @JsonKey(name: 'evaluate_score') required this.evaluateScore,
      @JsonKey(name: 'total_evaluated') required this.totalEvaluated,
      @JsonKey(name: 'gender') required this.gender,
      @JsonKey(name: 'point_balance') this.pointBalance,
      @JsonKey(name: 'withdraw_pending') this.withdrawPending,
      @JsonKey(name: 'x_account_url') this.xAccountUrl,
      @JsonKey(name: 'fb_account_url') this.fbAccountUrl,
      @JsonKey(name: 'instagram_account_url') this.instagramAccountUrl,
      @JsonKey(name: 'tiktok_account_url') this.tiktokAccountUrl,
      @JsonKey(name: 'agent_10_code') this.agent10Code,
      @JsonKey(name: 'agent_15_code') this.agent15Code,
      @JsonKey(name: 'agent_20_code') this.agent20Code,
      @JsonKey(name: 'avatar_img_id') this.avatarImgId,
      @JsonKey(name: 'cover_img_id') this.coverImgId,
      @JsonKey(name: 'is_email_verified') required this.isEmailVerified,
      @JsonKey(name: 'status') this.status,
      @JsonKey(name: 'is_deleted') required this.isDeleted,
      @JsonKey(name: 'like_count') this.likeCount,
      @JsonKey(name: 'average_rating') this.averageRating,
      @JsonKey(name: 'call_fee_per_timing') this.callFeePerTiming,
      @JsonKey(name: 'liked_creator') final List<LikedCreator>? likedCreator,
      @JsonKey(name: 'creator_room') final List<dynamic>? creatorRoom,
      @JsonKey(name: 'point_form_user', defaultValue: [])
      final List<PointFormUser>? pointsFormUser,
      @JsonKey(name: 'rank') this.rank,
      @JsonKey(name: 'total_point', defaultValue: 0) this.totalPoint,
      @JsonKey(name: 'total_rating', defaultValue: 0) this.totalRating,
      @JsonKey(name: 'url') this.refUrl,
      @JsonKey(name: 'lang') this.lang,
      @JsonKey(readValue: _creatorReader)
      final List<AgentOfCreator>? agentOfCreator,
      @JsonKey(name: 'avatar', includeFromJson: true, includeIfNull: false)
      @AvatarConverter()
      this.avatar,
      @JsonKey(name: 'cover', includeFromJson: true, includeIfNull: false)
      @CoverConverter()
      this.cover,
      @JsonKey(
          name: 'notify_setting', includeFromJson: true, includeIfNull: false)
      @CoverConverter()
      this.notifySetting,
      this.isManagedByThisAgent = false})
      : _likedCreator = likedCreator,
        _creatorRoom = creatorRoom,
        _pointsFormUser = pointsFormUser,
        _agentOfCreator = agentOfCreator;

  factory _$UserImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int id;
  @override
  @JsonKey(name: 'sns_id')
  final String? snsId;
  @override
  @JsonKey(name: 'email')
  final String? email;
  @override
  @JsonKey(name: 'authen_code')
  final String? authenCode;
  @override
  @JsonKey(name: 'role', includeFromJson: true)
  @RoleConverter()
  final Role? role;
  @override
  @JsonKey(name: 'nickname')
  final String? nickname;
  @override
  @JsonKey(name: 'name')
  final String? name;
  @override
  @JsonKey(name: 'name_kata')
  final String? nameKata;
  @override
  @JsonKey(name: 'birthdate')
  final String? birthdate;
  @override
  @JsonKey(name: 'tel')
  final String? tel;
  @override
  @JsonKey(name: 'is_online', defaultValue: false)
  final bool isOnline;
  @override
  @JsonKey(name: 'stripe_token')
  final String? stripeToken;
  @override
  @JsonKey(name: 'initial_call_timing')
  final int? initialCallTiming;
  @override
  @JsonKey(name: 'initial_call_fee')
  final int? initialCallFee;
  @override
  @JsonKey(name: 'after_call_timing')
  final int? afterCallTiming;
  @override
  @JsonKey(name: 'after_call_fee')
  final int? afterCallFee;
  @override
  @JsonKey(name: 'welcome_messages')
  final String? welcomeMessages;
  @override
  @JsonKey(name: 'evaluate_score')
  final double? evaluateScore;
  @override
  @JsonKey(name: 'total_evaluated')
  final int? totalEvaluated;
  @override
  @JsonKey(name: 'gender')
  final int? gender;
  @override
  @JsonKey(name: 'point_balance')
  final int? pointBalance;
  @override
  @JsonKey(name: 'withdraw_pending')
  final int? withdrawPending;
  @override
  @JsonKey(name: 'x_account_url')
  final String? xAccountUrl;
  @override
  @JsonKey(name: 'fb_account_url')
  final String? fbAccountUrl;
  @override
  @JsonKey(name: 'instagram_account_url')
  final String? instagramAccountUrl;
  @override
  @JsonKey(name: 'tiktok_account_url')
  final String? tiktokAccountUrl;
  @override
  @JsonKey(name: 'agent_10_code')
  final String? agent10Code;
  @override
  @JsonKey(name: 'agent_15_code')
  final String? agent15Code;
  @override
  @JsonKey(name: 'agent_20_code')
  final String? agent20Code;
  @override
  @JsonKey(name: 'avatar_img_id')
  final int? avatarImgId;
  @override
  @JsonKey(name: 'cover_img_id')
  final int? coverImgId;
  @override
  @JsonKey(name: 'is_email_verified')
  final bool? isEmailVerified;
  @override
  @JsonKey(name: 'status')
  final int? status;
  @override
  @JsonKey(name: 'is_deleted')
  final bool? isDeleted;
  @override
  @JsonKey(name: 'like_count')
  final int? likeCount;
  @override
  @JsonKey(name: 'average_rating')
  final double? averageRating;
  @override
  @JsonKey(name: 'call_fee_per_timing')
  final double? callFeePerTiming;
  final List<LikedCreator>? _likedCreator;
  @override
  @JsonKey(name: 'liked_creator')
  List<LikedCreator>? get likedCreator {
    final value = _likedCreator;
    if (value == null) return null;
    if (_likedCreator is EqualUnmodifiableListView) return _likedCreator;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<dynamic>? _creatorRoom;
  @override
  @JsonKey(name: 'creator_room')
  List<dynamic>? get creatorRoom {
    final value = _creatorRoom;
    if (value == null) return null;
    if (_creatorRoom is EqualUnmodifiableListView) return _creatorRoom;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<PointFormUser>? _pointsFormUser;
  @override
  @JsonKey(name: 'point_form_user', defaultValue: [])
  List<PointFormUser>? get pointsFormUser {
    final value = _pointsFormUser;
    if (value == null) return null;
    if (_pointsFormUser is EqualUnmodifiableListView) return _pointsFormUser;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'rank')
  final int? rank;
  @override
  @JsonKey(name: 'total_point', defaultValue: 0)
  final int? totalPoint;
  @override
  @JsonKey(name: 'total_rating', defaultValue: 0)
  final int? totalRating;
  @override
  @JsonKey(name: 'url')
  final String? refUrl;
  @override
  @JsonKey(name: 'lang')
  final String? lang;
  final List<AgentOfCreator>? _agentOfCreator;
  @override
  @JsonKey(readValue: _creatorReader)
  List<AgentOfCreator>? get agentOfCreator {
    final value = _agentOfCreator;
    if (value == null) return null;
    if (_agentOfCreator is EqualUnmodifiableListView) return _agentOfCreator;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'avatar', includeFromJson: true, includeIfNull: false)
  @AvatarConverter()
  final Avatar? avatar;
  @override
  @JsonKey(name: 'cover', includeFromJson: true, includeIfNull: false)
  @CoverConverter()
  final Cover? cover;
  @override
  @JsonKey(name: 'notify_setting', includeFromJson: true, includeIfNull: false)
  @CoverConverter()
  final NotifySetting? notifySetting;
  @override
  @JsonKey()
  final bool isManagedByThisAgent;

  @override
  String toString() {
    return 'User(id: $id, snsId: $snsId, email: $email, authenCode: $authenCode, role: $role, nickname: $nickname, name: $name, nameKata: $nameKata, birthdate: $birthdate, tel: $tel, isOnline: $isOnline, stripeToken: $stripeToken, initialCallTiming: $initialCallTiming, initialCallFee: $initialCallFee, afterCallTiming: $afterCallTiming, afterCallFee: $afterCallFee, welcomeMessages: $welcomeMessages, evaluateScore: $evaluateScore, totalEvaluated: $totalEvaluated, gender: $gender, pointBalance: $pointBalance, withdrawPending: $withdrawPending, xAccountUrl: $xAccountUrl, fbAccountUrl: $fbAccountUrl, instagramAccountUrl: $instagramAccountUrl, tiktokAccountUrl: $tiktokAccountUrl, agent10Code: $agent10Code, agent15Code: $agent15Code, agent20Code: $agent20Code, avatarImgId: $avatarImgId, coverImgId: $coverImgId, isEmailVerified: $isEmailVerified, status: $status, isDeleted: $isDeleted, likeCount: $likeCount, averageRating: $averageRating, callFeePerTiming: $callFeePerTiming, likedCreator: $likedCreator, creatorRoom: $creatorRoom, pointsFormUser: $pointsFormUser, rank: $rank, totalPoint: $totalPoint, totalRating: $totalRating, refUrl: $refUrl, lang: $lang, agentOfCreator: $agentOfCreator, avatar: $avatar, cover: $cover, notifySetting: $notifySetting, isManagedByThisAgent: $isManagedByThisAgent)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.snsId, snsId) || other.snsId == snsId) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.authenCode, authenCode) ||
                other.authenCode == authenCode) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.nickname, nickname) ||
                other.nickname == nickname) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.nameKata, nameKata) ||
                other.nameKata == nameKata) &&
            (identical(other.birthdate, birthdate) ||
                other.birthdate == birthdate) &&
            (identical(other.tel, tel) || other.tel == tel) &&
            (identical(other.isOnline, isOnline) ||
                other.isOnline == isOnline) &&
            (identical(other.stripeToken, stripeToken) ||
                other.stripeToken == stripeToken) &&
            (identical(other.initialCallTiming, initialCallTiming) ||
                other.initialCallTiming == initialCallTiming) &&
            (identical(other.initialCallFee, initialCallFee) ||
                other.initialCallFee == initialCallFee) &&
            (identical(other.afterCallTiming, afterCallTiming) ||
                other.afterCallTiming == afterCallTiming) &&
            (identical(other.afterCallFee, afterCallFee) ||
                other.afterCallFee == afterCallFee) &&
            (identical(other.welcomeMessages, welcomeMessages) ||
                other.welcomeMessages == welcomeMessages) &&
            (identical(other.evaluateScore, evaluateScore) ||
                other.evaluateScore == evaluateScore) &&
            (identical(other.totalEvaluated, totalEvaluated) ||
                other.totalEvaluated == totalEvaluated) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.pointBalance, pointBalance) ||
                other.pointBalance == pointBalance) &&
            (identical(other.withdrawPending, withdrawPending) ||
                other.withdrawPending == withdrawPending) &&
            (identical(other.xAccountUrl, xAccountUrl) ||
                other.xAccountUrl == xAccountUrl) &&
            (identical(other.fbAccountUrl, fbAccountUrl) ||
                other.fbAccountUrl == fbAccountUrl) &&
            (identical(other.instagramAccountUrl, instagramAccountUrl) ||
                other.instagramAccountUrl == instagramAccountUrl) &&
            (identical(other.tiktokAccountUrl, tiktokAccountUrl) ||
                other.tiktokAccountUrl == tiktokAccountUrl) &&
            (identical(other.agent10Code, agent10Code) ||
                other.agent10Code == agent10Code) &&
            (identical(other.agent15Code, agent15Code) ||
                other.agent15Code == agent15Code) &&
            (identical(other.agent20Code, agent20Code) ||
                other.agent20Code == agent20Code) &&
            (identical(other.avatarImgId, avatarImgId) ||
                other.avatarImgId == avatarImgId) &&
            (identical(other.coverImgId, coverImgId) ||
                other.coverImgId == coverImgId) &&
            (identical(other.isEmailVerified, isEmailVerified) ||
                other.isEmailVerified == isEmailVerified) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.isDeleted, isDeleted) ||
                other.isDeleted == isDeleted) &&
            (identical(other.likeCount, likeCount) ||
                other.likeCount == likeCount) &&
            (identical(other.averageRating, averageRating) ||
                other.averageRating == averageRating) &&
            (identical(other.callFeePerTiming, callFeePerTiming) ||
                other.callFeePerTiming == callFeePerTiming) &&
            const DeepCollectionEquality()
                .equals(other._likedCreator, _likedCreator) &&
            const DeepCollectionEquality()
                .equals(other._creatorRoom, _creatorRoom) &&
            const DeepCollectionEquality()
                .equals(other._pointsFormUser, _pointsFormUser) &&
            (identical(other.rank, rank) || other.rank == rank) &&
            (identical(other.totalPoint, totalPoint) ||
                other.totalPoint == totalPoint) &&
            (identical(other.totalRating, totalRating) ||
                other.totalRating == totalRating) &&
            (identical(other.refUrl, refUrl) || other.refUrl == refUrl) &&
            (identical(other.lang, lang) || other.lang == lang) &&
            const DeepCollectionEquality()
                .equals(other._agentOfCreator, _agentOfCreator) &&
            (identical(other.avatar, avatar) || other.avatar == avatar) &&
            (identical(other.cover, cover) || other.cover == cover) &&
            (identical(other.notifySetting, notifySetting) ||
                other.notifySetting == notifySetting) &&
            (identical(other.isManagedByThisAgent, isManagedByThisAgent) ||
                other.isManagedByThisAgent == isManagedByThisAgent));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        snsId,
        email,
        authenCode,
        role,
        nickname,
        name,
        nameKata,
        birthdate,
        tel,
        isOnline,
        stripeToken,
        initialCallTiming,
        initialCallFee,
        afterCallTiming,
        afterCallFee,
        welcomeMessages,
        evaluateScore,
        totalEvaluated,
        gender,
        pointBalance,
        withdrawPending,
        xAccountUrl,
        fbAccountUrl,
        instagramAccountUrl,
        tiktokAccountUrl,
        agent10Code,
        agent15Code,
        agent20Code,
        avatarImgId,
        coverImgId,
        isEmailVerified,
        status,
        isDeleted,
        likeCount,
        averageRating,
        callFeePerTiming,
        const DeepCollectionEquality().hash(_likedCreator),
        const DeepCollectionEquality().hash(_creatorRoom),
        const DeepCollectionEquality().hash(_pointsFormUser),
        rank,
        totalPoint,
        totalRating,
        refUrl,
        lang,
        const DeepCollectionEquality().hash(_agentOfCreator),
        avatar,
        cover,
        notifySetting,
        isManagedByThisAgent
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserImplCopyWith<_$UserImpl> get copyWith =>
      __$$UserImplCopyWithImpl<_$UserImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserImplToJson(
      this,
    );
  }
}

abstract class _User implements User {
  const factory _User(
      {@JsonKey(name: 'id') required final int id,
      @JsonKey(name: 'sns_id') final String? snsId,
      @JsonKey(name: 'email') final String? email,
      @JsonKey(name: 'authen_code') final String? authenCode,
      @JsonKey(name: 'role', includeFromJson: true)
      @RoleConverter()
      required final Role? role,
      @JsonKey(name: 'nickname') final String? nickname,
      @JsonKey(name: 'name') final String? name,
      @JsonKey(name: 'name_kata') final String? nameKata,
      @JsonKey(name: 'birthdate') final String? birthdate,
      @JsonKey(name: 'tel') final String? tel,
      @JsonKey(name: 'is_online', defaultValue: false)
      required final bool isOnline,
      @JsonKey(name: 'stripe_token') final String? stripeToken,
      @JsonKey(name: 'initial_call_timing')
      required final int? initialCallTiming,
      @JsonKey(name: 'initial_call_fee') required final int? initialCallFee,
      @JsonKey(name: 'after_call_timing') required final int? afterCallTiming,
      @JsonKey(name: 'after_call_fee') required final int? afterCallFee,
      @JsonKey(name: 'welcome_messages') final String? welcomeMessages,
      @JsonKey(name: 'evaluate_score') required final double? evaluateScore,
      @JsonKey(name: 'total_evaluated') required final int? totalEvaluated,
      @JsonKey(name: 'gender') required final int? gender,
      @JsonKey(name: 'point_balance') final int? pointBalance,
      @JsonKey(name: 'withdraw_pending') final int? withdrawPending,
      @JsonKey(name: 'x_account_url') final String? xAccountUrl,
      @JsonKey(name: 'fb_account_url') final String? fbAccountUrl,
      @JsonKey(name: 'instagram_account_url') final String? instagramAccountUrl,
      @JsonKey(name: 'tiktok_account_url') final String? tiktokAccountUrl,
      @JsonKey(name: 'agent_10_code') final String? agent10Code,
      @JsonKey(name: 'agent_15_code') final String? agent15Code,
      @JsonKey(name: 'agent_20_code') final String? agent20Code,
      @JsonKey(name: 'avatar_img_id') final int? avatarImgId,
      @JsonKey(name: 'cover_img_id') final int? coverImgId,
      @JsonKey(name: 'is_email_verified') required final bool? isEmailVerified,
      @JsonKey(name: 'status') final int? status,
      @JsonKey(name: 'is_deleted') required final bool? isDeleted,
      @JsonKey(name: 'like_count') final int? likeCount,
      @JsonKey(name: 'average_rating') final double? averageRating,
      @JsonKey(name: 'call_fee_per_timing') final double? callFeePerTiming,
      @JsonKey(name: 'liked_creator') final List<LikedCreator>? likedCreator,
      @JsonKey(name: 'creator_room') final List<dynamic>? creatorRoom,
      @JsonKey(name: 'point_form_user', defaultValue: [])
      final List<PointFormUser>? pointsFormUser,
      @JsonKey(name: 'rank') final int? rank,
      @JsonKey(name: 'total_point', defaultValue: 0) final int? totalPoint,
      @JsonKey(name: 'total_rating', defaultValue: 0) final int? totalRating,
      @JsonKey(name: 'url') final String? refUrl,
      @JsonKey(name: 'lang') final String? lang,
      @JsonKey(readValue: _creatorReader)
      final List<AgentOfCreator>? agentOfCreator,
      @JsonKey(name: 'avatar', includeFromJson: true, includeIfNull: false)
      @AvatarConverter()
      final Avatar? avatar,
      @JsonKey(name: 'cover', includeFromJson: true, includeIfNull: false)
      @CoverConverter()
      final Cover? cover,
      @JsonKey(
          name: 'notify_setting', includeFromJson: true, includeIfNull: false)
      @CoverConverter()
      final NotifySetting? notifySetting,
      final bool isManagedByThisAgent}) = _$UserImpl;

  factory _User.fromJson(Map<String, dynamic> json) = _$UserImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  int get id;
  @override
  @JsonKey(name: 'sns_id')
  String? get snsId;
  @override
  @JsonKey(name: 'email')
  String? get email;
  @override
  @JsonKey(name: 'authen_code')
  String? get authenCode;
  @override
  @JsonKey(name: 'role', includeFromJson: true)
  @RoleConverter()
  Role? get role;
  @override
  @JsonKey(name: 'nickname')
  String? get nickname;
  @override
  @JsonKey(name: 'name')
  String? get name;
  @override
  @JsonKey(name: 'name_kata')
  String? get nameKata;
  @override
  @JsonKey(name: 'birthdate')
  String? get birthdate;
  @override
  @JsonKey(name: 'tel')
  String? get tel;
  @override
  @JsonKey(name: 'is_online', defaultValue: false)
  bool get isOnline;
  @override
  @JsonKey(name: 'stripe_token')
  String? get stripeToken;
  @override
  @JsonKey(name: 'initial_call_timing')
  int? get initialCallTiming;
  @override
  @JsonKey(name: 'initial_call_fee')
  int? get initialCallFee;
  @override
  @JsonKey(name: 'after_call_timing')
  int? get afterCallTiming;
  @override
  @JsonKey(name: 'after_call_fee')
  int? get afterCallFee;
  @override
  @JsonKey(name: 'welcome_messages')
  String? get welcomeMessages;
  @override
  @JsonKey(name: 'evaluate_score')
  double? get evaluateScore;
  @override
  @JsonKey(name: 'total_evaluated')
  int? get totalEvaluated;
  @override
  @JsonKey(name: 'gender')
  int? get gender;
  @override
  @JsonKey(name: 'point_balance')
  int? get pointBalance;
  @override
  @JsonKey(name: 'withdraw_pending')
  int? get withdrawPending;
  @override
  @JsonKey(name: 'x_account_url')
  String? get xAccountUrl;
  @override
  @JsonKey(name: 'fb_account_url')
  String? get fbAccountUrl;
  @override
  @JsonKey(name: 'instagram_account_url')
  String? get instagramAccountUrl;
  @override
  @JsonKey(name: 'tiktok_account_url')
  String? get tiktokAccountUrl;
  @override
  @JsonKey(name: 'agent_10_code')
  String? get agent10Code;
  @override
  @JsonKey(name: 'agent_15_code')
  String? get agent15Code;
  @override
  @JsonKey(name: 'agent_20_code')
  String? get agent20Code;
  @override
  @JsonKey(name: 'avatar_img_id')
  int? get avatarImgId;
  @override
  @JsonKey(name: 'cover_img_id')
  int? get coverImgId;
  @override
  @JsonKey(name: 'is_email_verified')
  bool? get isEmailVerified;
  @override
  @JsonKey(name: 'status')
  int? get status;
  @override
  @JsonKey(name: 'is_deleted')
  bool? get isDeleted;
  @override
  @JsonKey(name: 'like_count')
  int? get likeCount;
  @override
  @JsonKey(name: 'average_rating')
  double? get averageRating;
  @override
  @JsonKey(name: 'call_fee_per_timing')
  double? get callFeePerTiming;
  @override
  @JsonKey(name: 'liked_creator')
  List<LikedCreator>? get likedCreator;
  @override
  @JsonKey(name: 'creator_room')
  List<dynamic>? get creatorRoom;
  @override
  @JsonKey(name: 'point_form_user', defaultValue: [])
  List<PointFormUser>? get pointsFormUser;
  @override
  @JsonKey(name: 'rank')
  int? get rank;
  @override
  @JsonKey(name: 'total_point', defaultValue: 0)
  int? get totalPoint;
  @override
  @JsonKey(name: 'total_rating', defaultValue: 0)
  int? get totalRating;
  @override
  @JsonKey(name: 'url')
  String? get refUrl;
  @override
  @JsonKey(name: 'lang')
  String? get lang;
  @override
  @JsonKey(readValue: _creatorReader)
  List<AgentOfCreator>? get agentOfCreator;
  @override
  @JsonKey(name: 'avatar', includeFromJson: true, includeIfNull: false)
  @AvatarConverter()
  Avatar? get avatar;
  @override
  @JsonKey(name: 'cover', includeFromJson: true, includeIfNull: false)
  @CoverConverter()
  Cover? get cover;
  @override
  @JsonKey(name: 'notify_setting', includeFromJson: true, includeIfNull: false)
  @CoverConverter()
  NotifySetting? get notifySetting;
  @override
  bool get isManagedByThisAgent;
  @override
  @JsonKey(ignore: true)
  _$$UserImplCopyWith<_$UserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LikedCreator _$LikedCreatorFromJson(Map<String, dynamic> json) {
  return _LikedCreator.fromJson(json);
}

/// @nodoc
mixin _$LikedCreator {
  @JsonKey(name: 'id')
  int get id => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LikedCreatorCopyWith<LikedCreator> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LikedCreatorCopyWith<$Res> {
  factory $LikedCreatorCopyWith(
          LikedCreator value, $Res Function(LikedCreator) then) =
      _$LikedCreatorCopyWithImpl<$Res, LikedCreator>;
  @useResult
  $Res call({@JsonKey(name: 'id') int id});
}

/// @nodoc
class _$LikedCreatorCopyWithImpl<$Res, $Val extends LikedCreator>
    implements $LikedCreatorCopyWith<$Res> {
  _$LikedCreatorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LikedCreatorImplCopyWith<$Res>
    implements $LikedCreatorCopyWith<$Res> {
  factory _$$LikedCreatorImplCopyWith(
          _$LikedCreatorImpl value, $Res Function(_$LikedCreatorImpl) then) =
      __$$LikedCreatorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'id') int id});
}

/// @nodoc
class __$$LikedCreatorImplCopyWithImpl<$Res>
    extends _$LikedCreatorCopyWithImpl<$Res, _$LikedCreatorImpl>
    implements _$$LikedCreatorImplCopyWith<$Res> {
  __$$LikedCreatorImplCopyWithImpl(
      _$LikedCreatorImpl _value, $Res Function(_$LikedCreatorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$LikedCreatorImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LikedCreatorImpl implements _LikedCreator {
  const _$LikedCreatorImpl({@JsonKey(name: 'id') required this.id});

  factory _$LikedCreatorImpl.fromJson(Map<String, dynamic> json) =>
      _$$LikedCreatorImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int id;

  @override
  String toString() {
    return 'LikedCreator(id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LikedCreatorImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LikedCreatorImplCopyWith<_$LikedCreatorImpl> get copyWith =>
      __$$LikedCreatorImplCopyWithImpl<_$LikedCreatorImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LikedCreatorImplToJson(
      this,
    );
  }
}

abstract class _LikedCreator implements LikedCreator {
  const factory _LikedCreator({@JsonKey(name: 'id') required final int id}) =
      _$LikedCreatorImpl;

  factory _LikedCreator.fromJson(Map<String, dynamic> json) =
      _$LikedCreatorImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  int get id;
  @override
  @JsonKey(ignore: true)
  _$$LikedCreatorImplCopyWith<_$LikedCreatorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Avatar _$AvatarFromJson(Map<String, dynamic> json) {
  return _Avatar.fromJson(json);
}

/// @nodoc
mixin _$Avatar {
  @JsonKey(name: 'file_path')
  String get filePath => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AvatarCopyWith<Avatar> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AvatarCopyWith<$Res> {
  factory $AvatarCopyWith(Avatar value, $Res Function(Avatar) then) =
      _$AvatarCopyWithImpl<$Res, Avatar>;
  @useResult
  $Res call({@JsonKey(name: 'file_path') String filePath});
}

/// @nodoc
class _$AvatarCopyWithImpl<$Res, $Val extends Avatar>
    implements $AvatarCopyWith<$Res> {
  _$AvatarCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? filePath = null,
  }) {
    return _then(_value.copyWith(
      filePath: null == filePath
          ? _value.filePath
          : filePath // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AvatarImplCopyWith<$Res> implements $AvatarCopyWith<$Res> {
  factory _$$AvatarImplCopyWith(
          _$AvatarImpl value, $Res Function(_$AvatarImpl) then) =
      __$$AvatarImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'file_path') String filePath});
}

/// @nodoc
class __$$AvatarImplCopyWithImpl<$Res>
    extends _$AvatarCopyWithImpl<$Res, _$AvatarImpl>
    implements _$$AvatarImplCopyWith<$Res> {
  __$$AvatarImplCopyWithImpl(
      _$AvatarImpl _value, $Res Function(_$AvatarImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? filePath = null,
  }) {
    return _then(_$AvatarImpl(
      filePath: null == filePath
          ? _value.filePath
          : filePath // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AvatarImpl implements _Avatar {
  const _$AvatarImpl({@JsonKey(name: 'file_path') required this.filePath});

  factory _$AvatarImpl.fromJson(Map<String, dynamic> json) =>
      _$$AvatarImplFromJson(json);

  @override
  @JsonKey(name: 'file_path')
  final String filePath;

  @override
  String toString() {
    return 'Avatar(filePath: $filePath)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AvatarImpl &&
            (identical(other.filePath, filePath) ||
                other.filePath == filePath));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, filePath);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AvatarImplCopyWith<_$AvatarImpl> get copyWith =>
      __$$AvatarImplCopyWithImpl<_$AvatarImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AvatarImplToJson(
      this,
    );
  }
}

abstract class _Avatar implements Avatar {
  const factory _Avatar(
          {@JsonKey(name: 'file_path') required final String filePath}) =
      _$AvatarImpl;

  factory _Avatar.fromJson(Map<String, dynamic> json) = _$AvatarImpl.fromJson;

  @override
  @JsonKey(name: 'file_path')
  String get filePath;
  @override
  @JsonKey(ignore: true)
  _$$AvatarImplCopyWith<_$AvatarImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Cover _$CoverFromJson(Map<String, dynamic> json) {
  return _Cover.fromJson(json);
}

/// @nodoc
mixin _$Cover {
  @JsonKey(name: 'file_path')
  String get filePath => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CoverCopyWith<Cover> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CoverCopyWith<$Res> {
  factory $CoverCopyWith(Cover value, $Res Function(Cover) then) =
      _$CoverCopyWithImpl<$Res, Cover>;
  @useResult
  $Res call({@JsonKey(name: 'file_path') String filePath});
}

/// @nodoc
class _$CoverCopyWithImpl<$Res, $Val extends Cover>
    implements $CoverCopyWith<$Res> {
  _$CoverCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? filePath = null,
  }) {
    return _then(_value.copyWith(
      filePath: null == filePath
          ? _value.filePath
          : filePath // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CoverImplCopyWith<$Res> implements $CoverCopyWith<$Res> {
  factory _$$CoverImplCopyWith(
          _$CoverImpl value, $Res Function(_$CoverImpl) then) =
      __$$CoverImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'file_path') String filePath});
}

/// @nodoc
class __$$CoverImplCopyWithImpl<$Res>
    extends _$CoverCopyWithImpl<$Res, _$CoverImpl>
    implements _$$CoverImplCopyWith<$Res> {
  __$$CoverImplCopyWithImpl(
      _$CoverImpl _value, $Res Function(_$CoverImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? filePath = null,
  }) {
    return _then(_$CoverImpl(
      filePath: null == filePath
          ? _value.filePath
          : filePath // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CoverImpl implements _Cover {
  const _$CoverImpl({@JsonKey(name: 'file_path') required this.filePath});

  factory _$CoverImpl.fromJson(Map<String, dynamic> json) =>
      _$$CoverImplFromJson(json);

  @override
  @JsonKey(name: 'file_path')
  final String filePath;

  @override
  String toString() {
    return 'Cover(filePath: $filePath)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CoverImpl &&
            (identical(other.filePath, filePath) ||
                other.filePath == filePath));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, filePath);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CoverImplCopyWith<_$CoverImpl> get copyWith =>
      __$$CoverImplCopyWithImpl<_$CoverImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CoverImplToJson(
      this,
    );
  }
}

abstract class _Cover implements Cover {
  const factory _Cover(
          {@JsonKey(name: 'file_path') required final String filePath}) =
      _$CoverImpl;

  factory _Cover.fromJson(Map<String, dynamic> json) = _$CoverImpl.fromJson;

  @override
  @JsonKey(name: 'file_path')
  String get filePath;
  @override
  @JsonKey(ignore: true)
  _$$CoverImplCopyWith<_$CoverImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

NotifySetting _$NotifySettingFromJson(Map<String, dynamic> json) {
  return _NotifySetting.fromJson(json);
}

/// @nodoc
mixin _$NotifySetting {
  @JsonKey(name: 'is_allowed_admin_notify')
  bool get isAllowedAdminNotify => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_allowed_normal_notify')
  bool get isAllowedNormalNotify => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NotifySettingCopyWith<NotifySetting> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotifySettingCopyWith<$Res> {
  factory $NotifySettingCopyWith(
          NotifySetting value, $Res Function(NotifySetting) then) =
      _$NotifySettingCopyWithImpl<$Res, NotifySetting>;
  @useResult
  $Res call(
      {@JsonKey(name: 'is_allowed_admin_notify') bool isAllowedAdminNotify,
      @JsonKey(name: 'is_allowed_normal_notify') bool isAllowedNormalNotify});
}

/// @nodoc
class _$NotifySettingCopyWithImpl<$Res, $Val extends NotifySetting>
    implements $NotifySettingCopyWith<$Res> {
  _$NotifySettingCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isAllowedAdminNotify = null,
    Object? isAllowedNormalNotify = null,
  }) {
    return _then(_value.copyWith(
      isAllowedAdminNotify: null == isAllowedAdminNotify
          ? _value.isAllowedAdminNotify
          : isAllowedAdminNotify // ignore: cast_nullable_to_non_nullable
              as bool,
      isAllowedNormalNotify: null == isAllowedNormalNotify
          ? _value.isAllowedNormalNotify
          : isAllowedNormalNotify // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NotifySettingImplCopyWith<$Res>
    implements $NotifySettingCopyWith<$Res> {
  factory _$$NotifySettingImplCopyWith(
          _$NotifySettingImpl value, $Res Function(_$NotifySettingImpl) then) =
      __$$NotifySettingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'is_allowed_admin_notify') bool isAllowedAdminNotify,
      @JsonKey(name: 'is_allowed_normal_notify') bool isAllowedNormalNotify});
}

/// @nodoc
class __$$NotifySettingImplCopyWithImpl<$Res>
    extends _$NotifySettingCopyWithImpl<$Res, _$NotifySettingImpl>
    implements _$$NotifySettingImplCopyWith<$Res> {
  __$$NotifySettingImplCopyWithImpl(
      _$NotifySettingImpl _value, $Res Function(_$NotifySettingImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isAllowedAdminNotify = null,
    Object? isAllowedNormalNotify = null,
  }) {
    return _then(_$NotifySettingImpl(
      isAllowedAdminNotify: null == isAllowedAdminNotify
          ? _value.isAllowedAdminNotify
          : isAllowedAdminNotify // ignore: cast_nullable_to_non_nullable
              as bool,
      isAllowedNormalNotify: null == isAllowedNormalNotify
          ? _value.isAllowedNormalNotify
          : isAllowedNormalNotify // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NotifySettingImpl implements _NotifySetting {
  const _$NotifySettingImpl(
      {@JsonKey(name: 'is_allowed_admin_notify')
      required this.isAllowedAdminNotify,
      @JsonKey(name: 'is_allowed_normal_notify')
      required this.isAllowedNormalNotify});

  factory _$NotifySettingImpl.fromJson(Map<String, dynamic> json) =>
      _$$NotifySettingImplFromJson(json);

  @override
  @JsonKey(name: 'is_allowed_admin_notify')
  final bool isAllowedAdminNotify;
  @override
  @JsonKey(name: 'is_allowed_normal_notify')
  final bool isAllowedNormalNotify;

  @override
  String toString() {
    return 'NotifySetting(isAllowedAdminNotify: $isAllowedAdminNotify, isAllowedNormalNotify: $isAllowedNormalNotify)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NotifySettingImpl &&
            (identical(other.isAllowedAdminNotify, isAllowedAdminNotify) ||
                other.isAllowedAdminNotify == isAllowedAdminNotify) &&
            (identical(other.isAllowedNormalNotify, isAllowedNormalNotify) ||
                other.isAllowedNormalNotify == isAllowedNormalNotify));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, isAllowedAdminNotify, isAllowedNormalNotify);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NotifySettingImplCopyWith<_$NotifySettingImpl> get copyWith =>
      __$$NotifySettingImplCopyWithImpl<_$NotifySettingImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NotifySettingImplToJson(
      this,
    );
  }
}

abstract class _NotifySetting implements NotifySetting {
  const factory _NotifySetting(
      {@JsonKey(name: 'is_allowed_admin_notify')
      required final bool isAllowedAdminNotify,
      @JsonKey(name: 'is_allowed_normal_notify')
      required final bool isAllowedNormalNotify}) = _$NotifySettingImpl;

  factory _NotifySetting.fromJson(Map<String, dynamic> json) =
      _$NotifySettingImpl.fromJson;

  @override
  @JsonKey(name: 'is_allowed_admin_notify')
  bool get isAllowedAdminNotify;
  @override
  @JsonKey(name: 'is_allowed_normal_notify')
  bool get isAllowedNormalNotify;
  @override
  @JsonKey(ignore: true)
  _$$NotifySettingImplCopyWith<_$NotifySettingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
