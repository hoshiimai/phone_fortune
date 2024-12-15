import 'package:json_annotation/json_annotation.dart';

part 'change_favorite_request.g.dart';

@JsonSerializable()
class ChangeFavoriteRequest {
  @JsonKey(name: 'likeUserId')
  final int likeUserId;
  @JsonKey(name: 'status')
  final bool status;

  ChangeFavoriteRequest({required this.likeUserId, required this.status});

  factory ChangeFavoriteRequest.fromJson(Map<String, dynamic> json) => _$ChangeFavoriteRequestFromJson(json);
  Map<String, dynamic> toJson() => _$ChangeFavoriteRequestToJson(this);
}