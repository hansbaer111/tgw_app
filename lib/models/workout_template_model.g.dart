// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workout_template_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WorkoutTemplateModelImpl _$$WorkoutTemplateModelImplFromJson(
        Map<String, dynamic> json) =>
    _$WorkoutTemplateModelImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      days: (json['days'] as List<dynamic>)
          .map((e) => DayModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$WorkoutTemplateModelImplToJson(
        _$WorkoutTemplateModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'days': instance.days,
    };
