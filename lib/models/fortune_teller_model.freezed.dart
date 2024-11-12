// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'fortune_teller_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FortuneTellerModel _$FortuneTellerModelFromJson(Map<String, dynamic> json) {
  return _FortuneTellerModel.fromJson(json);
}

/// @nodoc
mixin _$FortuneTellerModel {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get specialty => throw _privateConstructorUsedError;
  String get profile => throw _privateConstructorUsedError;
  String get imageUrl => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;

  /// Serializes this FortuneTellerModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FortuneTellerModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FortuneTellerModelCopyWith<FortuneTellerModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FortuneTellerModelCopyWith<$Res> {
  factory $FortuneTellerModelCopyWith(
          FortuneTellerModel value, $Res Function(FortuneTellerModel) then) =
      _$FortuneTellerModelCopyWithImpl<$Res, FortuneTellerModel>;
  @useResult
  $Res call(
      {String id,
      String name,
      String specialty,
      String profile,
      String imageUrl,
      String status});
}

/// @nodoc
class _$FortuneTellerModelCopyWithImpl<$Res, $Val extends FortuneTellerModel>
    implements $FortuneTellerModelCopyWith<$Res> {
  _$FortuneTellerModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FortuneTellerModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? specialty = null,
    Object? profile = null,
    Object? imageUrl = null,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      specialty: null == specialty
          ? _value.specialty
          : specialty // ignore: cast_nullable_to_non_nullable
              as String,
      profile: null == profile
          ? _value.profile
          : profile // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FortuneTellerModelImplCopyWith<$Res>
    implements $FortuneTellerModelCopyWith<$Res> {
  factory _$$FortuneTellerModelImplCopyWith(_$FortuneTellerModelImpl value,
          $Res Function(_$FortuneTellerModelImpl) then) =
      __$$FortuneTellerModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String specialty,
      String profile,
      String imageUrl,
      String status});
}

/// @nodoc
class __$$FortuneTellerModelImplCopyWithImpl<$Res>
    extends _$FortuneTellerModelCopyWithImpl<$Res, _$FortuneTellerModelImpl>
    implements _$$FortuneTellerModelImplCopyWith<$Res> {
  __$$FortuneTellerModelImplCopyWithImpl(_$FortuneTellerModelImpl _value,
      $Res Function(_$FortuneTellerModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of FortuneTellerModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? specialty = null,
    Object? profile = null,
    Object? imageUrl = null,
    Object? status = null,
  }) {
    return _then(_$FortuneTellerModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      specialty: null == specialty
          ? _value.specialty
          : specialty // ignore: cast_nullable_to_non_nullable
              as String,
      profile: null == profile
          ? _value.profile
          : profile // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FortuneTellerModelImpl implements _FortuneTellerModel {
  const _$FortuneTellerModelImpl(
      {this.id = 'Unknown ID',
      this.name = 'Unknown',
      this.specialty = 'Unknown Specialty',
      this.profile = 'No profile available',
      this.imageUrl = '',
      this.status = 'Unavailable'});

  factory _$FortuneTellerModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$FortuneTellerModelImplFromJson(json);

  @override
  @JsonKey()
  final String id;
  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final String specialty;
  @override
  @JsonKey()
  final String profile;
  @override
  @JsonKey()
  final String imageUrl;
  @override
  @JsonKey()
  final String status;

  @override
  String toString() {
    return 'FortuneTellerModel(id: $id, name: $name, specialty: $specialty, profile: $profile, imageUrl: $imageUrl, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FortuneTellerModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.specialty, specialty) ||
                other.specialty == specialty) &&
            (identical(other.profile, profile) || other.profile == profile) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, specialty, profile, imageUrl, status);

  /// Create a copy of FortuneTellerModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FortuneTellerModelImplCopyWith<_$FortuneTellerModelImpl> get copyWith =>
      __$$FortuneTellerModelImplCopyWithImpl<_$FortuneTellerModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FortuneTellerModelImplToJson(
      this,
    );
  }
}

abstract class _FortuneTellerModel implements FortuneTellerModel {
  const factory _FortuneTellerModel(
      {final String id,
      final String name,
      final String specialty,
      final String profile,
      final String imageUrl,
      final String status}) = _$FortuneTellerModelImpl;

  factory _FortuneTellerModel.fromJson(Map<String, dynamic> json) =
      _$FortuneTellerModelImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get specialty;
  @override
  String get profile;
  @override
  String get imageUrl;
  @override
  String get status;

  /// Create a copy of FortuneTellerModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FortuneTellerModelImplCopyWith<_$FortuneTellerModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
