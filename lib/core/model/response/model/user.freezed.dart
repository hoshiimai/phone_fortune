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
  @JsonKey(name: 'fullname')
  String? get fullName => throw _privateConstructorUsedError;
  @JsonKey(name: 'name_kata')
  String? get nameKata => throw _privateConstructorUsedError;
  @JsonKey(name: 'birthdate')
  String? get birthdate => throw _privateConstructorUsedError;
  @JsonKey(name: 'tel')
  String? get tel => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_online', defaultValue: false)
  bool get isOnline => throw _privateConstructorUsedError;
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
  @JsonKey(name: 'avatar_img_id')
  int? get avatarImgId => throw _privateConstructorUsedError;
  @JsonKey(name: 'cover_img_id')
  int? get coverImgId => throw _privateConstructorUsedError;
  @JsonKey(name: 'average_rating')
  double? get averageRating => throw _privateConstructorUsedError;
  @JsonKey(name: 'creator_room')
  List<dynamic>? get creatorRoom => throw _privateConstructorUsedError;
  @JsonKey(name: 'rank')
  int? get rank => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_point', defaultValue: 0)
  int? get totalPoint => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_rating', defaultValue: 0)
  int? get totalRating => throw _privateConstructorUsedError;
  @JsonKey(name: 'status', includeFromJson: true)
  @StatusConverter()
  Status? get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'waiting_count', defaultValue: 0)
  int? get waitingCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'time_waiting', defaultValue: 0)
  int? get timeWaiting => throw _privateConstructorUsedError;
  @JsonKey(name: 'url')
  String? get refUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'lang')
  String? get lang => throw _privateConstructorUsedError;
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
  @JsonKey(name: 'user_room', defaultValue: [], includeFromJson: true)
  List<HistoryCall>? get historyCall => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_calling', includeFromJson: true, defaultValue: true)
  @IsCallingConverter()
  bool get isCalling => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_time', defaultValue: 0)
  int? get totalCallTime => throw _privateConstructorUsedError;

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
      @JsonKey(name: 'fullname') String? fullName,
      @JsonKey(name: 'name_kata') String? nameKata,
      @JsonKey(name: 'birthdate') String? birthdate,
      @JsonKey(name: 'tel') String? tel,
      @JsonKey(name: 'is_online', defaultValue: false) bool isOnline,
      @JsonKey(name: 'welcome_messages') String? welcomeMessages,
      @JsonKey(name: 'evaluate_score') double? evaluateScore,
      @JsonKey(name: 'total_evaluated') int? totalEvaluated,
      @JsonKey(name: 'gender') int? gender,
      @JsonKey(name: 'point_balance') int? pointBalance,
      @JsonKey(name: 'avatar_img_id') int? avatarImgId,
      @JsonKey(name: 'cover_img_id') int? coverImgId,
      @JsonKey(name: 'average_rating') double? averageRating,
      @JsonKey(name: 'creator_room') List<dynamic>? creatorRoom,
      @JsonKey(name: 'rank') int? rank,
      @JsonKey(name: 'total_point', defaultValue: 0) int? totalPoint,
      @JsonKey(name: 'total_rating', defaultValue: 0) int? totalRating,
      @JsonKey(name: 'status', includeFromJson: true)
      @StatusConverter()
      Status? status,
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
      @JsonKey(
          name: 'notify_setting', includeFromJson: true, includeIfNull: false)
      @CoverConverter()
      NotifySetting? notifySetting,
      bool isManagedByThisAgent,
      @JsonKey(name: 'user_room', defaultValue: [], includeFromJson: true)
      List<HistoryCall>? historyCall,
      @JsonKey(name: 'is_calling', includeFromJson: true, defaultValue: true)
      @IsCallingConverter()
      bool isCalling,
      @JsonKey(name: 'total_time', defaultValue: 0) int? totalCallTime});

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
    Object? fullName = freezed,
    Object? nameKata = freezed,
    Object? birthdate = freezed,
    Object? tel = freezed,
    Object? isOnline = null,
    Object? welcomeMessages = freezed,
    Object? evaluateScore = freezed,
    Object? totalEvaluated = freezed,
    Object? gender = freezed,
    Object? pointBalance = freezed,
    Object? avatarImgId = freezed,
    Object? coverImgId = freezed,
    Object? averageRating = freezed,
    Object? creatorRoom = freezed,
    Object? rank = freezed,
    Object? totalPoint = freezed,
    Object? totalRating = freezed,
    Object? status = freezed,
    Object? waitingCount = freezed,
    Object? timeWaiting = freezed,
    Object? refUrl = freezed,
    Object? lang = freezed,
    Object? avatar = freezed,
    Object? cover = freezed,
    Object? notifySetting = freezed,
    Object? isManagedByThisAgent = null,
    Object? historyCall = freezed,
    Object? isCalling = null,
    Object? totalCallTime = freezed,
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
      fullName: freezed == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
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
      avatarImgId: freezed == avatarImgId
          ? _value.avatarImgId
          : avatarImgId // ignore: cast_nullable_to_non_nullable
              as int?,
      coverImgId: freezed == coverImgId
          ? _value.coverImgId
          : coverImgId // ignore: cast_nullable_to_non_nullable
              as int?,
      averageRating: freezed == averageRating
          ? _value.averageRating
          : averageRating // ignore: cast_nullable_to_non_nullable
              as double?,
      creatorRoom: freezed == creatorRoom
          ? _value.creatorRoom
          : creatorRoom // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
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
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status?,
      waitingCount: freezed == waitingCount
          ? _value.waitingCount
          : waitingCount // ignore: cast_nullable_to_non_nullable
              as int?,
      timeWaiting: freezed == timeWaiting
          ? _value.timeWaiting
          : timeWaiting // ignore: cast_nullable_to_non_nullable
              as int?,
      refUrl: freezed == refUrl
          ? _value.refUrl
          : refUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      lang: freezed == lang
          ? _value.lang
          : lang // ignore: cast_nullable_to_non_nullable
              as String?,
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
      historyCall: freezed == historyCall
          ? _value.historyCall
          : historyCall // ignore: cast_nullable_to_non_nullable
              as List<HistoryCall>?,
      isCalling: null == isCalling
          ? _value.isCalling
          : isCalling // ignore: cast_nullable_to_non_nullable
              as bool,
      totalCallTime: freezed == totalCallTime
          ? _value.totalCallTime
          : totalCallTime // ignore: cast_nullable_to_non_nullable
              as int?,
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
      @JsonKey(name: 'fullname') String? fullName,
      @JsonKey(name: 'name_kata') String? nameKata,
      @JsonKey(name: 'birthdate') String? birthdate,
      @JsonKey(name: 'tel') String? tel,
      @JsonKey(name: 'is_online', defaultValue: false) bool isOnline,
      @JsonKey(name: 'welcome_messages') String? welcomeMessages,
      @JsonKey(name: 'evaluate_score') double? evaluateScore,
      @JsonKey(name: 'total_evaluated') int? totalEvaluated,
      @JsonKey(name: 'gender') int? gender,
      @JsonKey(name: 'point_balance') int? pointBalance,
      @JsonKey(name: 'avatar_img_id') int? avatarImgId,
      @JsonKey(name: 'cover_img_id') int? coverImgId,
      @JsonKey(name: 'average_rating') double? averageRating,
      @JsonKey(name: 'creator_room') List<dynamic>? creatorRoom,
      @JsonKey(name: 'rank') int? rank,
      @JsonKey(name: 'total_point', defaultValue: 0) int? totalPoint,
      @JsonKey(name: 'total_rating', defaultValue: 0) int? totalRating,
      @JsonKey(name: 'status', includeFromJson: true)
      @StatusConverter()
      Status? status,
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
      @JsonKey(
          name: 'notify_setting', includeFromJson: true, includeIfNull: false)
      @CoverConverter()
      NotifySetting? notifySetting,
      bool isManagedByThisAgent,
      @JsonKey(name: 'user_room', defaultValue: [], includeFromJson: true)
      List<HistoryCall>? historyCall,
      @JsonKey(name: 'is_calling', includeFromJson: true, defaultValue: true)
      @IsCallingConverter()
      bool isCalling,
      @JsonKey(name: 'total_time', defaultValue: 0) int? totalCallTime});

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
    Object? fullName = freezed,
    Object? nameKata = freezed,
    Object? birthdate = freezed,
    Object? tel = freezed,
    Object? isOnline = null,
    Object? welcomeMessages = freezed,
    Object? evaluateScore = freezed,
    Object? totalEvaluated = freezed,
    Object? gender = freezed,
    Object? pointBalance = freezed,
    Object? avatarImgId = freezed,
    Object? coverImgId = freezed,
    Object? averageRating = freezed,
    Object? creatorRoom = freezed,
    Object? rank = freezed,
    Object? totalPoint = freezed,
    Object? totalRating = freezed,
    Object? status = freezed,
    Object? waitingCount = freezed,
    Object? timeWaiting = freezed,
    Object? refUrl = freezed,
    Object? lang = freezed,
    Object? avatar = freezed,
    Object? cover = freezed,
    Object? notifySetting = freezed,
    Object? isManagedByThisAgent = null,
    Object? historyCall = freezed,
    Object? isCalling = null,
    Object? totalCallTime = freezed,
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
      fullName: freezed == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
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
      avatarImgId: freezed == avatarImgId
          ? _value.avatarImgId
          : avatarImgId // ignore: cast_nullable_to_non_nullable
              as int?,
      coverImgId: freezed == coverImgId
          ? _value.coverImgId
          : coverImgId // ignore: cast_nullable_to_non_nullable
              as int?,
      averageRating: freezed == averageRating
          ? _value.averageRating
          : averageRating // ignore: cast_nullable_to_non_nullable
              as double?,
      creatorRoom: freezed == creatorRoom
          ? _value._creatorRoom
          : creatorRoom // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
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
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status?,
      waitingCount: freezed == waitingCount
          ? _value.waitingCount
          : waitingCount // ignore: cast_nullable_to_non_nullable
              as int?,
      timeWaiting: freezed == timeWaiting
          ? _value.timeWaiting
          : timeWaiting // ignore: cast_nullable_to_non_nullable
              as int?,
      refUrl: freezed == refUrl
          ? _value.refUrl
          : refUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      lang: freezed == lang
          ? _value.lang
          : lang // ignore: cast_nullable_to_non_nullable
              as String?,
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
      historyCall: freezed == historyCall
          ? _value._historyCall
          : historyCall // ignore: cast_nullable_to_non_nullable
              as List<HistoryCall>?,
      isCalling: null == isCalling
          ? _value.isCalling
          : isCalling // ignore: cast_nullable_to_non_nullable
              as bool,
      totalCallTime: freezed == totalCallTime
          ? _value.totalCallTime
          : totalCallTime // ignore: cast_nullable_to_non_nullable
              as int?,
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
      @JsonKey(name: 'fullname') this.fullName,
      @JsonKey(name: 'name_kata') this.nameKata,
      @JsonKey(name: 'birthdate') this.birthdate,
      @JsonKey(name: 'tel') this.tel,
      @JsonKey(name: 'is_online', defaultValue: false) required this.isOnline,
      @JsonKey(name: 'welcome_messages') this.welcomeMessages,
      @JsonKey(name: 'evaluate_score') required this.evaluateScore,
      @JsonKey(name: 'total_evaluated') required this.totalEvaluated,
      @JsonKey(name: 'gender') required this.gender,
      @JsonKey(name: 'point_balance') this.pointBalance,
      @JsonKey(name: 'avatar_img_id') this.avatarImgId,
      @JsonKey(name: 'cover_img_id') this.coverImgId,
      @JsonKey(name: 'average_rating') this.averageRating,
      @JsonKey(name: 'creator_room') final List<dynamic>? creatorRoom,
      @JsonKey(name: 'rank') this.rank,
      @JsonKey(name: 'total_point', defaultValue: 0) this.totalPoint,
      @JsonKey(name: 'total_rating', defaultValue: 0) this.totalRating,
      @JsonKey(name: 'status', includeFromJson: true)
      @StatusConverter()
      this.status,
      @JsonKey(name: 'waiting_count', defaultValue: 0) this.waitingCount,
      @JsonKey(name: 'time_waiting', defaultValue: 0) this.timeWaiting,
      @JsonKey(name: 'url') this.refUrl,
      @JsonKey(name: 'lang') this.lang,
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
      this.isManagedByThisAgent = false,
      @JsonKey(name: 'user_room', defaultValue: [], includeFromJson: true)
      final List<HistoryCall>? historyCall,
      @JsonKey(name: 'is_calling', includeFromJson: true, defaultValue: true)
      @IsCallingConverter()
      required this.isCalling,
      @JsonKey(name: 'total_time', defaultValue: 0) this.totalCallTime})
      : _creatorRoom = creatorRoom,
        _historyCall = historyCall;

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
  @JsonKey(name: 'fullname')
  final String? fullName;
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
  @JsonKey(name: 'avatar_img_id')
  final int? avatarImgId;
  @override
  @JsonKey(name: 'cover_img_id')
  final int? coverImgId;
  @override
  @JsonKey(name: 'average_rating')
  final double? averageRating;
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
  @JsonKey(name: 'status', includeFromJson: true)
  @StatusConverter()
  final Status? status;
  @override
  @JsonKey(name: 'waiting_count', defaultValue: 0)
  final int? waitingCount;
  @override
  @JsonKey(name: 'time_waiting', defaultValue: 0)
  final int? timeWaiting;
  @override
  @JsonKey(name: 'url')
  final String? refUrl;
  @override
  @JsonKey(name: 'lang')
  final String? lang;
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
  final List<HistoryCall>? _historyCall;
  @override
  @JsonKey(name: 'user_room', defaultValue: [], includeFromJson: true)
  List<HistoryCall>? get historyCall {
    final value = _historyCall;
    if (value == null) return null;
    if (_historyCall is EqualUnmodifiableListView) return _historyCall;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'is_calling', includeFromJson: true, defaultValue: true)
  @IsCallingConverter()
  final bool isCalling;
  @override
  @JsonKey(name: 'total_time', defaultValue: 0)
  final int? totalCallTime;

  @override
  String toString() {
    return 'User(id: $id, snsId: $snsId, email: $email, authenCode: $authenCode, role: $role, nickname: $nickname, fullName: $fullName, nameKata: $nameKata, birthdate: $birthdate, tel: $tel, isOnline: $isOnline, welcomeMessages: $welcomeMessages, evaluateScore: $evaluateScore, totalEvaluated: $totalEvaluated, gender: $gender, pointBalance: $pointBalance, avatarImgId: $avatarImgId, coverImgId: $coverImgId, averageRating: $averageRating, creatorRoom: $creatorRoom, rank: $rank, totalPoint: $totalPoint, totalRating: $totalRating, status: $status, waitingCount: $waitingCount, timeWaiting: $timeWaiting, refUrl: $refUrl, lang: $lang, avatar: $avatar, cover: $cover, notifySetting: $notifySetting, isManagedByThisAgent: $isManagedByThisAgent, historyCall: $historyCall, isCalling: $isCalling, totalCallTime: $totalCallTime)';
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
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.nameKata, nameKata) ||
                other.nameKata == nameKata) &&
            (identical(other.birthdate, birthdate) ||
                other.birthdate == birthdate) &&
            (identical(other.tel, tel) || other.tel == tel) &&
            (identical(other.isOnline, isOnline) ||
                other.isOnline == isOnline) &&
            (identical(other.welcomeMessages, welcomeMessages) ||
                other.welcomeMessages == welcomeMessages) &&
            (identical(other.evaluateScore, evaluateScore) ||
                other.evaluateScore == evaluateScore) &&
            (identical(other.totalEvaluated, totalEvaluated) ||
                other.totalEvaluated == totalEvaluated) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.pointBalance, pointBalance) ||
                other.pointBalance == pointBalance) &&
            (identical(other.avatarImgId, avatarImgId) ||
                other.avatarImgId == avatarImgId) &&
            (identical(other.coverImgId, coverImgId) ||
                other.coverImgId == coverImgId) &&
            (identical(other.averageRating, averageRating) ||
                other.averageRating == averageRating) &&
            const DeepCollectionEquality()
                .equals(other._creatorRoom, _creatorRoom) &&
            (identical(other.rank, rank) || other.rank == rank) &&
            (identical(other.totalPoint, totalPoint) ||
                other.totalPoint == totalPoint) &&
            (identical(other.totalRating, totalRating) ||
                other.totalRating == totalRating) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.waitingCount, waitingCount) ||
                other.waitingCount == waitingCount) &&
            (identical(other.timeWaiting, timeWaiting) ||
                other.timeWaiting == timeWaiting) &&
            (identical(other.refUrl, refUrl) || other.refUrl == refUrl) &&
            (identical(other.lang, lang) || other.lang == lang) &&
            (identical(other.avatar, avatar) || other.avatar == avatar) &&
            (identical(other.cover, cover) || other.cover == cover) &&
            (identical(other.notifySetting, notifySetting) ||
                other.notifySetting == notifySetting) &&
            (identical(other.isManagedByThisAgent, isManagedByThisAgent) ||
                other.isManagedByThisAgent == isManagedByThisAgent) &&
            const DeepCollectionEquality()
                .equals(other._historyCall, _historyCall) &&
            (identical(other.isCalling, isCalling) ||
                other.isCalling == isCalling) &&
            (identical(other.totalCallTime, totalCallTime) ||
                other.totalCallTime == totalCallTime));
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
        fullName,
        nameKata,
        birthdate,
        tel,
        isOnline,
        welcomeMessages,
        evaluateScore,
        totalEvaluated,
        gender,
        pointBalance,
        avatarImgId,
        coverImgId,
        averageRating,
        const DeepCollectionEquality().hash(_creatorRoom),
        rank,
        totalPoint,
        totalRating,
        status,
        waitingCount,
        timeWaiting,
        refUrl,
        lang,
        avatar,
        cover,
        notifySetting,
        isManagedByThisAgent,
        const DeepCollectionEquality().hash(_historyCall),
        isCalling,
        totalCallTime
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
      @JsonKey(name: 'fullname') final String? fullName,
      @JsonKey(name: 'name_kata') final String? nameKata,
      @JsonKey(name: 'birthdate') final String? birthdate,
      @JsonKey(name: 'tel') final String? tel,
      @JsonKey(name: 'is_online', defaultValue: false)
      required final bool isOnline,
      @JsonKey(name: 'welcome_messages') final String? welcomeMessages,
      @JsonKey(name: 'evaluate_score') required final double? evaluateScore,
      @JsonKey(name: 'total_evaluated') required final int? totalEvaluated,
      @JsonKey(name: 'gender') required final int? gender,
      @JsonKey(name: 'point_balance') final int? pointBalance,
      @JsonKey(name: 'avatar_img_id') final int? avatarImgId,
      @JsonKey(name: 'cover_img_id') final int? coverImgId,
      @JsonKey(name: 'average_rating') final double? averageRating,
      @JsonKey(name: 'creator_room') final List<dynamic>? creatorRoom,
      @JsonKey(name: 'rank') final int? rank,
      @JsonKey(name: 'total_point', defaultValue: 0) final int? totalPoint,
      @JsonKey(name: 'total_rating', defaultValue: 0) final int? totalRating,
      @JsonKey(name: 'status', includeFromJson: true)
      @StatusConverter()
      final Status? status,
      @JsonKey(name: 'waiting_count', defaultValue: 0) final int? waitingCount,
      @JsonKey(name: 'time_waiting', defaultValue: 0) final int? timeWaiting,
      @JsonKey(name: 'url') final String? refUrl,
      @JsonKey(name: 'lang') final String? lang,
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
      final bool isManagedByThisAgent,
      @JsonKey(name: 'user_room', defaultValue: [], includeFromJson: true)
      final List<HistoryCall>? historyCall,
      @JsonKey(name: 'is_calling', includeFromJson: true, defaultValue: true)
      @IsCallingConverter()
      required final bool isCalling,
      @JsonKey(name: 'total_time', defaultValue: 0)
      final int? totalCallTime}) = _$UserImpl;

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
  @JsonKey(name: 'fullname')
  String? get fullName;
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
  @JsonKey(name: 'avatar_img_id')
  int? get avatarImgId;
  @override
  @JsonKey(name: 'cover_img_id')
  int? get coverImgId;
  @override
  @JsonKey(name: 'average_rating')
  double? get averageRating;
  @override
  @JsonKey(name: 'creator_room')
  List<dynamic>? get creatorRoom;
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
  @JsonKey(name: 'status', includeFromJson: true)
  @StatusConverter()
  Status? get status;
  @override
  @JsonKey(name: 'waiting_count', defaultValue: 0)
  int? get waitingCount;
  @override
  @JsonKey(name: 'time_waiting', defaultValue: 0)
  int? get timeWaiting;
  @override
  @JsonKey(name: 'url')
  String? get refUrl;
  @override
  @JsonKey(name: 'lang')
  String? get lang;
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
  @JsonKey(name: 'user_room', defaultValue: [], includeFromJson: true)
  List<HistoryCall>? get historyCall;
  @override
  @JsonKey(name: 'is_calling', includeFromJson: true, defaultValue: true)
  @IsCallingConverter()
  bool get isCalling;
  @override
  @JsonKey(name: 'total_time', defaultValue: 0)
  int? get totalCallTime;
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
