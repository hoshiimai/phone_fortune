import 'package:freezed_annotation/freezed_annotation.dart';

part 'point_form_user.freezed.dart';
part 'point_form_user.g.dart';

@freezed
class PointFormUser with _$PointFormUser {
  const factory PointFormUser({
    required int amount,
    @JsonKey(name: 'created_at') required DateTime createdAt,
  }) = _PointFormUser;

  factory PointFormUser.fromJson(Map<String, dynamic> json) => _$PointFormUserFromJson(json);
}
