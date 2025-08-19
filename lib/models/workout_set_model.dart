import 'package:freezed_annotation/freezed_annotation.dart';

part 'workout_set_model.freezed.dart';
part 'workout_set_model.g.dart';

@freezed
class WorkoutSetModel with _$WorkoutSetModel {
  const factory WorkoutSetModel({
    required int setNumber,
    required int reps, // Changed to int
    required double weight, // Added weight
    String? rpe, // Made optional
    String? notes,
    @Default(false) bool isCompleted, // Added isCompleted
  }) = _WorkoutSetModel;

  factory WorkoutSetModel.fromJson(Map<String, dynamic> json) => _$WorkoutSetModelFromJson(json);
}