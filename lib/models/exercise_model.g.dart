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
      ownerId: json['ownerId'] as String,
      tags: ExerciseTags.fromJson(json['tags'] as Map<String, dynamic>),
      modifiers: (json['modifiers'] as List<dynamic>)
          .map((e) => ExerciseModifier.fromJson(e as Map<String, dynamic>))
          .toList(),
      videoUrl: json['videoUrl'] as String?,
    );

Map<String, dynamic> _$$ExerciseModelImplToJson(_$ExerciseModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'ownerId': instance.ownerId,
      'tags': instance.tags,
      'modifiers': instance.modifiers,
      'videoUrl': instance.videoUrl,
    };

_$ExerciseTagsImpl _$$ExerciseTagsImplFromJson(Map<String, dynamic> json) =>
    _$ExerciseTagsImpl(
      equipment: (json['equipment'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      primaryMuscle: (json['primaryMuscle'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      secondaryMuscles: (json['secondaryMuscles'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      movementPattern: (json['movementPattern'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$ExerciseTagsImplToJson(_$ExerciseTagsImpl instance) =>
    <String, dynamic>{
      'equipment': instance.equipment,
      'primaryMuscle': instance.primaryMuscle,
      'secondaryMuscles': instance.secondaryMuscles,
      'movementPattern': instance.movementPattern,
    };
