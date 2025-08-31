// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'exercise_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ExerciseModel _$ExerciseModelFromJson(Map<String, dynamic> json) {
  return _ExerciseModel.fromJson(json);
}

/// @nodoc
mixin _$ExerciseModel {
  String get exerciseId => throw _privateConstructorUsedError;
  String get baseExerciseId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError; // Added back
  String? get videoUrl => throw _privateConstructorUsedError;
  String get ownerId => throw _privateConstructorUsedError;
  ExerciseTags get tags => throw _privateConstructorUsedError;
  List<ExerciseModifier>? get modifiers => throw _privateConstructorUsedError;

  /// Serializes this ExerciseModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ExerciseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ExerciseModelCopyWith<ExerciseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExerciseModelCopyWith<$Res> {
  factory $ExerciseModelCopyWith(
          ExerciseModel value, $Res Function(ExerciseModel) then) =
      _$ExerciseModelCopyWithImpl<$Res, ExerciseModel>;
  @useResult
  $Res call(
      {String exerciseId,
      String baseExerciseId,
      String name,
      String? description,
      String? videoUrl,
      String ownerId,
      ExerciseTags tags,
      List<ExerciseModifier>? modifiers});

  $ExerciseTagsCopyWith<$Res> get tags;
}

/// @nodoc
class _$ExerciseModelCopyWithImpl<$Res, $Val extends ExerciseModel>
    implements $ExerciseModelCopyWith<$Res> {
  _$ExerciseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ExerciseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? exerciseId = null,
    Object? baseExerciseId = null,
    Object? name = null,
    Object? description = freezed,
    Object? videoUrl = freezed,
    Object? ownerId = null,
    Object? tags = null,
    Object? modifiers = freezed,
  }) {
    return _then(_value.copyWith(
      exerciseId: null == exerciseId
          ? _value.exerciseId
          : exerciseId // ignore: cast_nullable_to_non_nullable
              as String,
      baseExerciseId: null == baseExerciseId
          ? _value.baseExerciseId
          : baseExerciseId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      videoUrl: freezed == videoUrl
          ? _value.videoUrl
          : videoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      ownerId: null == ownerId
          ? _value.ownerId
          : ownerId // ignore: cast_nullable_to_non_nullable
              as String,
      tags: null == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as ExerciseTags,
      modifiers: freezed == modifiers
          ? _value.modifiers
          : modifiers // ignore: cast_nullable_to_non_nullable
              as List<ExerciseModifier>?,
    ) as $Val);
  }

  /// Create a copy of ExerciseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ExerciseTagsCopyWith<$Res> get tags {
    return $ExerciseTagsCopyWith<$Res>(_value.tags, (value) {
      return _then(_value.copyWith(tags: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ExerciseModelImplCopyWith<$Res>
    implements $ExerciseModelCopyWith<$Res> {
  factory _$$ExerciseModelImplCopyWith(
          _$ExerciseModelImpl value, $Res Function(_$ExerciseModelImpl) then) =
      __$$ExerciseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String exerciseId,
      String baseExerciseId,
      String name,
      String? description,
      String? videoUrl,
      String ownerId,
      ExerciseTags tags,
      List<ExerciseModifier>? modifiers});

  @override
  $ExerciseTagsCopyWith<$Res> get tags;
}

/// @nodoc
class __$$ExerciseModelImplCopyWithImpl<$Res>
    extends _$ExerciseModelCopyWithImpl<$Res, _$ExerciseModelImpl>
    implements _$$ExerciseModelImplCopyWith<$Res> {
  __$$ExerciseModelImplCopyWithImpl(
      _$ExerciseModelImpl _value, $Res Function(_$ExerciseModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of ExerciseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? exerciseId = null,
    Object? baseExerciseId = null,
    Object? name = null,
    Object? description = freezed,
    Object? videoUrl = freezed,
    Object? ownerId = null,
    Object? tags = null,
    Object? modifiers = freezed,
  }) {
    return _then(_$ExerciseModelImpl(
      exerciseId: null == exerciseId
          ? _value.exerciseId
          : exerciseId // ignore: cast_nullable_to_non_nullable
              as String,
      baseExerciseId: null == baseExerciseId
          ? _value.baseExerciseId
          : baseExerciseId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      videoUrl: freezed == videoUrl
          ? _value.videoUrl
          : videoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      ownerId: null == ownerId
          ? _value.ownerId
          : ownerId // ignore: cast_nullable_to_non_nullable
              as String,
      tags: null == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as ExerciseTags,
      modifiers: freezed == modifiers
          ? _value._modifiers
          : modifiers // ignore: cast_nullable_to_non_nullable
              as List<ExerciseModifier>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ExerciseModelImpl implements _ExerciseModel {
  const _$ExerciseModelImpl(
      {required this.exerciseId,
      required this.baseExerciseId,
      required this.name,
      this.description,
      this.videoUrl,
      required this.ownerId,
      required this.tags,
      final List<ExerciseModifier>? modifiers})
      : _modifiers = modifiers;

  factory _$ExerciseModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ExerciseModelImplFromJson(json);

  @override
  final String exerciseId;
  @override
  final String baseExerciseId;
  @override
  final String name;
  @override
  final String? description;
// Added back
  @override
  final String? videoUrl;
  @override
  final String ownerId;
  @override
  final ExerciseTags tags;
  final List<ExerciseModifier>? _modifiers;
  @override
  List<ExerciseModifier>? get modifiers {
    final value = _modifiers;
    if (value == null) return null;
    if (_modifiers is EqualUnmodifiableListView) return _modifiers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ExerciseModel(exerciseId: $exerciseId, baseExerciseId: $baseExerciseId, name: $name, description: $description, videoUrl: $videoUrl, ownerId: $ownerId, tags: $tags, modifiers: $modifiers)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExerciseModelImpl &&
            (identical(other.exerciseId, exerciseId) ||
                other.exerciseId == exerciseId) &&
            (identical(other.baseExerciseId, baseExerciseId) ||
                other.baseExerciseId == baseExerciseId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.videoUrl, videoUrl) ||
                other.videoUrl == videoUrl) &&
            (identical(other.ownerId, ownerId) || other.ownerId == ownerId) &&
            (identical(other.tags, tags) || other.tags == tags) &&
            const DeepCollectionEquality()
                .equals(other._modifiers, _modifiers));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      exerciseId,
      baseExerciseId,
      name,
      description,
      videoUrl,
      ownerId,
      tags,
      const DeepCollectionEquality().hash(_modifiers));

  /// Create a copy of ExerciseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ExerciseModelImplCopyWith<_$ExerciseModelImpl> get copyWith =>
      __$$ExerciseModelImplCopyWithImpl<_$ExerciseModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ExerciseModelImplToJson(
      this,
    );
  }
}

abstract class _ExerciseModel implements ExerciseModel {
  const factory _ExerciseModel(
      {required final String exerciseId,
      required final String baseExerciseId,
      required final String name,
      final String? description,
      final String? videoUrl,
      required final String ownerId,
      required final ExerciseTags tags,
      final List<ExerciseModifier>? modifiers}) = _$ExerciseModelImpl;

  factory _ExerciseModel.fromJson(Map<String, dynamic> json) =
      _$ExerciseModelImpl.fromJson;

  @override
  String get exerciseId;
  @override
  String get baseExerciseId;
  @override
  String get name;
  @override
  String? get description; // Added back
  @override
  String? get videoUrl;
  @override
  String get ownerId;
  @override
  ExerciseTags get tags;
  @override
  List<ExerciseModifier>? get modifiers;

  /// Create a copy of ExerciseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ExerciseModelImplCopyWith<_$ExerciseModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ExerciseTags _$ExerciseTagsFromJson(Map<String, dynamic> json) {
  return _ExerciseTags.fromJson(json);
}

/// @nodoc
mixin _$ExerciseTags {
  String get equipment =>
      throw _privateConstructorUsedError; // Changed to String
  String get movementPattern =>
      throw _privateConstructorUsedError; // Changed to String
  String get primaryMuscle =>
      throw _privateConstructorUsedError; // Changed to String
  List<String>? get secondaryMuscles => throw _privateConstructorUsedError;

  /// Serializes this ExerciseTags to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ExerciseTags
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ExerciseTagsCopyWith<ExerciseTags> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExerciseTagsCopyWith<$Res> {
  factory $ExerciseTagsCopyWith(
          ExerciseTags value, $Res Function(ExerciseTags) then) =
      _$ExerciseTagsCopyWithImpl<$Res, ExerciseTags>;
  @useResult
  $Res call(
      {String equipment,
      String movementPattern,
      String primaryMuscle,
      List<String>? secondaryMuscles});
}

/// @nodoc
class _$ExerciseTagsCopyWithImpl<$Res, $Val extends ExerciseTags>
    implements $ExerciseTagsCopyWith<$Res> {
  _$ExerciseTagsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ExerciseTags
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? equipment = null,
    Object? movementPattern = null,
    Object? primaryMuscle = null,
    Object? secondaryMuscles = freezed,
  }) {
    return _then(_value.copyWith(
      equipment: null == equipment
          ? _value.equipment
          : equipment // ignore: cast_nullable_to_non_nullable
              as String,
      movementPattern: null == movementPattern
          ? _value.movementPattern
          : movementPattern // ignore: cast_nullable_to_non_nullable
              as String,
      primaryMuscle: null == primaryMuscle
          ? _value.primaryMuscle
          : primaryMuscle // ignore: cast_nullable_to_non_nullable
              as String,
      secondaryMuscles: freezed == secondaryMuscles
          ? _value.secondaryMuscles
          : secondaryMuscles // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ExerciseTagsImplCopyWith<$Res>
    implements $ExerciseTagsCopyWith<$Res> {
  factory _$$ExerciseTagsImplCopyWith(
          _$ExerciseTagsImpl value, $Res Function(_$ExerciseTagsImpl) then) =
      __$$ExerciseTagsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String equipment,
      String movementPattern,
      String primaryMuscle,
      List<String>? secondaryMuscles});
}

/// @nodoc
class __$$ExerciseTagsImplCopyWithImpl<$Res>
    extends _$ExerciseTagsCopyWithImpl<$Res, _$ExerciseTagsImpl>
    implements _$$ExerciseTagsImplCopyWith<$Res> {
  __$$ExerciseTagsImplCopyWithImpl(
      _$ExerciseTagsImpl _value, $Res Function(_$ExerciseTagsImpl) _then)
      : super(_value, _then);

  /// Create a copy of ExerciseTags
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? equipment = null,
    Object? movementPattern = null,
    Object? primaryMuscle = null,
    Object? secondaryMuscles = freezed,
  }) {
    return _then(_$ExerciseTagsImpl(
      equipment: null == equipment
          ? _value.equipment
          : equipment // ignore: cast_nullable_to_non_nullable
              as String,
      movementPattern: null == movementPattern
          ? _value.movementPattern
          : movementPattern // ignore: cast_nullable_to_non_nullable
              as String,
      primaryMuscle: null == primaryMuscle
          ? _value.primaryMuscle
          : primaryMuscle // ignore: cast_nullable_to_non_nullable
              as String,
      secondaryMuscles: freezed == secondaryMuscles
          ? _value._secondaryMuscles
          : secondaryMuscles // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ExerciseTagsImpl implements _ExerciseTags {
  const _$ExerciseTagsImpl(
      {required this.equipment,
      required this.movementPattern,
      required this.primaryMuscle,
      final List<String>? secondaryMuscles})
      : _secondaryMuscles = secondaryMuscles;

  factory _$ExerciseTagsImpl.fromJson(Map<String, dynamic> json) =>
      _$$ExerciseTagsImplFromJson(json);

  @override
  final String equipment;
// Changed to String
  @override
  final String movementPattern;
// Changed to String
  @override
  final String primaryMuscle;
// Changed to String
  final List<String>? _secondaryMuscles;
// Changed to String
  @override
  List<String>? get secondaryMuscles {
    final value = _secondaryMuscles;
    if (value == null) return null;
    if (_secondaryMuscles is EqualUnmodifiableListView)
      return _secondaryMuscles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ExerciseTags(equipment: $equipment, movementPattern: $movementPattern, primaryMuscle: $primaryMuscle, secondaryMuscles: $secondaryMuscles)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExerciseTagsImpl &&
            (identical(other.equipment, equipment) ||
                other.equipment == equipment) &&
            (identical(other.movementPattern, movementPattern) ||
                other.movementPattern == movementPattern) &&
            (identical(other.primaryMuscle, primaryMuscle) ||
                other.primaryMuscle == primaryMuscle) &&
            const DeepCollectionEquality()
                .equals(other._secondaryMuscles, _secondaryMuscles));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, equipment, movementPattern,
      primaryMuscle, const DeepCollectionEquality().hash(_secondaryMuscles));

  /// Create a copy of ExerciseTags
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ExerciseTagsImplCopyWith<_$ExerciseTagsImpl> get copyWith =>
      __$$ExerciseTagsImplCopyWithImpl<_$ExerciseTagsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ExerciseTagsImplToJson(
      this,
    );
  }
}

abstract class _ExerciseTags implements ExerciseTags {
  const factory _ExerciseTags(
      {required final String equipment,
      required final String movementPattern,
      required final String primaryMuscle,
      final List<String>? secondaryMuscles}) = _$ExerciseTagsImpl;

  factory _ExerciseTags.fromJson(Map<String, dynamic> json) =
      _$ExerciseTagsImpl.fromJson;

  @override
  String get equipment; // Changed to String
  @override
  String get movementPattern; // Changed to String
  @override
  String get primaryMuscle; // Changed to String
  @override
  List<String>? get secondaryMuscles;

  /// Create a copy of ExerciseTags
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ExerciseTagsImplCopyWith<_$ExerciseTagsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
