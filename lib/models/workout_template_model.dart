import 'package:freezed_annotation/freezed_annotation.dart';
import 'day_model.dart';

part 'workout_template_model.freezed.dart';
part 'workout_template_model.g.dart';

@freezed
class WorkoutTemplateModel with _$WorkoutTemplateModel {
  const factory WorkoutTemplateModel({
    required String id,
    required String name,
    required String description,
    required List<DayModel> days,
  }) = _WorkoutTemplateModel;

  factory WorkoutTemplateModel.fromJson(Map<String, dynamic> json) => _$WorkoutTemplateModelFromJson(json);
}