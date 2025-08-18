import 'package:freezed_annotation/freezed_annotation.dart';

part 'exercise_stats_model.freezed.dart';
part 'exercise_stats_model.g.dart';

@freezed
class ExerciseStats with _$ExerciseStats {
  const factory ExerciseStats({
    required String exerciseId,
    required double maxWeight,
    required double totalVolume,
    required int totalReps,
    required int totalSets,
  }) = _ExerciseStats;

  factory ExerciseStats.fromJson(Map<String, dynamic> json) => _$ExerciseStatsFromJson(json);
}