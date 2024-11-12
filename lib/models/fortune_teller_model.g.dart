// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fortune_teller_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FortuneTellerModelImpl _$$FortuneTellerModelImplFromJson(
        Map<String, dynamic> json) =>
    _$FortuneTellerModelImpl(
      id: json['id'] as String? ?? 'Unknown ID',
      name: json['name'] as String? ?? 'Unknown',
      specialty: json['specialty'] as String? ?? 'Unknown Specialty',
      profile: json['profile'] as String? ?? 'No profile available',
      imageUrl: json['imageUrl'] as String? ?? '',
      status: json['status'] as String? ?? 'Unavailable',
    );

Map<String, dynamic> _$$FortuneTellerModelImplToJson(
        _$FortuneTellerModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'specialty': instance.specialty,
      'profile': instance.profile,
      'imageUrl': instance.imageUrl,
      'status': instance.status,
    };
