import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'fortune_teller_model.freezed.dart';
part 'fortune_teller_model.g.dart';

@freezed
class FortuneTellerModel with _$FortuneTellerModel {
  const factory FortuneTellerModel({
    @Default('Unknown ID') String id,
    @Default('Unknown') String name,
    @Default('Unknown Specialty') String specialty,
    @Default('No profile available') String profile,
    @Default('') String imageUrl,
    @Default('Unavailable') String status,
  }) = _FortuneTellerModel;

  factory FortuneTellerModel.fromJson(Map<String, dynamic> json) => _$FortuneTellerModelFromJson(json);

  factory FortuneTellerModel.fromDocumentSnapshot(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return FortuneTellerModel(
      id: doc.id,
      name: data['name'] ?? 'Unknown',
      specialty: data['specialty'] ?? 'Unknown Specialty',
      profile: data['profile'] ?? 'No profile available',
      imageUrl: data['imageUrl'] ?? '',
      status: data['status'] ?? 'Unavailable',
    );
  }
}
