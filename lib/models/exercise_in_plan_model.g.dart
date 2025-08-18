// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exercise_in_plan_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ExerciseInPlanModelImpl _$$ExerciseInPlanModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ExerciseInPlanModelImpl(
      exerciseId: json['exerciseId'] as String,
      sets: (json['sets'] as List<dynamic>)
          .map((e) => WorkoutSetModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      notes: json['notes'] as String?,
    );

Map<String, dynamic> _$$ExerciseInPlanModelImplToJson(
        _$ExerciseInPlanModelImpl instance) =>
    <String, dynamic>{
      'exerciseId': instance.exerciseId,
      'sets': instance.sets,
      'notes': instance.notes,
    };
