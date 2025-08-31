// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exercise_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ExerciseModelImpl _$$ExerciseModelImplFromJson(Map<String, dynamic> json) =>
    _$ExerciseModelImpl(
      exerciseId: json['exerciseId'] as String,
      baseExerciseId: json['baseExerciseId'] as String,
      name: json['name'] as String,
      description: json['description'] as String?,
      videoUrl: json['videoUrl'] as String?,
      ownerId: json['ownerId'] as String,
      tags: ExerciseTags.fromJson(json['tags'] as Map<String, dynamic>),
      modifiers: (json['modifiers'] as List<dynamic>?)
          ?.map((e) => ExerciseModifier.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ExerciseModelImplToJson(_$ExerciseModelImpl instance) =>
    <String, dynamic>{
      'exerciseId': instance.exerciseId,
      'baseExerciseId': instance.baseExerciseId,
      'name': instance.name,
      'description': instance.description,
      'videoUrl': instance.videoUrl,
      'ownerId': instance.ownerId,
      'tags': instance.tags,
      'modifiers': instance.modifiers,
    };

_$ExerciseTagsImpl _$$ExerciseTagsImplFromJson(Map<String, dynamic> json) =>
    _$ExerciseTagsImpl(
      equipment: json['equipment'] as String,
      movementPattern: json['movementPattern'] as String,
      primaryMuscle: json['primaryMuscle'] as String,
      secondaryMuscles: (json['secondaryMuscles'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$ExerciseTagsImplToJson(_$ExerciseTagsImpl instance) =>
    <String, dynamic>{
      'equipment': instance.equipment,
      'movementPattern': instance.movementPattern,
      'primaryMuscle': instance.primaryMuscle,
      'secondaryMuscles': instance.secondaryMuscles,
    };
