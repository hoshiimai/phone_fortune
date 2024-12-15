import 'package:json_annotation/json_annotation.dart';

part 'change_like_response_data.g.dart';

@JsonSerializable()
class ChangeLikeResponseData {
  @JsonKey(name: 'like_count')
  final int likeCount;


  ChangeLikeResponseData(this.likeCount,);

  factory ChangeLikeResponseData.fromJson(Map<String, dynamic> json) => _$ChangeLikeResponseDataFromJson(json);
  Map<String, dynamic> toJson() => _$ChangeLikeResponseDataToJson(this);
}