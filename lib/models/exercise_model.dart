import 'package:freezed_annotation/freezed_annotation.dart';

part 'exercise_model.freezed.dart';
part 'exercise_model.g.dart';

@freezed
class ExerciseModel with _$ExerciseModel {
  const factory ExerciseModel({
    required String id,
    required String name,
    required String description,
    required List<String> muscleGroups,
    required List<String> equipment,
    required String movementPattern,
    required List<ExerciseTags> tags,
    String? videoUrl,
  }) = _ExerciseModel;

  factory ExerciseModel.fromJson(Map<String, dynamic> json) => _$ExerciseModelFromJson(json);
}

@freezed
class ExerciseTags with _$ExerciseTags {
  const factory ExerciseTags({
    required String name,
    required String value,
  }) = _ExerciseTags;

  factory ExerciseTags.fromJson(Map<String, dynamic> json) => _$ExerciseTagsFromJson(json);
}