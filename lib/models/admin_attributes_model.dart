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

enum ModifierParameter {
  reps,
  weight,
  duration,
  distance,
}

enum ValueType {
  numeric,
  text,
  boolean,
}

@freezed
class ExerciseModifier with _$ExerciseModifier {
  const factory ExerciseModifier({
    required String id,
    required String name,
    required ModifierParameter parameter, // Changed to single parameter
    required ValueType valueType, // Added valueType
  }) = _ExerciseModifier;

  factory ExerciseModifier.fromJson(Map<String, dynamic> json) => _$ExerciseModifierFromJson(json);
}