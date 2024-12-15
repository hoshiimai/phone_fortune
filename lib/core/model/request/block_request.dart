import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class BlockRequest {
  @JsonKey(name: 'blockUserId')
  final int blockUserId;

  BlockRequest({required this.blockUserId});

  Map<String, dynamic> toJson() {
    return {
      'blockUserId': blockUserId,
    };
  }
}