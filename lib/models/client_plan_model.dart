import 'package:freezed_annotation/freezed_annotation.dart';
import 'day_model.dart'; // Import DayModel

part 'client_plan_model.freezed.dart';
part 'client_plan_model.g.dart';

@freezed
class ClientPlanModel with _$ClientPlanModel {
  const factory ClientPlanModel({
    required String id,
    required String clientId,
    required String trainerId, // Added trainerId
    required String name, // Added name
    required String description, // Added description
    required DateTime startDate,
    required DateTime endDate,
    required List<DayModel> days, // Added days
    required bool isActive, // Added isActive
  }) = _ClientPlanModel;

  factory ClientPlanModel.fromJson(Map<String, dynamic> json) => _$ClientPlanModelFromJson(json);
}