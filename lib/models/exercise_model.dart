import 'package:freezed_annotation/freezed_annotation.dart';
import 'admin_attributes_model.dart'; // Import for ExerciseModifier

part 'exercise_model.freezed.dart';
part 'exercise_model.g.dart';

@freezed
class ExerciseModel with _$ExerciseModel {
  const factory ExerciseModel({
    required String id,
    required String name,
    required String description,
    required String ownerId, // Added ownerId
    required ExerciseTags tags, // Changed to single ExerciseTags object
    required List<ExerciseModifier> modifiers, // Added modifiers
    String? videoUrl,
  }) = _ExerciseModel;

  factory ExerciseModel.fromJson(Map<String, dynamic> json) => _$ExerciseModelFromJson(json);
}

@freezed
class ExerciseTags with _$ExerciseTags {
  const factory ExerciseTags({
    @Default([]) List<String> equipment,
    @Default([]) List<String> primaryMuscle,
    @Default([]) List<String> secondaryMuscles,
    @Default([]) List<String> movementPattern,
  }) = _ExerciseTags;

  factory ExerciseTags.fromJson(Map<String, dynamic> json) => _$ExerciseTagsFromJson(json);
}