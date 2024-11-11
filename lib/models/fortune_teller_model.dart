import 'package:freezed_annotation/freezed_annotation.dart';

part 'fortune_teller_model.freezed.dart';
part 'fortune_teller_model.g.dart';

@freezed
class FortuneTellerModel with _$FortuneTellerModel {
  const factory FortuneTellerModel({
    required String id, 
    required String name,
    required String specialty,
    required String profile,
    required String imageUrl,
    required String status,
  }) = _FortuneTellerModel;

  factory FortuneTellerModel.fromJson(Map<String, dynamic> json) => _$FortuneTellerModelFromJson(json);
}
