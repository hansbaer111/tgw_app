// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workout_set_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WorkoutSetModelImpl _$$WorkoutSetModelImplFromJson(
        Map<String, dynamic> json) =>
    _$WorkoutSetModelImpl(
      setNumber: (json['setNumber'] as num).toInt(),
      reps: (json['reps'] as num).toInt(),
      weight: (json['weight'] as num).toDouble(),
      rpe: json['rpe'] as String?,
      notes: json['notes'] as String?,
      isCompleted: json['isCompleted'] as bool? ?? false,
    );

Map<String, dynamic> _$$WorkoutSetModelImplToJson(
        _$WorkoutSetModelImpl instance) =>
    <String, dynamic>{
      'setNumber': instance.setNumber,
      'reps': instance.reps,
      'weight': instance.weight,
      'rpe': instance.rpe,
      'notes': instance.notes,
      'isCompleted': instance.isCompleted,
    };
