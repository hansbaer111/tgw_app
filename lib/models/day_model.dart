import 'package:freezed_annotation/freezed_annotation.dart';
import 'exercise_in_plan_model.dart';

part 'day_model.freezed.dart';
part 'day_model.g.dart';

@freezed
class DayModel with _$DayModel {
  const factory DayModel({
    required String name,
    required List<ExerciseInPlanModel> exercises,
  }) = _DayModel;

  factory DayModel.fromJson(Map<String, dynamic> json) => _$DayModelFromJson(json);
}