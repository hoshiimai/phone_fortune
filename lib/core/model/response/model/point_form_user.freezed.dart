// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'point_form_user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PointFormUser _$PointFormUserFromJson(Map<String, dynamic> json) {
  return _PointFormUser.fromJson(json);
}

/// @nodoc
mixin _$PointFormUser {
  int get amount => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PointFormUserCopyWith<PointFormUser> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PointFormUserCopyWith<$Res> {
  factory $PointFormUserCopyWith(
          PointFormUser value, $Res Function(PointFormUser) then) =
      _$PointFormUserCopyWithImpl<$Res, PointFormUser>;
  @useResult
  $Res call({int amount, @JsonKey(name: 'created_at') DateTime createdAt});
}

/// @nodoc
class _$PointFormUserCopyWithImpl<$Res, $Val extends PointFormUser>
    implements $PointFormUserCopyWith<$Res> {
  _$PointFormUserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amount = null,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PointFormUserImplCopyWith<$Res>
    implements $PointFormUserCopyWith<$Res> {
  factory _$$PointFormUserImplCopyWith(
          _$PointFormUserImpl value, $Res Function(_$PointFormUserImpl) then) =
      __$$PointFormUserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int amount, @JsonKey(name: 'created_at') DateTime createdAt});
}

/// @nodoc
class __$$PointFormUserImplCopyWithImpl<$Res>
    extends _$PointFormUserCopyWithImpl<$Res, _$PointFormUserImpl>
    implements _$$PointFormUserImplCopyWith<$Res> {
  __$$PointFormUserImplCopyWithImpl(
      _$PointFormUserImpl _value, $Res Function(_$PointFormUserImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amount = null,
    Object? createdAt = null,
  }) {
    return _then(_$PointFormUserImpl(
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PointFormUserImpl implements _PointFormUser {
  const _$PointFormUserImpl(
      {required this.amount,
      @JsonKey(name: 'created_at') required this.createdAt});

  factory _$PointFormUserImpl.fromJson(Map<String, dynamic> json) =>
      _$$PointFormUserImplFromJson(json);

  @override
  final int amount;
  @override
  @JsonKey(name: 'created_at')
  final DateTime createdAt;

  @override
  String toString() {
    return 'PointFormUser(amount: $amount, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PointFormUserImpl &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, amount, createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PointFormUserImplCopyWith<_$PointFormUserImpl> get copyWith =>
      __$$PointFormUserImplCopyWithImpl<_$PointFormUserImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PointFormUserImplToJson(
      this,
    );
  }
}

abstract class _PointFormUser implements PointFormUser {
  const factory _PointFormUser(
          {required final int amount,
          @JsonKey(name: 'created_at') required final DateTime createdAt}) =
      _$PointFormUserImpl;

  factory _PointFormUser.fromJson(Map<String, dynamic> json) =
      _$PointFormUserImpl.fromJson;

  @override
  int get amount;
  @override
  @JsonKey(name: 'created_at')
  DateTime get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$PointFormUserImplCopyWith<_$PointFormUserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
