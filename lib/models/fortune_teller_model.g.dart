// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fortune_teller_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FortuneTellerModelImpl _$$FortuneTellerModelImplFromJson(
        Map<String, dynamic> json) =>
    _$FortuneTellerModelImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      specialty: json['specialty'] as String,
      profile: json['profile'] as String,
      imageUrl: json['imageUrl'] as String,
      status: json['status'] as String,
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
