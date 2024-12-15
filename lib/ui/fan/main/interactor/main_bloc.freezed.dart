// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'main_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MainState {
  PageState get status => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;
  BottomNavigationPage get currentPage => throw _privateConstructorUsedError;
  User? get user => throw _privateConstructorUsedError;
  CreatorUpdate? get creatorUpdate => throw _privateConstructorUsedError;
  BottomNavigationPage? get popPage => throw _privateConstructorUsedError;
  PageNavigation? get pageNavigation => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MainStateCopyWith<MainState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MainStateCopyWith<$Res> {
  factory $MainStateCopyWith(MainState value, $Res Function(MainState) then) =
      _$MainStateCopyWithImpl<$Res, MainState>;
  @useResult
  $Res call(
      {PageState status,
      String? error,
      BottomNavigationPage currentPage,
      User? user,
      CreatorUpdate? creatorUpdate,
      BottomNavigationPage? popPage,
      PageNavigation? pageNavigation});

  $UserCopyWith<$Res>? get user;
}

/// @nodoc
class _$MainStateCopyWithImpl<$Res, $Val extends MainState>
    implements $MainStateCopyWith<$Res> {
  _$MainStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? error = freezed,
    Object? currentPage = null,
    Object? user = freezed,
    Object? creatorUpdate = freezed,
    Object? popPage = freezed,
    Object? pageNavigation = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as PageState,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as BottomNavigationPage,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
      creatorUpdate: freezed == creatorUpdate
          ? _value.creatorUpdate
          : creatorUpdate // ignore: cast_nullable_to_non_nullable
              as CreatorUpdate?,
      popPage: freezed == popPage
          ? _value.popPage
          : popPage // ignore: cast_nullable_to_non_nullable
              as BottomNavigationPage?,
      pageNavigation: freezed == pageNavigation
          ? _value.pageNavigation
          : pageNavigation // ignore: cast_nullable_to_non_nullable
              as PageNavigation?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $UserCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MainStateImplCopyWith<$Res>
    implements $MainStateCopyWith<$Res> {
  factory _$$MainStateImplCopyWith(
          _$MainStateImpl value, $Res Function(_$MainStateImpl) then) =
      __$$MainStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {PageState status,
      String? error,
      BottomNavigationPage currentPage,
      User? user,
      CreatorUpdate? creatorUpdate,
      BottomNavigationPage? popPage,
      PageNavigation? pageNavigation});

  @override
  $UserCopyWith<$Res>? get user;
}

/// @nodoc
class __$$MainStateImplCopyWithImpl<$Res>
    extends _$MainStateCopyWithImpl<$Res, _$MainStateImpl>
    implements _$$MainStateImplCopyWith<$Res> {
  __$$MainStateImplCopyWithImpl(
      _$MainStateImpl _value, $Res Function(_$MainStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? error = freezed,
    Object? currentPage = null,
    Object? user = freezed,
    Object? creatorUpdate = freezed,
    Object? popPage = freezed,
    Object? pageNavigation = freezed,
  }) {
    return _then(_$MainStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as PageState,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as BottomNavigationPage,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
      creatorUpdate: freezed == creatorUpdate
          ? _value.creatorUpdate
          : creatorUpdate // ignore: cast_nullable_to_non_nullable
              as CreatorUpdate?,
      popPage: freezed == popPage
          ? _value.popPage
          : popPage // ignore: cast_nullable_to_non_nullable
              as BottomNavigationPage?,
      pageNavigation: freezed == pageNavigation
          ? _value.pageNavigation
          : pageNavigation // ignore: cast_nullable_to_non_nullable
              as PageNavigation?,
    ));
  }
}

/// @nodoc

class _$MainStateImpl implements _MainState {
  const _$MainStateImpl(
      {this.status = PageState.initial,
      this.error,
      this.currentPage = BottomNavigationPage.home,
      this.user,
      this.creatorUpdate,
      this.popPage,
      this.pageNavigation});

  @override
  @JsonKey()
  final PageState status;
  @override
  final String? error;
  @override
  @JsonKey()
  final BottomNavigationPage currentPage;
  @override
  final User? user;
  @override
  final CreatorUpdate? creatorUpdate;
  @override
  final BottomNavigationPage? popPage;
  @override
  final PageNavigation? pageNavigation;

  @override
  String toString() {
    return 'MainState(status: $status, error: $error, currentPage: $currentPage, user: $user, creatorUpdate: $creatorUpdate, popPage: $popPage, pageNavigation: $pageNavigation)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MainStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.creatorUpdate, creatorUpdate) ||
                other.creatorUpdate == creatorUpdate) &&
            (identical(other.popPage, popPage) || other.popPage == popPage) &&
            (identical(other.pageNavigation, pageNavigation) ||
                other.pageNavigation == pageNavigation));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, error, currentPage, user,
      creatorUpdate, popPage, pageNavigation);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MainStateImplCopyWith<_$MainStateImpl> get copyWith =>
      __$$MainStateImplCopyWithImpl<_$MainStateImpl>(this, _$identity);
}

abstract class _MainState implements MainState {
  const factory _MainState(
      {final PageState status,
      final String? error,
      final BottomNavigationPage currentPage,
      final User? user,
      final CreatorUpdate? creatorUpdate,
      final BottomNavigationPage? popPage,
      final PageNavigation? pageNavigation}) = _$MainStateImpl;

  @override
  PageState get status;
  @override
  String? get error;
  @override
  BottomNavigationPage get currentPage;
  @override
  User? get user;
  @override
  CreatorUpdate? get creatorUpdate;
  @override
  BottomNavigationPage? get popPage;
  @override
  PageNavigation? get pageNavigation;
  @override
  @JsonKey(ignore: true)
  _$$MainStateImplCopyWith<_$MainStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
