import 'package:freezed_annotation/freezed_annotation.dart';

part 'admin_attributes_model.freezed.dart';
part 'admin_attributes_model.g.dart';

@freezed
class AdminAttributesModel with _$AdminAttributesModel {
  const factory AdminAttributesModel({
    required List<EquipmentType> equipmentTypes,
    required List<String> muscleGroups,
    required List<String> movementPatterns,
    required List<ExerciseModifier> exerciseModifiers,
  }) = _AdminAttributesModel;

  factory AdminAttributesModel.fromJson(Map<String, dynamic> json) => _$AdminAttributesModelFromJson(json);
}

@freezed
class EquipmentType with _$EquipmentType {
  const factory EquipmentType({
    required String id,
    required String name,
  }) = _EquipmentType;

  factory EquipmentType.fromJson(Map<String, dynamic> json) => _$EquipmentTypeFromJson(json);
}

@freezed
class ExerciseModifier with _$ExerciseModifier {
  const factory ExerciseModifier({
    required String id,
    required String name,
    required List<ModifierParameter> parameters,
  }) = _ExerciseModifier;

  factory ExerciseModifier.fromJson(Map<String, dynamic> json) => _$ExerciseModifierFromJson(json);
}

@freezed
class ModifierParameter with _$ModifierParameter {
  const factory ModifierParameter({
    required String name,
    required String type, // e.g., 'number', 'text', 'boolean'
    dynamic defaultValue,
  }) = _ModifierParameter;

  factory ModifierParameter.fromJson(Map<String, dynamic> json) => _$ModifierParameterFromJson(json);
}