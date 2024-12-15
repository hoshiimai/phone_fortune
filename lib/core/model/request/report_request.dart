import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class ReportRequest {
  @JsonKey(name: 'reportUserId')
  final int reportUserId;
  @JsonKey(name: 'description')
  final String? description;

  ReportRequest({required this.reportUserId, this.description});

  Map<String, dynamic> toJson() {
    return {
      'reportUserId': reportUserId,
      'description': description,
    };
  }
}
