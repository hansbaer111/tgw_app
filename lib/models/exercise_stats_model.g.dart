// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exercise_stats_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ExerciseStatsImpl _$$ExerciseStatsImplFromJson(Map<String, dynamic> json) =>
    _$ExerciseStatsImpl(
      exerciseId: json['exerciseId'] as String,
      maxWeight: (json['maxWeight'] as num).toDouble(),
      totalVolume: (json['totalVolume'] as num).toDouble(),
      totalReps: (json['totalReps'] as num).toInt(),
      totalSets: (json['totalSets'] as num).toInt(),
    );

Map<String, dynamic> _$$ExerciseStatsImplToJson(_$ExerciseStatsImpl instance) =>
    <String, dynamic>{
      'exerciseId': instance.exerciseId,
      'maxWeight': instance.maxWeight,
      'totalVolume': instance.totalVolume,
      'totalReps': instance.totalReps,
      'totalSets': instance.totalSets,
    };
