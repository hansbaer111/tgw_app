// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workout_set_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WorkoutSetModelImpl _$$WorkoutSetModelImplFromJson(
        Map<String, dynamic> json) =>
    _$WorkoutSetModelImpl(
      setNumber: (json['setNumber'] as num).toInt(),
      reps: json['reps'] as String,
      rpe: json['rpe'] as String,
      notes: json['notes'] as String?,
    );

Map<String, dynamic> _$$WorkoutSetModelImplToJson(
        _$WorkoutSetModelImpl instance) =>
    <String, dynamic>{
      'setNumber': instance.setNumber,
      'reps': instance.reps,
      'rpe': instance.rpe,
      'notes': instance.notes,
    };
