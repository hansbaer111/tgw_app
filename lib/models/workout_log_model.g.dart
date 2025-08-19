// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workout_log_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WorkoutLogModelImpl _$$WorkoutLogModelImplFromJson(
        Map<String, dynamic> json) =>
    _$WorkoutLogModelImpl(
      id: json['id'] as String,
      userId: json['userId'] as String,
      dayName: json['dayName'] as String,
      date: DateTime.parse(json['date'] as String),
      exercises: (json['exercises'] as List<dynamic>)
          .map((e) => PerformedExercise.fromJson(e as Map<String, dynamic>))
          .toList(),
      notes: json['notes'] as String?,
      editHistory: (json['editHistory'] as List<dynamic>?)
          ?.map((e) => EditHistoryEntry.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$WorkoutLogModelImplToJson(
        _$WorkoutLogModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'dayName': instance.dayName,
      'date': instance.date.toIso8601String(),
      'exercises': instance.exercises,
      'notes': instance.notes,
      'editHistory': instance.editHistory,
    };

_$PerformedExerciseImpl _$$PerformedExerciseImplFromJson(
        Map<String, dynamic> json) =>
    _$PerformedExerciseImpl(
      exerciseId: json['exerciseId'] as String,
      sets: (json['sets'] as List<dynamic>)
          .map((e) => WorkoutSetModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$PerformedExerciseImplToJson(
        _$PerformedExerciseImpl instance) =>
    <String, dynamic>{
      'exerciseId': instance.exerciseId,
      'sets': instance.sets,
    };

_$EditHistoryEntryImpl _$$EditHistoryEntryImplFromJson(
        Map<String, dynamic> json) =>
    _$EditHistoryEntryImpl(
      timestamp: DateTime.parse(json['timestamp'] as String),
      editorId: json['editorId'] as String,
      reason: json['reason'] as String,
    );

Map<String, dynamic> _$$EditHistoryEntryImplToJson(
        _$EditHistoryEntryImpl instance) =>
    <String, dynamic>{
      'timestamp': instance.timestamp.toIso8601String(),
      'editorId': instance.editorId,
      'reason': instance.reason,
    };
