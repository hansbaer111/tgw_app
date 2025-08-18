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
      dayId: json['dayId'] as String,
      exerciseId: json['exerciseId'] as String,
      date: DateTime.parse(json['date'] as String),
      sets: (json['sets'] as List<dynamic>)
          .map((e) => WorkoutSetModel.fromJson(e as Map<String, dynamic>))
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
      'dayId': instance.dayId,
      'exerciseId': instance.exerciseId,
      'date': instance.date.toIso8601String(),
      'sets': instance.sets,
      'notes': instance.notes,
      'editHistory': instance.editHistory,
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
