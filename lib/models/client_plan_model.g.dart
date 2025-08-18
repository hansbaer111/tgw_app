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
      templateId: json['templateId'] as String,
      startDate: DateTime.parse(json['startDate'] as String),
      endDate: DateTime.parse(json['endDate'] as String),
    );

Map<String, dynamic> _$$ClientPlanModelImplToJson(
        _$ClientPlanModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'clientId': instance.clientId,
      'templateId': instance.templateId,
      'startDate': instance.startDate.toIso8601String(),
      'endDate': instance.endDate.toIso8601String(),
    };
