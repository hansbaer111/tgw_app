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
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get ownerId => throw _privateConstructorUsedError; // Added ownerId
  ExerciseTags get tags =>
      throw _privateConstructorUsedError; // Changed to single ExerciseTags object
  List<ExerciseModifier> get modifiers =>
      throw _privateConstructorUsedError; // Added modifiers
  String? get videoUrl => throw _privateConstructorUsedError;

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
      {String id,
      String name,
      String description,
      String ownerId,
      ExerciseTags tags,
      List<ExerciseModifier> modifiers,
      String? videoUrl});

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
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? ownerId = null,
    Object? tags = null,
    Object? modifiers = null,
    Object? videoUrl = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      ownerId: null == ownerId
          ? _value.ownerId
          : ownerId // ignore: cast_nullable_to_non_nullable
              as String,
      tags: null == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as ExerciseTags,
      modifiers: null == modifiers
          ? _value.modifiers
          : modifiers // ignore: cast_nullable_to_non_nullable
              as List<ExerciseModifier>,
      videoUrl: freezed == videoUrl
          ? _value.videoUrl
          : videoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
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
      {String id,
      String name,
      String description,
      String ownerId,
      ExerciseTags tags,
      List<ExerciseModifier> modifiers,
      String? videoUrl});

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
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? ownerId = null,
    Object? tags = null,
    Object? modifiers = null,
    Object? videoUrl = freezed,
  }) {
    return _then(_$ExerciseModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      ownerId: null == ownerId
          ? _value.ownerId
          : ownerId // ignore: cast_nullable_to_non_nullable
              as String,
      tags: null == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as ExerciseTags,
      modifiers: null == modifiers
          ? _value._modifiers
          : modifiers // ignore: cast_nullable_to_non_nullable
              as List<ExerciseModifier>,
      videoUrl: freezed == videoUrl
          ? _value.videoUrl
          : videoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ExerciseModelImpl implements _ExerciseModel {
  const _$ExerciseModelImpl(
      {required this.id,
      required this.name,
      required this.description,
      required this.ownerId,
      required this.tags,
      required final List<ExerciseModifier> modifiers,
      this.videoUrl})
      : _modifiers = modifiers;

  factory _$ExerciseModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ExerciseModelImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String description;
  @override
  final String ownerId;
// Added ownerId
  @override
  final ExerciseTags tags;
// Changed to single ExerciseTags object
  final List<ExerciseModifier> _modifiers;
// Changed to single ExerciseTags object
  @override
  List<ExerciseModifier> get modifiers {
    if (_modifiers is EqualUnmodifiableListView) return _modifiers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_modifiers);
  }

// Added modifiers
  @override
  final String? videoUrl;

  @override
  String toString() {
    return 'ExerciseModel(id: $id, name: $name, description: $description, ownerId: $ownerId, tags: $tags, modifiers: $modifiers, videoUrl: $videoUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExerciseModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.ownerId, ownerId) || other.ownerId == ownerId) &&
            (identical(other.tags, tags) || other.tags == tags) &&
            const DeepCollectionEquality()
                .equals(other._modifiers, _modifiers) &&
            (identical(other.videoUrl, videoUrl) ||
                other.videoUrl == videoUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, description, ownerId,
      tags, const DeepCollectionEquality().hash(_modifiers), videoUrl);

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
      {required final String id,
      required final String name,
      required final String description,
      required final String ownerId,
      required final ExerciseTags tags,
      required final List<ExerciseModifier> modifiers,
      final String? videoUrl}) = _$ExerciseModelImpl;

  factory _ExerciseModel.fromJson(Map<String, dynamic> json) =
      _$ExerciseModelImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get description;
  @override
  String get ownerId; // Added ownerId
  @override
  ExerciseTags get tags; // Changed to single ExerciseTags object
  @override
  List<ExerciseModifier> get modifiers; // Added modifiers
  @override
  String? get videoUrl;

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
  List<String> get equipment => throw _privateConstructorUsedError;
  List<String> get primaryMuscle => throw _privateConstructorUsedError;
  List<String> get secondaryMuscles => throw _privateConstructorUsedError;
  List<String> get movementPattern => throw _privateConstructorUsedError;

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
      {List<String> equipment,
      List<String> primaryMuscle,
      List<String> secondaryMuscles,
      List<String> movementPattern});
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
    Object? primaryMuscle = null,
    Object? secondaryMuscles = null,
    Object? movementPattern = null,
  }) {
    return _then(_value.copyWith(
      equipment: null == equipment
          ? _value.equipment
          : equipment // ignore: cast_nullable_to_non_nullable
              as List<String>,
      primaryMuscle: null == primaryMuscle
          ? _value.primaryMuscle
          : primaryMuscle // ignore: cast_nullable_to_non_nullable
              as List<String>,
      secondaryMuscles: null == secondaryMuscles
          ? _value.secondaryMuscles
          : secondaryMuscles // ignore: cast_nullable_to_non_nullable
              as List<String>,
      movementPattern: null == movementPattern
          ? _value.movementPattern
          : movementPattern // ignore: cast_nullable_to_non_nullable
              as List<String>,
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
      {List<String> equipment,
      List<String> primaryMuscle,
      List<String> secondaryMuscles,
      List<String> movementPattern});
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
    Object? primaryMuscle = null,
    Object? secondaryMuscles = null,
    Object? movementPattern = null,
  }) {
    return _then(_$ExerciseTagsImpl(
      equipment: null == equipment
          ? _value._equipment
          : equipment // ignore: cast_nullable_to_non_nullable
              as List<String>,
      primaryMuscle: null == primaryMuscle
          ? _value._primaryMuscle
          : primaryMuscle // ignore: cast_nullable_to_non_nullable
              as List<String>,
      secondaryMuscles: null == secondaryMuscles
          ? _value._secondaryMuscles
          : secondaryMuscles // ignore: cast_nullable_to_non_nullable
              as List<String>,
      movementPattern: null == movementPattern
          ? _value._movementPattern
          : movementPattern // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ExerciseTagsImpl implements _ExerciseTags {
  const _$ExerciseTagsImpl(
      {final List<String> equipment = const [],
      final List<String> primaryMuscle = const [],
      final List<String> secondaryMuscles = const [],
      final List<String> movementPattern = const []})
      : _equipment = equipment,
        _primaryMuscle = primaryMuscle,
        _secondaryMuscles = secondaryMuscles,
        _movementPattern = movementPattern;

  factory _$ExerciseTagsImpl.fromJson(Map<String, dynamic> json) =>
      _$$ExerciseTagsImplFromJson(json);

  final List<String> _equipment;
  @override
  @JsonKey()
  List<String> get equipment {
    if (_equipment is EqualUnmodifiableListView) return _equipment;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_equipment);
  }

  final List<String> _primaryMuscle;
  @override
  @JsonKey()
  List<String> get primaryMuscle {
    if (_primaryMuscle is EqualUnmodifiableListView) return _primaryMuscle;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_primaryMuscle);
  }

  final List<String> _secondaryMuscles;
  @override
  @JsonKey()
  List<String> get secondaryMuscles {
    if (_secondaryMuscles is EqualUnmodifiableListView)
      return _secondaryMuscles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_secondaryMuscles);
  }

  final List<String> _movementPattern;
  @override
  @JsonKey()
  List<String> get movementPattern {
    if (_movementPattern is EqualUnmodifiableListView) return _movementPattern;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_movementPattern);
  }

  @override
  String toString() {
    return 'ExerciseTags(equipment: $equipment, primaryMuscle: $primaryMuscle, secondaryMuscles: $secondaryMuscles, movementPattern: $movementPattern)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExerciseTagsImpl &&
            const DeepCollectionEquality()
                .equals(other._equipment, _equipment) &&
            const DeepCollectionEquality()
                .equals(other._primaryMuscle, _primaryMuscle) &&
            const DeepCollectionEquality()
                .equals(other._secondaryMuscles, _secondaryMuscles) &&
            const DeepCollectionEquality()
                .equals(other._movementPattern, _movementPattern));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_equipment),
      const DeepCollectionEquality().hash(_primaryMuscle),
      const DeepCollectionEquality().hash(_secondaryMuscles),
      const DeepCollectionEquality().hash(_movementPattern));

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
      {final List<String> equipment,
      final List<String> primaryMuscle,
      final List<String> secondaryMuscles,
      final List<String> movementPattern}) = _$ExerciseTagsImpl;

  factory _ExerciseTags.fromJson(Map<String, dynamic> json) =
      _$ExerciseTagsImpl.fromJson;

  @override
  List<String> get equipment;
  @override
  List<String> get primaryMuscle;
  @override
  List<String> get secondaryMuscles;
  @override
  List<String> get movementPattern;

  /// Create a copy of ExerciseTags
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ExerciseTagsImplCopyWith<_$ExerciseTagsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
