// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exercise_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ExerciseModelImpl _$$ExerciseModelImplFromJson(Map<String, dynamic> json) =>
    _$ExerciseModelImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      muscleGroups: (json['muscleGroups'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      equipment:
          (json['equipment'] as List<dynamic>).map((e) => e as String).toList(),
      movementPattern: json['movementPattern'] as String,
      tags: (json['tags'] as List<dynamic>)
          .map((e) => ExerciseTags.fromJson(e as Map<String, dynamic>))
          .toList(),
      videoUrl: json['videoUrl'] as String?,
    );

Map<String, dynamic> _$$ExerciseModelImplToJson(_$ExerciseModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'muscleGroups': instance.muscleGroups,
      'equipment': instance.equipment,
      'movementPattern': instance.movementPattern,
      'tags': instance.tags,
      'videoUrl': instance.videoUrl,
    };

_$ExerciseTagsImpl _$$ExerciseTagsImplFromJson(Map<String, dynamic> json) =>
    _$ExerciseTagsImpl(
      name: json['name'] as String,
      value: json['value'] as String,
    );

Map<String, dynamic> _$$ExerciseTagsImplToJson(_$ExerciseTagsImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'value': instance.value,
    };
