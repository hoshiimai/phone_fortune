import 'package:json_annotation/json_annotation.dart';

part 'search_creator_request.g.dart';

@JsonSerializable()
class SearchCreatorRequest {
  @JsonKey(name: 'key')
  final String key;

  SearchCreatorRequest({required this.key});

  factory SearchCreatorRequest.fromJson(Map<String, dynamic> json) => _$SearchCreatorRequestFromJson(json);
  Map<String, dynamic> toJson() => _$SearchCreatorRequestToJson(this);
}