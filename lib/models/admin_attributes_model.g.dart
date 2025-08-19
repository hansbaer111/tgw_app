// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_attributes_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AdminAttributesModelImpl _$$AdminAttributesModelImplFromJson(
        Map<String, dynamic> json) =>
    _$AdminAttributesModelImpl(
      equipmentTypes: (json['equipmentTypes'] as List<dynamic>)
          .map((e) => EquipmentType.fromJson(e as Map<String, dynamic>))
          .toList(),
      muscleGroups: (json['muscleGroups'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      movementPatterns: (json['movementPatterns'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      exerciseModifiers: (json['exerciseModifiers'] as List<dynamic>)
          .map((e) => ExerciseModifier.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$AdminAttributesModelImplToJson(
        _$AdminAttributesModelImpl instance) =>
    <String, dynamic>{
      'equipmentTypes': instance.equipmentTypes,
      'muscleGroups': instance.muscleGroups,
      'movementPatterns': instance.movementPatterns,
      'exerciseModifiers': instance.exerciseModifiers,
    };

_$EquipmentTypeImpl _$$EquipmentTypeImplFromJson(Map<String, dynamic> json) =>
    _$EquipmentTypeImpl(
      id: json['id'] as String,
      name: json['name'] as String,
    );

Map<String, dynamic> _$$EquipmentTypeImplToJson(_$EquipmentTypeImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

_$ExerciseModifierImpl _$$ExerciseModifierImplFromJson(
        Map<String, dynamic> json) =>
    _$ExerciseModifierImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      parameter: $enumDecode(_$ModifierParameterEnumMap, json['parameter']),
      valueType: $enumDecode(_$ValueTypeEnumMap, json['valueType']),
    );

Map<String, dynamic> _$$ExerciseModifierImplToJson(
        _$ExerciseModifierImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'parameter': _$ModifierParameterEnumMap[instance.parameter]!,
      'valueType': _$ValueTypeEnumMap[instance.valueType]!,
    };

const _$ModifierParameterEnumMap = {
  ModifierParameter.reps: 'reps',
  ModifierParameter.weight: 'weight',
  ModifierParameter.duration: 'duration',
  ModifierParameter.distance: 'distance',
};

const _$ValueTypeEnumMap = {
  ValueType.numeric: 'numeric',
  ValueType.text: 'text',
  ValueType.boolean: 'boolean',
};
