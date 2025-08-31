import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:test_app/models/admin_attributes_model.dart'; // Import ExerciseModifier

part 'exercise_model.freezed.dart';
part 'exercise_model.g.dart';

@freezed
class ExerciseModel with _$ExerciseModel {
  const factory ExerciseModel({
    required String exerciseId,
    required String baseExerciseId,
    required String name,
    String? description, // Added back
    String? videoUrl,
    required String ownerId,
    required ExerciseTags tags,
    List<ExerciseModifier>? modifiers, // Added back
  }) = _ExerciseModel;

  factory ExerciseModel.fromJson(Map<String, dynamic> json) => _$ExerciseModelFromJson(json);
}

@freezed
class ExerciseTags with _$ExerciseTags {
  const factory ExerciseTags({
    required String equipment, // Changed to String
    required String movementPattern, // Changed to String
    required String primaryMuscle, // Changed to String
    List<String>? secondaryMuscles,
  }) = _ExerciseTags;

  factory ExerciseTags.fromJson(Map<String, dynamic> json) => _$ExerciseTagsFromJson(json);
}