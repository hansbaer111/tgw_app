// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client_plan_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ClientPlanModelImpl _$$ClientPlanModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ClientPlanModelImpl(
      id: json['id'] as String,
      clientId: json['clientId'] as String,
      trainerId: json['trainerId'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      startDate: DateTime.parse(json['startDate'] as String),
      endDate: DateTime.parse(json['endDate'] as String),
      days: (json['days'] as List<dynamic>)
          .map((e) => DayModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      isActive: json['isActive'] as bool,
    );

Map<String, dynamic> _$$ClientPlanModelImplToJson(
        _$ClientPlanModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'clientId': instance.clientId,
      'trainerId': instance.trainerId,
      'name': instance.name,
      'description': instance.description,
      'startDate': instance.startDate.toIso8601String(),
      'endDate': instance.endDate.toIso8601String(),
      'days': instance.days,
      'isActive': instance.isActive,
    };
