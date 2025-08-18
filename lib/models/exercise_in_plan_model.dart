import 'package:freezed_annotation/freezed_annotation.dart';
import 'workout_set_model.dart';

part 'exercise_in_plan_model.freezed.dart';
part 'exercise_in_plan_model.g.dart';

@freezed
class ExerciseInPlanModel with _$ExerciseInPlanModel {
  const factory ExerciseInPlanModel({
    required String exerciseId,
    required List<WorkoutSetModel> sets,
    String? notes,
  }) = _ExerciseInPlanModel;

  factory ExerciseInPlanModel.fromJson(Map<String, dynamic> json) => _$ExerciseInPlanModelFromJson(json);
}