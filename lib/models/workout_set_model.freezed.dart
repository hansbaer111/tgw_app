// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'workout_set_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

WorkoutSetModel _$WorkoutSetModelFromJson(Map<String, dynamic> json) {
  return _WorkoutSetModel.fromJson(json);
}

/// @nodoc
mixin _$WorkoutSetModel {
  int get setNumber => throw _privateConstructorUsedError;
  String get reps => throw _privateConstructorUsedError;
  String get rpe => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;

  /// Serializes this WorkoutSetModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WorkoutSetModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WorkoutSetModelCopyWith<WorkoutSetModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkoutSetModelCopyWith<$Res> {
  factory $WorkoutSetModelCopyWith(
          WorkoutSetModel value, $Res Function(WorkoutSetModel) then) =
      _$WorkoutSetModelCopyWithImpl<$Res, WorkoutSetModel>;
  @useResult
  $Res call({int setNumber, String reps, String rpe, String? notes});
}

/// @nodoc
class _$WorkoutSetModelCopyWithImpl<$Res, $Val extends WorkoutSetModel>
    implements $WorkoutSetModelCopyWith<$Res> {
  _$WorkoutSetModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WorkoutSetModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? setNumber = null,
    Object? reps = null,
    Object? rpe = null,
    Object? notes = freezed,
  }) {
    return _then(_value.copyWith(
      setNumber: null == setNumber
          ? _value.setNumber
          : setNumber // ignore: cast_nullable_to_non_nullable
              as int,
      reps: null == reps
          ? _value.reps
          : reps // ignore: cast_nullable_to_non_nullable
              as String,
      rpe: null == rpe
          ? _value.rpe
          : rpe // ignore: cast_nullable_to_non_nullable
              as String,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WorkoutSetModelImplCopyWith<$Res>
    implements $WorkoutSetModelCopyWith<$Res> {
  factory _$$WorkoutSetModelImplCopyWith(_$WorkoutSetModelImpl value,
          $Res Function(_$WorkoutSetModelImpl) then) =
      __$$WorkoutSetModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int setNumber, String reps, String rpe, String? notes});
}

/// @nodoc
class __$$WorkoutSetModelImplCopyWithImpl<$Res>
    extends _$WorkoutSetModelCopyWithImpl<$Res, _$WorkoutSetModelImpl>
    implements _$$WorkoutSetModelImplCopyWith<$Res> {
  __$$WorkoutSetModelImplCopyWithImpl(
      _$WorkoutSetModelImpl _value, $Res Function(_$WorkoutSetModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of WorkoutSetModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? setNumber = null,
    Object? reps = null,
    Object? rpe = null,
    Object? notes = freezed,
  }) {
    return _then(_$WorkoutSetModelImpl(
      setNumber: null == setNumber
          ? _value.setNumber
          : setNumber // ignore: cast_nullable_to_non_nullable
              as int,
      reps: null == reps
          ? _value.reps
          : reps // ignore: cast_nullable_to_non_nullable
              as String,
      rpe: null == rpe
          ? _value.rpe
          : rpe // ignore: cast_nullable_to_non_nullable
              as String,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WorkoutSetModelImpl implements _WorkoutSetModel {
  const _$WorkoutSetModelImpl(
      {required this.setNumber,
      required this.reps,
      required this.rpe,
      this.notes});

  factory _$WorkoutSetModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$WorkoutSetModelImplFromJson(json);

  @override
  final int setNumber;
  @override
  final String reps;
  @override
  final String rpe;
  @override
  final String? notes;

  @override
  String toString() {
    return 'WorkoutSetModel(setNumber: $setNumber, reps: $reps, rpe: $rpe, notes: $notes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WorkoutSetModelImpl &&
            (identical(other.setNumber, setNumber) ||
                other.setNumber == setNumber) &&
            (identical(other.reps, reps) || other.reps == reps) &&
            (identical(other.rpe, rpe) || other.rpe == rpe) &&
            (identical(other.notes, notes) || other.notes == notes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, setNumber, reps, rpe, notes);

  /// Create a copy of WorkoutSetModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WorkoutSetModelImplCopyWith<_$WorkoutSetModelImpl> get copyWith =>
      __$$WorkoutSetModelImplCopyWithImpl<_$WorkoutSetModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WorkoutSetModelImplToJson(
      this,
    );
  }
}

abstract class _WorkoutSetModel implements WorkoutSetModel {
  const factory _WorkoutSetModel(
      {required final int setNumber,
      required final String reps,
      required final String rpe,
      final String? notes}) = _$WorkoutSetModelImpl;

  factory _WorkoutSetModel.fromJson(Map<String, dynamic> json) =
      _$WorkoutSetModelImpl.fromJson;

  @override
  int get setNumber;
  @override
  String get reps;
  @override
  String get rpe;
  @override
  String? get notes;

  /// Create a copy of WorkoutSetModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WorkoutSetModelImplCopyWith<_$WorkoutSetModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
