// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'point_form_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PointFormUserImpl _$$PointFormUserImplFromJson(Map<String, dynamic> json) =>
    _$PointFormUserImpl(
      amount: (json['amount'] as num).toInt(),
      createdAt: DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$$PointFormUserImplToJson(_$PointFormUserImpl instance) =>
    <String, dynamic>{
      'amount': instance.amount,
      'created_at': instance.createdAt.toIso8601String(),
    };
