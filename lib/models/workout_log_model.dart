import 'package:freezed_annotation/freezed_annotation.dart';
import 'workout_set_model.dart';

part 'workout_log_model.freezed.dart';
part 'workout_log_model.g.dart';

@freezed
class WorkoutLogModel with _$WorkoutLogModel {
  const factory WorkoutLogModel({
    required String id,
    required String userId,
    required String dayId,
    required String exerciseId,
    required DateTime date,
    required List<WorkoutSetModel> sets,
    String? notes,
    List<EditHistoryEntry>? editHistory,
  }) = _WorkoutLogModel;

  factory WorkoutLogModel.fromJson(Map<String, dynamic> json) => _$WorkoutLogModelFromJson(json);
}

@freezed
class EditHistoryEntry with _$EditHistoryEntry {
  const factory EditHistoryEntry({
    required DateTime timestamp,
    required String editorId,
    required String reason,
  }) = _EditHistoryEntry;

  factory EditHistoryEntry.fromJson(Map<String, dynamic> json) => _$EditHistoryEntryFromJson(json);
}