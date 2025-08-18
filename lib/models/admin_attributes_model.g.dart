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
      parameters: (json['parameters'] as List<dynamic>)
          .map((e) => ModifierParameter.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ExerciseModifierImplToJson(
        _$ExerciseModifierImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'parameters': instance.parameters,
    };

_$ModifierParameterImpl _$$ModifierParameterImplFromJson(
        Map<String, dynamic> json) =>
    _$ModifierParameterImpl(
      name: json['name'] as String,
      type: json['type'] as String,
      defaultValue: json['defaultValue'],
    );

Map<String, dynamic> _$$ModifierParameterImplToJson(
        _$ModifierParameterImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'type': instance.type,
      'defaultValue': instance.defaultValue,
    };
