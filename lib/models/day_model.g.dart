// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'day_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DayModelImpl _$$DayModelImplFromJson(Map<String, dynamic> json) =>
    _$DayModelImpl(
      name: json['name'] as String,
      exercises: (json['exercises'] as List<dynamic>)
          .map((e) => ExerciseInPlanModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$DayModelImplToJson(_$DayModelImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'exercises': instance.exercises,
    };
