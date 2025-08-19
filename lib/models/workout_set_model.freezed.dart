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
  int get reps => throw _privateConstructorUsedError; // Changed to int
  double get weight => throw _privateConstructorUsedError; // Added weight
  String? get rpe => throw _privateConstructorUsedError; // Made optional
  String? get notes => throw _privateConstructorUsedError;
  bool get isCompleted => throw _privateConstructorUsedError;

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
  $Res call(
      {int setNumber,
      int reps,
      double weight,
      String? rpe,
      String? notes,
      bool isCompleted});
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
    Object? weight = null,
    Object? rpe = freezed,
    Object? notes = freezed,
    Object? isCompleted = null,
  }) {
    return _then(_value.copyWith(
      setNumber: null == setNumber
          ? _value.setNumber
          : setNumber // ignore: cast_nullable_to_non_nullable
              as int,
      reps: null == reps
          ? _value.reps
          : reps // ignore: cast_nullable_to_non_nullable
              as int,
      weight: null == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as double,
      rpe: freezed == rpe
          ? _value.rpe
          : rpe // ignore: cast_nullable_to_non_nullable
              as String?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      isCompleted: null == isCompleted
          ? _value.isCompleted
          : isCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
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
  $Res call(
      {int setNumber,
      int reps,
      double weight,
      String? rpe,
      String? notes,
      bool isCompleted});
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
    Object? weight = null,
    Object? rpe = freezed,
    Object? notes = freezed,
    Object? isCompleted = null,
  }) {
    return _then(_$WorkoutSetModelImpl(
      setNumber: null == setNumber
          ? _value.setNumber
          : setNumber // ignore: cast_nullable_to_non_nullable
              as int,
      reps: null == reps
          ? _value.reps
          : reps // ignore: cast_nullable_to_non_nullable
              as int,
      weight: null == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as double,
      rpe: freezed == rpe
          ? _value.rpe
          : rpe // ignore: cast_nullable_to_non_nullable
              as String?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      isCompleted: null == isCompleted
          ? _value.isCompleted
          : isCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WorkoutSetModelImpl implements _WorkoutSetModel {
  const _$WorkoutSetModelImpl(
      {required this.setNumber,
      required this.reps,
      required this.weight,
      this.rpe,
      this.notes,
      this.isCompleted = false});

  factory _$WorkoutSetModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$WorkoutSetModelImplFromJson(json);

  @override
  final int setNumber;
  @override
  final int reps;
// Changed to int
  @override
  final double weight;
// Added weight
  @override
  final String? rpe;
// Made optional
  @override
  final String? notes;
  @override
  @JsonKey()
  final bool isCompleted;

  @override
  String toString() {
    return 'WorkoutSetModel(setNumber: $setNumber, reps: $reps, weight: $weight, rpe: $rpe, notes: $notes, isCompleted: $isCompleted)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WorkoutSetModelImpl &&
            (identical(other.setNumber, setNumber) ||
                other.setNumber == setNumber) &&
            (identical(other.reps, reps) || other.reps == reps) &&
            (identical(other.weight, weight) || other.weight == weight) &&
            (identical(other.rpe, rpe) || other.rpe == rpe) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.isCompleted, isCompleted) ||
                other.isCompleted == isCompleted));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, setNumber, reps, weight, rpe, notes, isCompleted);

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
      required final int reps,
      required final double weight,
      final String? rpe,
      final String? notes,
      final bool isCompleted}) = _$WorkoutSetModelImpl;

  factory _WorkoutSetModel.fromJson(Map<String, dynamic> json) =
      _$WorkoutSetModelImpl.fromJson;

  @override
  int get setNumber;
  @override
  int get reps; // Changed to int
  @override
  double get weight; // Added weight
  @override
  String? get rpe; // Made optional
  @override
  String? get notes;
  @override
  bool get isCompleted;

  /// Create a copy of WorkoutSetModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WorkoutSetModelImplCopyWith<_$WorkoutSetModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
