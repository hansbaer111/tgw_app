import 'package:freezed_annotation/freezed_annotation.dart';

part 'client_plan_model.freezed.dart';
part 'client_plan_model.g.dart';

@freezed
class ClientPlanModel with _$ClientPlanModel {
  const factory ClientPlanModel({
    required String id,
    required String clientId,
    required String templateId,
    required DateTime startDate,
    required DateTime endDate,
  }) = _ClientPlanModel;

  factory ClientPlanModel.fromJson(Map<String, dynamic> json) => _$ClientPlanModelFromJson(json);
}